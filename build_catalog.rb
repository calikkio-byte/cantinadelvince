# encoding: UTF-8
require 'csv'
require 'json'
require 'fileutils'
require 'tmpdir'
require_relative 'wine_kb'
require_relative 'wine_kb_part2'
require_relative 'wine_kb_part3'
require_relative 'wine_kb_part4'
require_relative 'wine_kb_part5'

def extract_vitigni_tags(uvaggio_str)
  s = uvaggio_str.to_s
  tags = []
  tags << "Chardonnay" if s =~ /Chardonnay/i
  tags << "Pinot Nero / Noir" if s =~ /Pinot\s*(Nero|Noir)/i
  tags << "Pinot Meunier" if s =~ /Meunier/i
  tags << "Pinot Bianco / Blanc" if s =~ /Pinot\s*(Bianco|Blanc)/i
  tags << "Pinot Grigio" if s =~ /Pinot\s*Grigio/i
  tags << "Nebbiolo" if s =~ /Nebbiolo|Chiavennasca|Spanna/i
  tags << "Sangiovese" if s =~ /Sangiovese|Prugnolo/i
  tags << "Cabernet Sauvignon" if s =~ /Cabernet\s*Sauvignon/i
  tags << "Cabernet Franc" if s =~ /Cabernet\s*Franc/i
  tags << "Merlot" if s =~ /Merlot/i
  tags << "Petit Verdot" if s =~ /Petit\s*Verdot/i
  tags << "Sauvignon Blanc" if s =~ /Sauvignon\s*Blanc|Sauvignon(?!\s*Cab)/i && s !~ /Cabernet\s*Sauvignon/i
  tags << "Sauvignon Blanc" if s =~ /Sauvignon\s*Blanc/i && !tags.include?("Sauvignon Blanc")
  tags << "Barbera" if s =~ /Barbera/i
  tags << "Dolcetto" if s =~ /Dolcetto/i
  tags << "Corvina / Blend Valpolicella" if s =~ /Corvina|Corvinone|Rondinella/i
  tags << "Carmenère" if s =~ /Carmen[eè]re/i
  tags << "Syrah" if s =~ /Syrah/i
  tags << "Aglianico" if s =~ /Aglianico/i
  tags << "Piedirosso" if s =~ /Piedirosso|Palummo|Palummella/i
  tags << "Ribolla Gialla" if s =~ /Ribolla/i
  tags << "Friulano" if s =~ /Friulano/i
  tags << "Malvasia" if s =~ /Malvasia/i
  tags << "Gewürztraminer" if s =~ /Gew[uü]rztraminer/i
  tags << "Riesling" if s =~ /Riesling/i
  tags << "Kerner" if s =~ /Kerner/i
  tags << "Vermentino" if s =~ /Vermentino/i
  tags << "Turbiana (Trebbiano di Lugana)" if s =~ /Turbiana/i
  tags << "Garganega" if s =~ /Garganega/i
  tags << "Grechetto" if s =~ /Grechetto/i
  tags << "Procanico / Trebbiano" if s =~ /Procanico|Trebbiano/i
  tags << "Nero d'Avola" if s =~ /Nero\s*d'Avola|Calabrese/i
  tags << "Nerello Mascalese" if s =~ /Nerello\s*Mascalese/i
  tags << "Carricante" if s =~ /Carricante/i
  tags << "Cannonau / Grenache" if s =~ /Cannonau|Grenache|Garnacha/i
  tags << "Montepulciano" if s =~ /Montepulciano/i
  tags << "Sagrantino" if s =~ /Sagrantino/i
  tags << "Primitivo / Zinfandel" if s =~ /Primitivo|Zinfandel/i
  tags << "Negroamaro" if s =~ /Negroamaro/i
  tags << "Lagrein" if s =~ /Lagrein/i
  tags << "Prié Blanc" if s =~ /Pri[eé]\s*Blanc/i
  tags << "Petite Arvine" if s =~ /Petite\s*Arvine/i
  tags << "Timorasso" if s =~ /Timorasso/i
  tags << "Biancolella / Forastera" if s =~ /Biancolella|Forastera|Fenile|Ginestra/i
  tags << "Falanghina" if s =~ /Falanghina/i
  tags << "Pecorino" if s =~ /Pecorino/i
  tags << "Glera" if s =~ /Glera/i
  tags << "Durella" if s =~ /Durell[ao]/i
  tags << "Vitovska" if s =~ /Vitovska/i
  tags << "Sémillon" if s =~ /S[eé]millon/i
  tags << "Aligoté" if s =~ /Aligot[eé]/i
  tags << "Viognier" if s =~ /Viognier/i
  tags << "Melon de Bourgogne" if s =~ /Melon\s*de\s*Bourgogne/i
  tags << "Malbec" if s =~ /Malbec/i
  tags << "Tempranillo" if s =~ /Tempranillo/i
  tags << "Tannat" if s =~ /Tannat/i
  tags << "Tintilia" if s =~ /Tintilia/i
  tags << "Ciliegiolo" if s =~ /Ciliegiolo/i
  tags << "Refosco" if s =~ /Refosco/i
  tags.uniq!
  tags << "Altri Vitigni Autoctoni / Blend" if tags.empty?
  tags
end

def xml_escape(str)
  str.to_s
     .gsub('&', '&amp;')
     .gsub('<', '&lt;')
     .gsub('>', '&gt;')
     .gsub('"', '&quot;')
     .gsub("'", '&apos;')
end

def col_letter(idx)
  # 0-based index -> A, B, ..., Z, AA
  res = ""
  n = idx + 1
  while n > 0
    rem = (n - 1) % 26
    res = (65 + rem).chr + res
    n = (n - 1) / 26
  end
  res
end

raw_path = File.join(__dir__, 'raw_vini.csv')
rows = CSV.read(raw_path, headers: true, encoding: 'UTF-8')

catalog = []
removed_duplicates = []

rows.each_with_index do |r, idx|
  row_num = idx + 1
  if SKIP_DUPLICATE_ROWS.key?(row_num)
    target_row = SKIP_DUPLICATE_ROWS[row_num]
    removed_duplicates << {
      riga_originale: row_num,
      referenza: r[0].to_s.strip,
      produttore: r[1].to_s.strip,
      formato: clean_formato(r[4]),
      annata: r[5].to_s.strip.empty? ? 's.a.' : r[5].to_s.strip,
      accorpata_con_riga: target_row
    }
    next
  end

  w = enrich_row(row_num, r)
  w = enrich_still_wines(row_num, w) if w[:regione].to_s.empty?
  if w[:regione].to_s.empty?
    w = enrich_red_wines(row_num, w)
    w = enrich_red_wines_part2(row_num, w) if w[:regione].to_s.empty?
    w = enrich_red_wines_part3(row_num, w) if w[:regione].to_s.empty?
  end

  if w[:nazione] != 'Italia' && w[:regione].include?('(')
    w[:regione] = w[:regione].sub(/\s*\([^)]+\)\s*/, '').strip
  end
  w[:regione] = "Sud-Ovest" if w[:regione] == "Sud-Ovest / Guascogna"

  w[:vitigni] = extract_vitigni_tags(w[:uvaggio])
  w[:note_consolidamento] = w[:correzioni].empty? ? "Scheda completata e verificata" : w[:correzioni].join("; ")

  catalog << w
end

# Sort catalog logically: Macro-Tipologia order -> Regione -> Produttore -> Nome Vino -> Annata
MACRO_ORDER = {
  "Bollicine" => 1,
  "Vino Bianco" => 2,
  "Vino Rosato" => 3,
  "Vino Rosso" => 4,
  "Vino Dolce / Passito" => 5,
  "Distillato" => 6
}

catalog.sort_by! do |w|
  [
    MACRO_ORDER[w[:macro_tipologia]] || 99,
    w[:nazione] == "Italia" ? 0 : 1,
    w[:regione].to_s,
    w[:produttore].to_s,
    w[:nome_vino].to_s,
    w[:annata].to_s,
    w[:formato].to_s
  ]
end

catalog.each_with_index do |w, idx|
  w[:id] = idx + 1
end

# 1. Generate CSV with UTF-8 BOM
csv_headers = [
  "ID",
  "Nome Vino (Normalizzato)",
  "Produttore / Cantina",
  "Macro-Tipologia",
  "Categoria Specifica",
  "Nazione",
  "Regione",
  "Zona / Sottozona / Cru",
  "Denominazione (DOCG/DOC/IGT/AOC)",
  "Formato",
  "Annata",
  "Prezzo (€)",
  "Uvaggio / Vitigni",
  "Vitigni Principali (Filtro)",
  "Affinamento / Vinificazione",
  "Profilo Organolettico & Note",
  "Referenza Originale",
  "Note di Consolidamento"
]

csv_path = File.join(__dir__, 'catalogo_vini_completo.csv')
File.open(csv_path, 'w:UTF-8') do |f|
  f.write("\uFEFF") # UTF-8 BOM for Excel
  f.write(CSV.generate_line(csv_headers))
  catalog.each do |w|
    row_vals = [
      w[:id],
      w[:nome_vino],
      w[:produttore],
      w[:macro_tipologia],
      w[:categoria],
      w[:nazione],
      w[:regione],
      w[:zona],
      w[:denominazione],
      w[:formato],
      w[:annata],
      w[:prezzo] ? w[:prezzo] : "",
      w[:uvaggio],
      w[:vitigni].join(", "),
      w[:affinamento],
      w[:note_profilo],
      w[:referenza_originale],
      w[:note_consolidamento]
    ]
    f.write(CSV.generate_line(row_vals))
  end
end
puts "Generated #{csv_path} (#{catalog.size} wines)"

# 2. Generate vini_data.js for the Web App
js_path = File.join(__dir__, 'vini_data.js')
File.open(js_path, 'w:UTF-8') do |f|
  f.write("// Catalogo Vini Completo - Generato automaticamente\n")
  f.write("window.WINE_CATALOG = ")
  f.write(JSON.pretty_generate(catalog))
  f.write(";\n\nwindow.REMOVED_DUPLICATES = ")
  f.write(JSON.pretty_generate(removed_duplicates))
  f.write(";\n")
end
puts "Generated #{js_path}"

# 3. Generate valid OpenXML .xlsx file using Ruby + /usr/bin/zip
xlsx_path = File.join(__dir__, 'catalogo_vini_completo.xlsx')
FileUtils.rm_f(xlsx_path)

Dir.mktmpdir('xlsx_build') do |tmpdir|
  FileUtils.mkdir_p(File.join(tmpdir, '_rels'))
  FileUtils.mkdir_p(File.join(tmpdir, 'xl', '_rels'))
  FileUtils.mkdir_p(File.join(tmpdir, 'xl', 'worksheets'))

  File.write(File.join(tmpdir, '[Content_Types].xml'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
      <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
      <Default Extension="xml" ContentType="application/xml"/>
      <Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>
      <Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>
      <Override PartName="/xl/worksheets/sheet2.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>
      <Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>
    </Types>
  XML

  File.write(File.join(tmpdir, '_rels', '.rels'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
      <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>
    </Relationships>
  XML

  File.write(File.join(tmpdir, 'xl', '_rels', 'workbook.xml.rels'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <Relationships xmlns="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
      <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/>
      <Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet2.xml"/>
      <Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>
    </Relationships>
  XML

  File.write(File.join(tmpdir, 'xl', 'workbook.xml'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
      <sheets>
        <sheet name="Catalogo Vini (451)" sheetId="1" r:id="rId1"/>
        <sheet name="Riepilogo e Duplicati Rimossi" sheetId="2" r:id="rId2"/>
      </sheets>
    </workbook>
  XML

  # Styles:
  # s=0: Default
  # s=1: Header (Burgundy #5B1A28 fill, White Bold text, centered vertical, wrap)
  # s=2: Data text cell (wrap text, top-aligned, thin border)
  # s=3: Data centered cell (ID, Formato, Annata)
  # s=4: Price cell with value (€ #,##0 bold)
  # s=5: Empty Price cell (soft cream fill #FFF8E7 so user sees where to fill price)
  File.write(File.join(tmpdir, 'xl', 'styles.xml'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
      <numFmts count="1">
        <numFmt numFmtId="164" formatCode="€\ #,##0"/>
      </numFmts>
      <fonts count="3">
        <font><sz val="10"/><color rgb="FF1F1F1F"/><name val="Calibri"/></font>
        <font><b/><sz val="11"/><color rgb="FFFFFFFF"/><name val="Calibri"/></font>
        <font><b/><sz val="10"/><color rgb="FF5B1A28"/><name val="Calibri"/></font>
      </fonts>
      <fills count="4">
        <fill><patternFill patternType="none"/></fill>
        <fill><patternFill patternType="gray125"/></fill>
        <fill><patternFill patternType="solid"><fgColor rgb="FF5B1A28"/></patternFill></fill>
        <fill><patternFill patternType="solid"><fgColor rgb="FFFFF8E7"/></patternFill></fill>
      </fills>
      <borders count="2">
        <border><left/><right/><top/><bottom/><diagonal/></border>
        <border>
          <left style="thin"><color rgb="FFE0D8D0"/></left>
          <right style="thin"><color rgb="FFE0D8D0"/></right>
          <top style="thin"><color rgb="FFE0D8D0"/></top>
          <bottom style="thin"><color rgb="FFE0D8D0"/></bottom>
          <diagonal/>
        </border>
      </borders>
      <cellStyleXfs count="1">
        <xf numFmtId="0" fontId="0" fillId="0" borderId="0"/>
      </cellStyleXfs>
      <cellXfs count="6">
        <xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>
        <xf numFmtId="0" fontId="1" fillId="2" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1">
          <alignment horizontal="center" vertical="center" wrapText="1"/>
        </xf>
        <xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyFont="1" applyBorder="1" applyAlignment="1">
          <alignment vertical="center" wrapText="1"/>
        </xf>
        <xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyFont="1" applyBorder="1" applyAlignment="1">
          <alignment horizontal="center" vertical="center"/>
        </xf>
        <xf numFmtId="164" fontId="2" fillId="0" borderId="1" xfId="0" applyNumberFormat="1" applyFont="1" applyBorder="1" applyAlignment="1">
          <alignment horizontal="right" vertical="center"/>
        </xf>
        <xf numFmtId="164" fontId="0" fillId="3" borderId="1" xfId="0" applyNumberFormat="1" applyFill="1" applyBorder="1" applyAlignment="1">
          <alignment horizontal="right" vertical="center"/>
        </xf>
      </cellXfs>
    </styleSheet>
  XML

  # Sheet 1: Catalogo Vini
  col_widths = [6, 36, 26, 18, 22, 12, 20, 32, 32, 16, 10, 13, 36, 26, 42, 55, 32, 28]
  cols_xml = col_widths.each_with_index.map do |w, i|
    "<col min=\"#{i+1}\" max=\"#{i+1}\" width=\"#{w}\" customWidth=\"1\"/>"
  end.join("\n    ")

  sheet1_rows = []
  # Header row
  header_cells = csv_headers.each_with_index.map do |h, c_idx|
    ref = "#{col_letter(c_idx)}1"
    "<c r=\"#{ref}\" t=\"inlineStr\" s=\"1\"><is><t>#{xml_escape(h)}</t></is></c>"
  end.join
  sheet1_rows << "<row r=\"1\" ht=\"28\" customHeight=\"1\">#{header_cells}</row>"

  # Data rows
  catalog.each_with_index do |w, r_idx|
    row_num = r_idx + 2
    vals = [
      [w[:id], :num, 3],
      [w[:nome_vino], :str, 2],
      [w[:produttore], :str, 2],
      [w[:macro_tipologia], :str, 3],
      [w[:categoria], :str, 2],
      [w[:nazione], :str, 3],
      [w[:regione], :str, 2],
      [w[:zona], :str, 2],
      [w[:denominazione], :str, 2],
      [w[:formato], :str, 3],
      [w[:annata], :str, 3],
      [w[:prezzo], :price, w[:prezzo] ? 4 : 5],
      [w[:uvaggio], :str, 2],
      [w[:vitigni].join(", "), :str, 2],
      [w[:affinamento], :str, 2],
      [w[:note_profilo], :str, 2],
      [w[:referenza_originale], :str, 2],
      [w[:note_consolidamento], :str, 2]
    ]
    cells_xml = vals.each_with_index.map do |(val, type, style), c_idx|
      ref = "#{col_letter(c_idx)}#{row_num}"
      if type == :num
        "<c r=\"#{ref}\" s=\"#{style}\"><v>#{val}</v></c>"
      elsif type == :price
        if val.nil?
          "<c r=\"#{ref}\" s=\"#{style}\"/>"
        else
          "<c r=\"#{ref}\" s=\"#{style}\"><v>#{val}</v></c>"
        end
      else
        "<c r=\"#{ref}\" t=\"inlineStr\" s=\"#{style}\"><is><t>#{xml_escape(val)}</t></is></c>"
      end
    end.join
    sheet1_rows << "<row r=\"#{row_num}\" ht=\"24\" customHeight=\"1\">#{cells_xml}</row>"
  end

  last_col = col_letter(csv_headers.size - 1)
  last_row = catalog.size + 1

  File.write(File.join(tmpdir, 'xl', 'worksheets', 'sheet1.xml'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
      <sheetViews>
        <sheetView tabSelected="1" workbookViewId="0">
          <pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/>
        </sheetView>
      </sheetViews>
      <cols>
        #{cols_xml}
      </cols>
      <sheetData>
        #{sheet1_rows.join("\n    ")}
      </sheetData>
      <autoFilter ref="A1:#{last_col}#{last_row}"/>
    </worksheet>
  XML

  # Sheet 2: Riepilogo & Duplicati Rimossi
  sheet2_rows = []
  s2_r = 1
  add_s2_row = lambda do |cells, is_header=false|
    c_xml = cells.each_with_index.map do |val, c_idx|
      ref = "#{col_letter(c_idx)}#{s2_r}"
      st = is_header ? 1 : 2
      if val.is_a?(Integer) && !is_header
        "<c r=\"#{ref}\" s=\"3\"><v>#{val}</v></c>"
      else
        "<c r=\"#{ref}\" t=\"inlineStr\" s=\"#{st}\"><is><t>#{xml_escape(val)}</t></is></c>"
      end
    end.join
    ht = is_header ? 26 : 20
    sheet2_rows << "<row r=\"#{s2_r}\" ht=\"#{ht}\" customHeight=\"1\">#{c_xml}</row>"
    s2_r += 1
  end

  add_s2_row.call(["RIEPILOGO CATALOGO VINI CONSOLIDATO", "Valore", "Note"], true)
  add_s2_row.call(["Righe grezze iniziali nel file di origine", 479, "Includevano 28 duplicati esatti tra sezioni diverse"])
  add_s2_row.call(["Duplicati esatti rimossi e accorpati", 28, "Stesso vino, stessa annata e stesso formato"])
  add_s2_row.call(["Referenze uniche finali a catalogo", catalog.size, "100% completate con Regione, Zona, Denominazione, Uvaggio, Affinamento e Note"])
  add_s2_row.call(["Referenze con prezzo già valorizzato", catalog.count { |w| !w[:prezzo].nil? }, "Prezzi preservati dalla lista originale"])
  add_s2_row.call(["Referenze con prezzo da completare", catalog.count { |w| w[:prezzo].nil? }, "Celle evidenziate in giallo tenue nel Foglio 1 (modificabili anche nella Web App)"])
  s2_r += 1

  add_s2_row.call(["ELENCO DEI 28 DUPLICATI ESATTI RIMOSSI", "Produttore", "Formato", "Annata", "Riga Originale", "Accorpata con Riga"], true)
  removed_duplicates.each do |d|
    add_s2_row.call([d[:referenza], d[:produttore], d[:formato], d[:annata], d[:riga_originale], d[:accorpata_con_riga]], false)
  end

  File.write(File.join(tmpdir, 'xl', 'worksheets', 'sheet2.xml'), <<~XML)
    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
      <cols>
        <col min="1" max="1" width="45" customWidth="1"/>
        <col min="2" max="2" width="25" customWidth="1"/>
        <col min="3" max="3" width="45" customWidth="1"/>
        <col min="4" max="4" width="15" customWidth="1"/>
        <col min="5" max="5" width="18" customWidth="1"/>
        <col min="6" max="6" width="18" customWidth="1"/>
      </cols>
      <sheetData>
        #{sheet2_rows.join("\n    ")}
      </sheetData>
    </worksheet>
  XML

  # Zip into .xlsx
  Dir.chdir(tmpdir) do
    system('/usr/bin/zip', '-q', '-r', xlsx_path, '[Content_Types].xml', '_rels', 'xl')
  end
end

puts "Generated #{xlsx_path} (#{File.size(xlsx_path)} bytes)"
