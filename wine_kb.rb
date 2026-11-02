# encoding: UTF-8

SKIP_DUPLICATE_ROWS = {
  40  => 21,  # Cabochon n25 Monterossa -> #21 Monterossa Cabochon N025 €85
  65  => 119, # Ultra Brut Edizione Limitata 2010 Villa Rinaldi -> #119 Cuvée Ultra Brut 2010 €68
  111 => 62,  # Alta Langa Valentino 2017 -> #62 Valentino Rocca dei Manzoni 2017 €65
  112 => 109, # Bollinger Special Cuvée Brut -> #109 Special Cuvée Brut €95
  113 => 19,  # Marchesi Antinori Brut -> #19 Marchesi Antinori Brut €40
  114 => 19,  # Marchesi Antinori Franciacorta Brut -> #19 Marchesi Antinori Brut €40
  115 => 100, # Philipponnat Royale Réserve Brut -> #100 Philipponnat Royale Réserve Brut €85
  135 => 12,  # Barone Pizzini Animante D.Z. 75cl -> #12 Barone Pizzini Animante D.Z. €42
  171 => 78,  # Pol Roger Sir Winston Churchill 2015 -> #78 Cuvée Sir Winston Churchill 2015 €450
  181 => 23,  # 60 Mesi Casa Caterina -> #23 Casa Caterina 60 mesi Nature Blanc de Blancs €50
  189 => 13,  # Bellavista Alma Assemblage 1 -> #13 Bellavista Alma Assemblage 1 €50
  190 => 14,  # Bellavista La Scala 2017 -> #14 Bellavista La Scala 2017 €70
  199 => 28,  # Castello Di Neive 2019 -> #28 Castello di Neive Metodo Classico 2019 €40
  204 => 31,  # D'Araprì s.a. -> #31 D'Araprì Pas Dosé €40
  207 => 125, # Dosaggio Zero Millesimato Letrari 2016 -> #125 Letrari Dosaggio Zero Riserva 2016 €60
  212 => 16,  # Extra Vintage Millesimato Ca' del Bosco -> #16 Ca' del Bosco Extra Brut Vintage €75
  223 => 122, # Giulio Ferrari 2015 Ferrari -> #122 Giulio Ferrari 2015 €180
  225 => 123, # Inkino 76 Mesi 2017 Maso dei Chini -> #123 Inkino 76 mesi 2017 €50
  226 => 36,  # Io Aura Lessini 2017 Tonello -> #36 Io Aura Lessini 2017 €40
  229 => 34,  # Leonia Frescobaldi -> #34 Leonia Frescobaldi €40
  237 => 236, # Moratti Oltrepò Pavese -> #236 Moratti s.a.
  249 => 17,  # Prestige Ca' del Bosco 75cl -> #17 Ca' del Bosco Prestige €50
  255 => 22,  # Rizzini 76 Mesi Angela Boniotti -> #22 Rizzini 76 mesi €50
  257 => 18,  # Saten Millesimato Ca' del Bosco -> #18 Ca' del Bosco Satèn €75
  265 => 269, # Tenuta Guado al Tasso 2024 Antinori Bianco -> #269 Vermentino Guado al Tasso 2024
  345 => 162, # Clos De La Fèguine 2020 Domaine Jacques Prieur -> #162 Domaine Jacques Prieur Beaune Clos de La Fèguine 1er cru 2020
  359 => 160, # Ferte Givry 2021 Famille Devillard -> #160 Domaine de la Ferté Givry Clos de Mortières 2021
  383 => 137  # Hautes Côtes de Beaune 2022 Jean Fery -> #137 Bourgogne Hautes-Cotes de Beaune 2022 Jean Fery
}

def clean_formato(fmt)
  s = fmt.to_s.gsub(/\(probabile\)/i, '').strip
  case s
  when '75 cl', '' then '75 cl'
  when '150 cl'    then '150 cl (Magnum)'
  when '200 cl'    then '200 cl'
  when '300 cl'    then '300 cl (Jéroboam)'
  when '900 cl'    then '900 cl (Salmanazar)'
  else s
  end
end

def enrich_row(row_num, r)
  ref_orig = r[0].to_s.strip
  prod_orig = r[1].to_s.strip
  col_orig = r[2].to_s.strip
  cat_orig = r[3].to_s.strip
  fmt = clean_formato(r[4])
  ann = r[5].to_s.strip
  ann = 's.a.' if ann.empty?
  prz = r[6].to_s.strip
  uv_orig = r[7].to_s.strip
  aff_orig = r[8].to_s.strip

  ref_l = ref_orig.downcase

  # Default structure
  w = {
    row_num: row_num,
    referenza_originale: ref_orig,
    nome_vino: ref_orig,
    produttore: prod_orig,
    macro_tipologia: '',
    categoria: '',
    nazione: 'Italia',
    regione: '',
    zona: '',
    denominazione: '',
    formato: fmt,
    annata: ann,
    prezzo: prz.empty? ? nil : prz.to_i,
    uvaggio: uv_orig,
    affinamento: aff_orig,
    note_profilo: '',
    correzioni: []
  }

  w[:correzioni] << "Duplicato unificato" if SKIP_DUPLICATE_ROWS.values.include?(row_num)

  # Specific rules covering all 479 rows
  case
  # --- DISTILLATI ---
  when row_num == 10
    w.merge!(
      nome_vino: "Bas-Armagnac Hors d'Âge (200 cl)",
      produttore: "Jean Cavé",
      macro_tipologia: "Distillato",
      categoria: "Armagnac / Distillato",
      nazione: "Francia",
      regione: "Sud-Ovest / Guascogna",
      zona: "Bas-Armagnac (Lannepax)",
      denominazione: "Bas-Armagnac AOC",
      annata: "s.a.",
      uvaggio: "Ugni Blanc, Baco Blanc, Colombard, Folle Blanche",
      affinamento: "Lungo invecchiamento in botti di rovere nero di Guascogna",
      note_profilo: "Distillato ricco e vellutato con note di frutta secca, vaniglia, spezie dolci, cacao e rancio."
    )

  # --- VINI DOLCI / MUFFATI ---
  when row_num == 50
    w.merge!(
      nome_vino: "Château d'Yquem Premier Cru Supérieur",
      produttore: "Château d'Yquem",
      macro_tipologia: "Vino Dolce / Passito",
      categoria: "Vino Dolce / Muffato",
      nazione: "Francia",
      regione: "Bordeaux",
      zona: "Sauternes",
      denominazione: "Sauternes Premier Cru Supérieur AOC",
      uvaggio: "Sémillon 80%, Sauvignon Blanc 20%",
      affinamento: "Circa 36-42 mesi in barrique nuove di rovere francese",
      note_profilo: "Leggendario Sauternes da uve attaccate da Botrytis cinerea: albicocca candita, zafferano, miele d'acacia e freschezza eterna."
    )
    w[:correzioni] << "Categoria corretta da Rosso a Vino Dolce / Muffato"

  # --- CHAMPAGNE ROSÉ ---
  when [52, 53, 54, 55, 56, 57].include?(row_num)
    w[:macro_tipologia] = "Bollicine"
    w[:categoria] = "Champagne Rosé"
    w[:nazione] = "Francia"
    w[:regione] = "Champagne"
    w[:denominazione] = "Champagne AOC"
    case row_num
    when 52
      w.merge!(nome_vino: "Bollinger Brut Rosé", produttore: "Bollinger", zona: "Aÿ / Vallée de la Marne",
               affinamento: "Oltre 36 mesi sui lieviti; con aggiunta del 5-6% di vino rosso di Côte aux Enfants",
               note_profilo: "Ribes rosso, ciliegia, spezie fini e struttura gastronomica tipica dello stile Bollinger.")
    when 53
      w.merge!(nome_vino: "Cristal Rosé Millésime", produttore: "Louis Roederer", zona: "Reims / Montagne de Reims & Côte des Blancs",
               uvaggio: "Pinot Noir 56%, Chardonnay 44%",
               affinamento: "6 anni sui lieviti in cantina e 8 mesi dopo la sboccatura; 20% vinificato in rovere",
               note_profilo: "Cuvée de Prestige da uve biodinamiche Grand Cru (Aÿ, Avize, Mesnil): setoso, gessoso, lampone e agrumi canditi.")
    when 54
      w.merge!(nome_vino: "Dom Pérignon Rosé Vintage", produttore: "Dom Pérignon", zona: "Épernay / Hautvillers",
               affinamento: "Circa 10-12 anni sui lieviti nelle cantine storiche",
               note_profilo: "Intenso, magnetico e complesso: fico maturo, fragolina di bosco, cacao, spezie orientali e mineralità fumé.")
    when 55
      w.merge!(nome_vino: "Cuvée Rosé Brut", produttore: "Laurent-Perrier", zona: "Tours-sur-Marne",
               affinamento: "Almeno 48-60 mesi sui lieviti; elaborato per macerazione (saignée) da 10 cru",
               note_profilo: "Icona degli Champagne Rosé di macerazione: cestino di piccoli frutti di bosco freschi, grande purezza e vivacità.")
    when 56
      w.merge!(nome_vino: "Brut Vintage Rosé", produttore: "Louis Roederer", zona: "Reims / Cumières & Chouilly",
               affinamento: "48 mesi sui lieviti e 6 mesi post-sboccatura; metodo dell'infusione",
               note_profilo: "Elegante e succoso: arancia sanguinella, frutti di bosco maturi, note floreali e speziate.")
    when 57
      w.merge!(nome_vino: "Ruinart Brut Rosé", produttore: "Ruinart", zona: "Reims / Montagne de Reims & Côte des Blancs",
               uvaggio: "Pinot Noir 55% (di cui 18% vinificato in rosso), Chardonnay 45%",
               affinamento: "36 mesi sui lieviti nelle crayères gallo-romane di Reims",
               note_profilo: "Morbido e fragrante: melograno, rosa antica, pompelmo rosa e menta fresca.")
    end

  # --- CHAMPAGNE BIANCO ---
  when (64..110).include?(row_num)
    w[:macro_tipologia] = "Bollicine"
    w[:categoria] = "Champagne"
    w[:nazione] = "Francia"
    w[:regione] = "Champagne"
    w[:denominazione] = "Champagne AOC"
    case row_num
    when 64, 73
      w.merge!(nome_vino: "Comtes de Champagne Blanc de Blancs Grand Cru", produttore: "Taittinger", zona: "Reims / Côte des Blancs (Avize, Chouilly, Cramant, Mesnil, Oger)",
               uvaggio: "Chardonnay 100% (Grand Cru Côte des Blancs)",
               affinamento: "10 anni sui lieviti nelle crayères di Saint-Nicaise; 5% affinato in barrique",
               note_profilo: "Capolavoro Blanc de Blancs: tensione gessosa, agrumi canditi, brioche tostata, mandorla e lunghezza infinita.")
    when 66
      w.merge!(nome_vino: "Armand de Brignac Brut Gold (Ace of Spades)", produttore: "Armand de Brignac (Cattier)", zona: "Chigny-les-Roses / Montagne de Reims",
               uvaggio: "Pinot Noir 40%, Chardonnay 40%, Pinot Meunier 20%",
               affinamento: "Assemblaggio multi-millesimato (3 annate) affinato sui lieviti in cantine a 30m di profondità",
               note_profilo: "Ricco, cremoso e opulento: pesca bianca, albicocca, fiori d'arancio, brioche e vaniglia.")
    when 67
      w.merge!(nome_vino: "Belle Epoque Brut Millésime", produttore: "Perrier-Jouët", zona: "Épernay / Cramant & Mailly",
               uvaggio: "Chardonnay 50%, Pinot Noir 45%, Pinot Meunier 5%",
               affinamento: "Almeno 72 mesi sui lieviti",
               note_profilo: "Stile floreale e cristallino: fiori bianchi di tiglio e biancospino, pesca bianca, pera e mineralità setosa.")
    when 68
      w.merge!(nome_vino: "PN AYC18 Blanc de Noirs Brut", produttore: "Bollinger", zona: "Aÿ / Vallée de la Marne & Montagne de Reims",
               uvaggio: "Pinot Noir 100% (Cru principale Aÿ, base vendemmia 2018 + vini di riserva in magnum)",
               affinamento: "Oltre 48 mesi sui lieviti, oltre il doppio del disciplinare",
               note_profilo: "Espressione pura del Pinot Noir di Aÿ: mela cotogna, agrumi canditi, marzapane, spezie dolci e finale salino.")
    when 69
      w.merge!(nome_vino: "Grand Cru Blanc de Blancs Brut Nature", produttore: "Champagne Bonnaire", zona: "Cramant (Côte des Blancs)",
               uvaggio: "Chardonnay 100% (Grand Cru Cramant)",
               affinamento: "Almeno 36-48 mesi sui lieviti, dosaggio zero",
               note_profilo: "Verticale, tagliente e gessoso: limone verde, fiori bianchi, pietra focaia e grande sapidità.")
    when 70
      w.merge!(nome_vino: "Première Cuvée Dosaggio Zero (D.Z.)", produttore: "Bruno Paillard", zona: "Reims",
               uvaggio: "Pinot Noir 45%, Chardonnay 33%, Pinot Meunier 22% (solo prima spremitura)",
               affinamento: "36 mesi sui lieviti più 6 mesi post-sboccatura; fino al 50% di vini di riserva Solera dal 1985",
               note_profilo: "Teso, puro e cesellato: mandorla fresca, pompelmo, ribes bianco e crosta di pane.")
    when 71
      w.merge!(nome_vino: "Blanc des Millénaires", produttore: "Charles Heidsieck", zona: "Reims / Côte des Blancs (Oger, Mesnil, Avize, Cramant, Vertus)",
               uvaggio: "Chardonnay 100% (4 Grand Cru e 1 Premier Cru della Côte des Blancs)",
               affinamento: "Oltre 12-15 anni sui lieviti nelle crayères millenarie di Reims",
               note_profilo: "Straordinaria complessità evolutiva: nocciola tostata, burro salato, limone confit, incenso e gesso.")
    when 72
      w.merge!(nome_vino: "Brut Réserve", produttore: "Charles Heidsieck", zona: "Reims",
               uvaggio: "Pinot Noir 40%, Chardonnay 40%, Pinot Meunier 20% (con 40% di vini di riserva di oltre 10 anni)",
               affinamento: "Almeno 36-48 mesi sui lieviti nelle crayères",
               note_profilo: "Avvolgente e gastronomico: mango, albicocca secca, pistacchio, brioche calda e finale lunghissimo.")
    when 74
      w.merge!(nome_vino: "Cristal Millésime Brut", produttore: "Louis Roederer", zona: "Reims (Grand Cru Montagne de Reims, Vallée de la Marne, Côte des Blancs)",
               uvaggio: "Pinot Noir 60%, Chardonnay 40%",
               affinamento: "6 anni sui lieviti e 8 mesi di riposo dopo la sboccatura",
               note_profilo: "Purezza cristallina e concentrazione: agrumi gialli, mandorla tostata, gesso bagnato e vibrante energia.")
    when 75
      w.merge!(nome_vino: "Cristal Vinothèque Millésime", produttore: "Louis Roederer", zona: "Reims (Cantine storiche Louis Roederer)",
               uvaggio: "Pinot Noir 60%, Chardonnay 40%",
               affinamento: "20 anni complessivi in cantina (11 anni sur lattes, 4 anni sur pointe e 5 anni post-sboccatura)",
               note_profilo: "Rarità assoluta: equilibrio supremo tra giovinezza eterna, iodio, tartufo bianco, agrumi canditi e nocciola.")
    when 76
      w.merge!(nome_vino: "Cuvée n° 747 Extra Brut", produttore: "Jacquesson", zona: "Dizy (Vallée de la Marne & Côte des Blancs)",
               uvaggio: "Chardonnay, Pinot Noir, Pinot Meunier (base vendemmia 2019 da Aÿ, Dizy, Hautvillers, Avize, Oiry)",
               affinamento: "Vinificazione in foudre di rovere senza filtrazione; 4 anni sui lieviti",
               note_profilo: "Champagne d'autore profondo e vinoso: pera matura, spezie, mineralità salina e grande tensione.")
    when 77
      w.merge!(nome_vino: "Cuvée Louise Brut Grand Cru", produttore: "Pommery", zona: "Reims (Grand Cru Avize, Cramant, Aÿ)",
               uvaggio: "Chardonnay 65%, Pinot Noir 35% (esclusivamente dai Grand Cru di Avize, Cramant e Aÿ)",
               affinamento: "120 mesi (10 anni) sui lieviti nelle crayères di Reims",
               note_profilo: "Raffinato, cremoso e complesso: fiori di tiglio, burro di nocciola, pesca tabacchiera e speziatura fine.")
    when 78
      w.merge!(nome_vino: "Cuvée Sir Winston Churchill Brut", produttore: "Pol Roger", zona: "Épernay (Grand Cru Montagne de Reims & Côte des Blancs)",
               uvaggio: "Pinot Noir (predominante) e Chardonnay da vigne Grand Cru",
               affinamento: "10 anni sui lieviti nelle profonde cantine di Épernay (33 metri sottoterra)",
               note_profilo: "Potente, aristocratico e strutturato: miele d'acacia, agrumi canditi, mandorla tostata e spalla imponente.")
    when 79
      w.merge!(nome_vino: "Delamotte Brut", produttore: "Delamotte", zona: "Le Mesnil-sur-Oger (Côte des Blancs)",
               uvaggio: "Chardonnay 55%, Pinot Noir 35%, Pinot Meunier 10%",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Maison sorella di Salon: freschezza agrumata, fiori bianchi, zenzero e perlage finissimo.")
    when 80
      w.merge!(nome_vino: "Dom Pérignon Vintage Brut", produttore: "Dom Pérignon", zona: "Épernay / Hautvillers",
               uvaggio: "Chardonnay 51%, Pinot Noir 49%",
               affinamento: "Almeno 8 anni sui lieviti",
               note_profilo: "Icona millesimata: note tostate e fumé, cacao amaro, pesca bianca, bergamotto e tensione minerale.")
    when 81
      w.merge!(nome_vino: "Dom Pérignon P2 (Plénitude 2) Vintage", produttore: "Dom Pérignon", zona: "Épernay / Hautvillers",
               uvaggio: "Chardonnay 52%, Pinot Noir 48%",
               affinamento: "Oltre 15 anni sui lieviti fino alla Seconda Plénitude",
               note_profilo: "Energia amplificata e profondità abissale: brioche tostata, iodio, albicocca secca, spezie e finale salino interminabile.")
    when 82
      w.merge!(nome_vino: "Dom Ruinart Blanc de Blancs Grand Cru", produttore: "Ruinart", zona: "Reims (Grand Cru Côte des Blancs & Montagne de Reims)",
               uvaggio: "Chardonnay 100% Grand Cru (Avize, Chouilly, Le Mesnil-sur-Oger, Sillery)",
               affinamento: "Oltre 9-10 anni sui lieviti con tappo di sughero (tirage liège)",
               note_profilo: "Vellutato e gessoso: castagna tostata, bergamotto, tè verde, pietra focaia e sapidità vibrante.")
    when 83
      w.merge!(nome_vino: "Francis Orban Brut Réserve", produttore: "Francis Orban", zona: "Leuvrigny (Vallée de la Marne)",
               uvaggio: "Pinot Meunier 100%",
               affinamento: "Almeno 24-30 mesi sui lieviti",
               note_profilo: "Puro Pinot Meunier della Vallée de la Marne: mela gialla, pera, frutta esotica e rotondità piacevolissima.")
    when 84
      w.merge!(nome_vino: "Grande Réserve Brut", produttore: "Gosset", zona: "Aÿ / Épernay",
               uvaggio: "Chardonnay 45%, Pinot Noir 45%, Pinot Meunier 10%",
               affinamento: "Almeno 36-48 mesi sui lieviti; senza fermentazione malolattica per preservare la freschezza",
               note_profilo: "La più antica Maison di Champagne (1584): vinoso, teso, ribes nero, mela cotogna e pan brioche.")
    when 85
      w.merge!(nome_vino: "Grand Cru Royal Millésimé Brut", produttore: "Pommery", zona: "Reims (7 villaggi Grand Cru)",
               uvaggio: "Pinot Noir 50%, Chardonnay 50% (100% Grand Cru)",
               affinamento: "Oltre 48 mesi sui lieviti nelle crayères",
               note_profilo: "Elegante e minerale: agrumi maturi, fiori bianchi, miele delicato e note tostate.")
    when 86
      w.merge!(nome_vino: "Grand Cru Blanc de Noirs Extra Brut", produttore: "Guy de Chassey", zona: "Louvois (Montagne de Reims Grand Cru)",
               uvaggio: "Pinot Noir 100% Grand Cru",
               affinamento: "36-48 mesi sui lieviti",
               note_profilo: " Vigneron indipendente di Louvois: Pinot Noir strutturato, frutti rossi croccanti, spezie e finale asciutto.")
    when 87
      w.merge!(nome_vino: "Krug Grande Cuvée 172ème Édition Brut", produttore: "Krug", zona: "Reims",
               uvaggio: "Pinot Noir 44%, Chardonnay 36%, Pinot Meunier 20% (assemblaggio di 146 vini di 11 annate diverse)",
               affinamento: "Fermentazione in piccoli fusti di rovere; circa 7 anni sui lieviti",
               note_profilo: "Sinfonia orchestrale di Krug: agrumi canditi, marzapane, pan di spezie, nocciola tostata e freschezza monumentale.")
    when 88, 89, 90, 91
      w.merge!(nome_vino: "Krug Vintage Brut #{ann}", produttore: "Krug", zona: "Reims",
               uvaggio: "Pinot Noir (~45-50%), Chardonnay (~35-40%), Pinot Meunier (~15%)",
               affinamento: "Fermentazione in petits fûts di rovere; oltre 12 anni sui lieviti",
               note_profilo: "Millesimato leggendario di Krug (#{ann}): potenza, complessità tostata, miele di castagno, agrumi confit e persistenza infinita.")
    when 92
      w.merge!(nome_vino: "La Grande Année Brut", produttore: "Bollinger", zona: "Aÿ",
               uvaggio: "Pinot Noir 65%, Chardonnay 35% (100% Grand e Premier Cru)",
               affinamento: "Vinificazione integrale in piccole botti di rovere; 7-8 anni sui lieviti sotto tappo di sughero",
               note_profilo: "Millesimato iconico di Bollinger: vinoso, complesso, nocciola, pesca al forno, brioche e salinità marina.")
    when 93
      w.merge!(nome_vino: "La Grande Dame Brut", produttore: "Veuve Clicquot", zona: "Reims (8 Grand Cru storici)",
               uvaggio: "Pinot Noir 90%, Chardonnay 10%",
               affinamento: "Oltre 8-10 anni sui lieviti",
               note_profilo: "Omaggio a Madame Clicquot: verticale e setoso, con predominanza di Pinot Noir Grand Cru, mirabelle, gelsomino e mandorla.")
    when 94
      w.merge!(nome_vino: "Le Black Label Brut", produttore: "Lanson", zona: "Reims",
               uvaggio: "Pinot Noir 50%, Chardonnay 35%, Pinot Meunier 15%",
               affinamento: "Almeno 36 mesi sui lieviti; vinificazione storica senza malolattica",
               note_profilo: "Fresco, agrumato e scattante: mela verde, limone, pera croccante e crosta di pane.")
    when 95
      w.merge!(nome_vino: "Le Black Réserve Brut", produttore: "Lanson", zona: "Reims",
               uvaggio: "Pinot Noir 50%, Chardonnay 35%, Pinot Meunier 15% (45% vini di riserva in botti di rovere)",
               affinamento: "60 mesi (5 anni) sui lieviti",
               note_profilo: "Ricco e profondo: marzapane, agrumi canditi, spezie dolci e vibrante tensione acida.")
    when 96
      w.merge!(nome_vino: "Le Vintage Brut", produttore: "Lanson", zona: "Reims (Grand e Premier Cru)",
               uvaggio: "Pinot Noir 52%, Chardonnay 48%",
               affinamento: "Oltre 9-10 anni sui lieviti senza fermentazione malolattica",
               note_profilo: "Millesimato di straordinaria longevità: pera candita, bergamotto, biscotto e mineralità gessosa.")
    when 97
      w.merge!(nome_vino: "Grand Cru Blanc de Noirs Brut", produttore: "Paul Clouet", zona: "Bouzy (Montagne de Reims Grand Cru)",
               uvaggio: "Pinot Noir 100% (Grand Cru Bouzy)",
               affinamento: "Almeno 36 mesi sui lieviti",
               note_profilo: "Classico Blanc de Noirs di Bouzy: avvolgente, fruttato, ciliegia bianca, spezie e struttura piena.")
    when 98
      w.merge!(nome_vino: "Blanc de Blancs Brut", produttore: "Perrier-Jouët", zona: "Épernay",
               uvaggio: "Chardonnay 100%",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Luminoso e floreale: fiori di sambuco, acacia, agrumi vivaci e finale minerale.")
    when 99
      w.merge!(nome_vino: "Grand Brut", produttore: "Perrier-Jouët", zona: "Épernay",
               uvaggio: "Pinot Meunier 40%, Pinot Noir 40%, Chardonnay 20%",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Storico primo Brut della Champagne (1846): equilibrato, note di fiori bianchi, mela gialla, burro e vaniglia.")
    when 100
      w.merge!(nome_vino: "Royale Réserve Brut", produttore: "Philipponnat", zona: "Mareuil-sur-Aÿ",
               uvaggio: "Pinot Noir 65%, Chardonnay 30%, Pinot Meunier 5% (con vini di riserva Solera in legno)",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Vinoso e strutturato: ribes, fiori di tiglio, pane caldo tostato e miele.")
    when 101
      w.merge!(nome_vino: "Bollinger R.D. (Récemment Dégorgé) Extra Brut", produttore: "Bollinger", zona: "Aÿ",
               uvaggio: "Pinot Noir 63%, Chardonnay 37% (Grand e Premier Cru)",
               affinamento: "Fermentazione in barrique; oltre 12 anni sui lieviti sotto sughero, sboccato di recente",
               note_profilo: "Mito assoluto della Champagne: contrasto folgorante tra aromi di nocciola/tartufo/brioche e freschezza tagliente.")
    when 102
      w.merge!(nome_vino: "\"R\" de Ruinart Brut", produttore: "Ruinart", zona: "Reims",
               uvaggio: "Pinot Noir 40-45%, Chardonnay 40%, Pinot Meunier 15-20%",
               affinamento: "36 mesi sui lieviti nelle crayères",
               note_profilo: "Armonioso e luminoso: pera, mela renetta, nocciola fresca e fiori bianchi.")
    when 103
      w.merge!(nome_vino: "Blanc de Blancs Millésime Brut", produttore: "Louis Roederer", zona: "Reims / Avize (Côte des Blancs)",
               uvaggio: "Chardonnay 100% (Grand Cru Avize)",
               affinamento: "60 mesi sui lieviti; imbottigliato a pressione ridotta per un perlage cremoso",
               note_profilo: "Seta e gesso da Avize: fiori d'arancio, mandorla bianca, polpa di agrumi e lunghissima scia salina.")
    when 104
      w.merge!(nome_vino: "Brut Premier / Collection", produttore: "Louis Roederer", zona: "Reims",
               uvaggio: "Pinot Noir 40%, Chardonnay 40%, Pinot Meunier 20%",
               affinamento: "36-48 mesi sui lieviti con vini di riserva affinati in foudre di rovere",
               note_profilo: "Fresco e strutturato: frutta a polpa bianca, agrumi maturi, note tostate e finissima tessitura.")
    when 105
      w.merge!(nome_vino: "Brut Vintage", produttore: "Louis Roederer", zona: "Reims / Verzy & Chouilly",
               uvaggio: "Pinot Noir 70% (Montagne de Reims), Chardonnay 30%",
               affinamento: "48 mesi sui lieviti e 6 mesi post-sboccatura; 30% vinificato in rovere",
               note_profilo: "Potenza del Pinot Noir di Verzy: pesca arrosto, agrumi canditi, cacao e pasticceria.")
    when 106
      w.merge!(nome_vino: "Ruinart Blanc de Blancs", produttore: "Ruinart", zona: "Reims (Côte des Blancs & Montagne de Reims)",
               uvaggio: "Chardonnay 100% (principalmente Premier Cru)",
               affinamento: "36 mesi sui lieviti nelle crayères",
               note_profilo: "Emblema della Maison Ruinart: cedro, pesca bianca, ananas fresco, gelsomino e rotondità setosa.")
    when 107
      w.merge!(nome_vino: "Ruinart Millésimé Brut", produttore: "Ruinart", zona: "Reims",
               uvaggio: "Chardonnay 50%, Pinot Noir 50% (Grand e Premier Cru)",
               affinamento: "60-72 mesi sui lieviti",
               note_profilo: "Millesimato elegante e complesso: bergamotto, fiori di tiglio, crosta di pane e mineralità gessosa.")
    when 108
      w.merge!(nome_vino: "Salon Cuvée 'S' Le Mesnil Blanc de Blancs Grand Cru", produttore: "Champagne Salon", zona: "Le Mesnil-sur-Oger (Côte des Blancs)",
               uvaggio: "Chardonnay 100% (singolo Grand Cru Le Mesnil-sur-Oger, singola annata)",
               affinamento: "Oltre 10 anni sui lieviti; prodotto solo nelle grandi annate senza malolattica",
               note_profilo: "Uno dei vini più rari e longevi al mondo: lama di rasoio gessosa, yuzu, tè affumicato, nocciola e purezza assoluta.")
    when 109
      w.merge!(nome_vino: "Special Cuvée Brut", produttore: "Bollinger", zona: "Aÿ",
               uvaggio: "Pinot Noir 60%, Chardonnay 25%, Pinot Meunier 15% (oltre 85% Grand e Premier Cru)",
               affinamento: "Oltre 36 mesi sui lieviti; vini di riserva conservati in magnum per 5-15 anni",
               note_profilo: "Stile inconfondibile Bollinger: mela cotta, pesca, brioche tostata, noce e grande struttura.")
    when 110
      w.merge!(nome_vino: "Extra Old Extra Brut", produttore: "Veuve Clicquot", zona: "Reims",
               uvaggio: "Pinot Noir 45%, Chardonnay 27%, Pinot Meunier 28% (100% vini di riserva di 6 grandi annate)",
               affinamento: "3 anni sui lieviti in tini + 3 anni in bottiglia; basso dosaggio (3 g/l)",
               note_profilo: "Assemblaggio esclusivo di vini di riserva storici: agrumi canditi, meringa, spezie dolci e mineralità salina.")
    end

  # --- FRANCIACORTA DOCG ---
  when [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 39, 41, 134, 248].include?(row_num)
    w[:macro_tipologia] = "Bollicine"
    w[:categoria] = "Franciacorta DOCG"
    w[:nazione] = "Italia"
    w[:regione] = "Lombardia"
    w[:zona] = "Franciacorta (Brescia)"
    w[:denominazione] = "Franciacorta DOCG"
    case row_num
    when 11
      w.merge!(nome_vino: "Cuvée Annamaria Clementi Franciacorta Riserva", produttore: "Ca' del Bosco",
               denominazione: "Franciacorta Riserva DOCG",
               affinamento: "Vinificazione in piccole botti di rovere; oltre 8-9 anni sui lieviti (Dosaggio Zero)",
               note_profilo: "Vertice assoluto di Ca' del Bosco: complessità monumentale, agrumi canditi, nocciola, spezie e cremosità infinita.")
    when 12, 134
      w.merge!(nome_vino: "Animante Franciacorta Dosaggio Zero", produttore: "Barone Pizzini",
               uvaggio: "Chardonnay 78%, Pinot Nero 12%, Pinot Bianco 10% (Biologico)",
               affinamento: "24-30 mesi sui lieviti",
               note_profilo: "Pioniere del biologico in Franciacorta: teso, agrumato, fiori di campo, timo e chiusura salina.")
      w[:correzioni] << "Categoria corretta da Rosso a Bollicine (Franciacorta DOCG)" if row_num == 134
    when 13
      w.merge!(nome_vino: "Alma Grande Cuvée Assemblage 1 Brut", produttore: "Bellavista",
               uvaggio: "Chardonnay 77%, Pinot Nero 22%, Pinot Bianco 1%",
               affinamento: "Circa 36 mesi sui lieviti; 15% fermentato in petites pièces di rovere",
               note_profilo: "Cuvée simbolo di Bellavista: pesca bianca, agrumi dolci, vaniglia leggera e perlage setoso.")
    when 14
      w.merge!(nome_vino: "Teatro alla Scala Franciacorta Brut Millesimato", produttore: "Bellavista",
               affinamento: "Oltre 48-60 mesi sui lieviti; oltre il 25% fermentato in piccole botti di rovere",
               note_profilo: "Dedicato al Teatro alla Scala di Milano: elegante, profondo, fiori bianchi, pasticceria, mandorla e grande persistenza.")
    when 15
      w.merge!(nome_vino: "Vintage Collection Dosaggio Zero", produttore: "Ca' del Bosco",
               affinamento: "48 mesi sui lieviti; metodo Ca' del Bosco di lavaggio uve",
               note_profilo: "Puro, verticale e sincronizzato: pompelmo, mela renetta, crosta di pane e finale asciutto e sapido.")
    when 16
      w.merge!(nome_vino: "Vintage Collection Extra Brut", produttore: "Ca' del Bosco",
               affinamento: "48 mesi sui lieviti",
               note_profilo: "Equilibrio tra ricchezza del millesimo e tensione: frutta gialla, agrumi, tostature fini e mineralità.")
    when 17, 248
      w.merge!(nome_vino: "Cuvée Prestige Edizione Franciacorta Extra Brut", produttore: "Ca' del Bosco",
               uvaggio: "Chardonnay 75%, Pinot Nero 15%, Pinot Bianco 10%",
               affinamento: "Circa 25-28 mesi sui lieviti con almeno 20% di vini di riserva",
               note_profilo: "L'icona della Franciacorta: fragrante, pesca bianca, mela croccante, agrumi e mandorla fresca.")
    when 18
      w.merge!(nome_vino: "Vintage Collection Satèn", produttore: "Ca' del Bosco",
               denominazione: "Franciacorta Satèn DOCG",
               affinamento: "48 mesi sui lieviti; passaggio parziale in piccole botti di rovere",
               note_profilo: "Bolla carezzevole come seta: frutta tropicale, fiori di pesco, brioche calda e vaniglia delicata.")
    when 19
      w.merge!(nome_vino: "Cuvée Royale Franciacorta Brut (Tenuta Montenisa)", produttore: "Marchesi Antinori (Tenuta Montenisa)",
               uvaggio: "Chardonnay 78%, Pinot Nero 12%, Pinot Bianco 10%",
               affinamento: "36 mesi sui lieviti nelle cantine storiche di Calino",
               note_profilo: "Fresco ed elegante: pesca a polpa bianca, mela golden, fiori di tiglio e crosta di pane.")
    when 20
      w.merge!(nome_vino: "Prima Cuvée Franciacorta Brut", produttore: "Monte Rossa",
               uvaggio: "Chardonnay 85%, Pinot Nero 10%, Pinot Bianco 5%",
               affinamento: "Almeno 24 mesi sui lieviti",
               note_profilo: "Fresco, immediato e armonioso: agrumi, pera williams, fiori bianchi e lieviti fini.")
    when 21
      w.merge!(nome_vino: "Cabochon Fuoriserie N. 025 Brut", produttore: "Monte Rossa",
               annata: "N. 025",
               uvaggio: "Chardonnay 70%, Pinot Nero 30%",
               affinamento: "Fermentazione in barrique; oltre 44 mesi sui lieviti",
               note_profilo: "Cru di punta di Monte Rossa: ricco, cremoso, note di frutta esotica, vaniglia, nocciola tostata e sapidità.")
    when 39
      w.merge!(nome_vino: "Cabochon Fuoriserie N. 024 Brut", produttore: "Monte Rossa",
               annata: "N. 024",
               uvaggio: "Chardonnay 70%, Pinot Nero 30%",
               affinamento: "Fermentazione in barrique; oltre 44 mesi sui lieviti",
               note_profilo: "Edizione N. 024 del Cabochon di Monte Rossa: struttura importante, agrumi canditi, spezie dolci e pan brioche.")
      w[:correzioni] << "Categoria corretta da Bianco/Rosso a Bollicine (Franciacorta DOCG)"
    when 41
      w.merge!(nome_vino: "Sansevè Franciacorta Satèn Brut", produttore: "Monte Rossa",
               denominazione: "Franciacorta Satèn DOCG",
               annata: "s.a.",
               uvaggio: "Chardonnay 100%",
               affinamento: "Almeno 24 mesi sui lieviti",
               note_profilo: "Satèn morbido e avvolgente: pompelmo giallo, mandorla dolce, fiori d'acacia e perlage vellutato.")
      w[:correzioni] << "Categoria corretta da Bianco/Rosso a Bollicine (Franciacorta Satèn DOCG)"
    when 22
      w.merge!(nome_vino: "Franciacorta Riserva 76 Mesi", produttore: "Cantina Rizzini (Angela Boniotti)",
               denominazione: "Franciacorta Riserva DOCG",
               uvaggio: "Chardonnay 100%",
               affinamento: "76 mesi sui lieviti",
               note_profilo: "Lungo affinamento artigianale a Monticelli Brusati: complesso, evoluto, crosta di pane, frutta secca e agrumi.")
    end

  # --- TRENTO DOC ---
  when [116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 182, 188, 206, 222, 240, 241, 242].include?(row_num)
    w[:macro_tipologia] = "Bollicine"
    w[:categoria] = "Trento DOC"
    w[:nazione] = "Italia"
    w[:regione] = "Trentino-Alto Adige"
    w[:zona] = "Trentino"
    w[:denominazione] = "Trento DOC"
    case row_num
    when 116, 117
      w.merge!(nome_vino: "Trento DOC Brut", produttore: "Letrari", zona: "Vallagarina (Rovereto)",
               uvaggio: "Chardonnay 100%",
               affinamento: "24-36 mesi sui lieviti",
               note_profilo: "Fresco, montano e fragrante: mela golden del Trentino, fiori alpini e crosta di pane.")
    when 118, 188
      w.merge!(nome_vino: "Barricaia Riserva Brut", produttore: "Villa Rinaldi",
               uvaggio: "Chardonnay 80%, Pinot Nero 20%",
               affinamento: "Maturazione delle basi in barrique di rovere francese; lungo affinamento sui lieviti",
               note_profilo: "Metodo Classico ricco e avvolgente: crema pasticcera, vaniglia, frutta tropicale e struttura importante.")
    when 119
      w.merge!(nome_vino: "Cuvée Ultra Brut Edizione Limitata", produttore: "Villa Rinaldi",
               uvaggio: "Chardonnay 100%",
               affinamento: "Passaggio in barrique e lunghissimo affinamento sui lieviti",
               note_profilo: "Secco, complesso e cremoso: note tostate, frutta secca, miele di montagna e spiccata sapidità.")
    when 120, 241
      w.merge!(nome_vino: "Piancastello Riserva Brut / Zero", produttore: "Endrizzi", zona: "San Michele all'Adige (Piana Rotaliana)",
               denominazione: "Trento DOC Riserva",
               uvaggio: "Chardonnay 60%, Pinot Nero 40%",
               affinamento: "Oltre 48-60 mesi sui lieviti",
               note_profilo: "Riserva d'alta quota: complesso, mela renetta, nocciola tostata, agrumi e lunga persistenza minerale.")
    when 121, 240
      w.merge!(nome_vino: "Ferrari Perlé Millesimato Brut", produttore: "Ferrari F.lli Lunelli", zona: "Trento (Vigneti di montagna)",
               uvaggio: "Chardonnay 100%",
               affinamento: "Circa 54-60 mesi sui lieviti",
               note_profilo: "Millesimato iconico di Casa Ferrari: mela renetta, mandorla, fiori di mandorlo e lieviti finissimi.")
    when 122, 222
      w.merge!(nome_vino: "Giulio Ferrari Riserva del Fondatore", produttore: "Ferrari F.lli Lunelli", zona: "Maso Pianizza (Trento, 500-600m s.l.m.)",
               denominazione: "Trento DOC Riserva",
               uvaggio: "Chardonnay 100% (Cru Maso Pianizza)",
               affinamento: "Oltre 10 anni sui lieviti",
               note_profilo: "Il più celebre Metodo Classico italiano: sinfonia di miele d'acacia, cioccolato bianco, agrumi canditi, nocciola e freschezza eterna.")
    when 123
      w.merge!(nome_vino: "Inkino Riserva Carlo V 76 Mesi", produttore: "Maso dei Chini", zona: "Colline di Trento (Martignano)",
               denominazione: "Trento DOC Riserva",
               uvaggio: "Chardonnay 100%",
               affinamento: "76 mesi sui lieviti",
               note_profilo: "Riserva di grande spessore: burro fuso, frutta candita, pan brioche e mineralità dolomitica.")
    when 124, 206
      w.merge!(nome_vino: "Trento DOC Dosaggio Zero", produttore: "Letrari", zona: "Vallagarina (Rovereto)",
               uvaggio: "Chardonnay 85%, Pinot Nero 15%",
               affinamento: "Almeno 36 mesi sui lieviti",
               note_profilo: "Tagliente e montano: cedro, mela verde, erbe aromatiche alpine e chiusura cristallina.")
    when 125
      w.merge!(nome_vino: "Trento DOC Dosaggio Zero Riserva", produttore: "Letrari", zona: "Vallagarina (Rovereto)",
               denominazione: "Trento DOC Riserva",
               uvaggio: "Chardonnay 60%, Pinot Nero 40%",
               affinamento: "48-60 mesi sui lieviti",
               note_profilo: "Austero, profondo e gastronomico: piccola pasticceria, agrumi maturi, spezie bianche e sapidità di roccia.")
    when 126, 242
      w.merge!(nome_vino: "Piffer Vulcanite Trento DOC", produttore: "Cembra Cantina di Montagna / Neno", zona: "Valle di Cembra (Porfido vulcanico)",
               uvaggio: "Chardonnay 100%",
               affinamento: "Oltre 48 mesi sui lieviti",
               note_profilo: "Da vigneti eroici su porfido in Valle di Cembra: spiccata mineralità vulcanica, pietra focaia, mela e agrumi.")
    when 182
      w.merge!(nome_vino: "Altemasi Riserva Graal", produttore: "Altemasi (Cavit)", zona: "Colline di Trento e Altopiano di Brentonico",
               denominazione: "Trento DOC Riserva",
               uvaggio: "Chardonnay 70%, Pinot Nero 30%",
               affinamento: "Oltre 60-72 mesi sui lieviti",
               note_profilo: "Riserva di punta di Altemasi: mela cotogna, nocciola tostata, spezie dolci e perlage cremoso.")
    end

  # --- ALTA LANGA & METODO CLASSICO ITALIA / ROSÉ / INTERNAZIONALE ---
  when [6, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 49, 59, 60, 61, 62, 63, 164, 166, 205, 232, 236, 243, 254, 261, 262, 263, 264].include?(row_num)
    w[:macro_tipologia] = "Bollicine"
    case row_num
    when 6
      w.merge!(nome_vino: "Blanc de Blancs / De la Finca Metodo Classico", produttore: "Raventós i Blanc",
               categoria: "Metodo Classico Internazionale", nazione: "Spagna", regione: "Catalogna",
               zona: "Conca del Riu Anoia (Penedès)", denominazione: "Conca del Riu Anoia (Vino Espumoso de Calidad)",
               uvaggio: "Xarel·lo 50%, Macabeu 35%, Parellada 15% (Biodinamico)",
               affinamento: "Almeno 18-36 mesi sui lieviti",
               note_profilo: "Riferimento assoluto delle bollicine biodinamiche spagnole su suoli marini fossili: salino, agrumato, erbe mediterranee.")
      w[:correzioni] << "Categoria corretta da Bianco a Bollicine (Metodo Classico Spagna)"
    when 23
      w.merge!(nome_vino: "60 Mesi Brut Nature Blanc de Blancs", produttore: "Casa Caterina",
               categoria: "Metodo Classico Italia", regione: "Lombardia", zona: "Monticelli Brusati (Brescia)",
               denominazione: "Vino Spumante di Qualità Metodo Classico",
               affinamento: "60 mesi sui lieviti; agricoltura biodinamica/artigianale senza dosaggio",
               note_profilo: "Champagne-style artigianale dei fratelli Del Bono: vibrante, gessoso, agrumi canditi e grande carattere.")
    when 24
      w.merge!(nome_vino: "Cuvée 36 Brut Nature Blanc de Blancs", produttore: "Casa Caterina",
               categoria: "Metodo Classico Italia", regione: "Lombardia", zona: "Monticelli Brusati (Brescia)",
               denominazione: "Vino Spumante di Qualità Metodo Classico",
               affinamento: "36 mesi sui lieviti; senza dosaggio",
               note_profilo: "Teso, puro e gastronomico: fiori bianchi, limone, mandorla grezza e mineralità tagliente.")
    when 25, 232
      w.merge!(nome_vino: "Lugana Brut Metodo Classico", produttore: "Ca' dei Frati",
               categoria: "Metodo Classico Italia", regione: "Lombardia", zona: "Sirmione (Lago di Garda)",
               denominazione: "Lugana DOC Spumante Metodo Classico",
               uvaggio: "Turbiana 100%",
               affinamento: "Oltre 24 mesi sui lieviti e 4 mesi post-sboccatura",
               note_profilo: "Spumante originale da uve Turbiana in purezza: biscotto, fieno, nocciola, agrumi e sapidità gardesana.")
    when 26, 243
      w.merge!(nome_vino: "Pinot 64 Brut Metodo Classico", produttore: "Calatroni",
               categoria: "Metodo Classico Italia", regione: "Lombardia", zona: "Oltrepò Pavese (Montecalvo Versiggia)",
               denominazione: "Oltrepò Pavese Metodo Classico DOCG Pinot Nero",
               uvaggio: "Pinot Nero 100%",
               affinamento: "24-30 mesi sui lieviti",
               note_profilo: "Blanc de Noirs dell'Alta Valle Versa: mela rossa, salvia, crosta di pane e bella spalla acida.")
    when 27, 63
      w.merge!(nome_vino: "Luigi Coppo Alta Langa Brut / Pas Dosé", produttore: "Coppo",
               categoria: "Alta Langa DOCG", regione: "Piemonte", zona: "Alta Langa / Canelli",
               denominazione: "Alta Langa DOCG",
               uvaggio: "Pinot Nero 100%",
               affinamento: "Almeno 30-36 mesi sui lieviti nelle Cattedrali Sotterranee UNESCO di Canelli",
               note_profilo: "Blanc de Noirs piemontese teso e sapido: pera, agrumi, timo, lieviti fini e finale minerale.")
    when 28
      w.merge!(nome_vino: "Metodo Classico Brut Pinot Nero", produttore: "Castello di Neive",
               categoria: "Metodo Classico Italia", regione: "Piemonte", zona: "Langhe (Neive)",
               denominazione: "Vino Spumante di Qualità Metodo Classico",
               uvaggio: "Pinot Nero 100%",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Raffinato Pinot Nero spumantizzato a Neive: ribes bianco, crosta di pane, nocciola e freschezza.")
    when 29
      w.merge!(nome_vino: "Riserva Coppo Alta Langa Extra Brut", produttore: "Coppo",
               categoria: "Alta Langa DOCG", regione: "Piemonte", zona: "Alta Langa / Canelli",
               denominazione: "Alta Langa Riserva DOCG",
               affinamento: "Oltre 60 mesi sui lieviti nelle Cattedrali Sotterranee",
               note_profilo: "Grande Riserva di Alta Langa: struttura ampia, pan brioche, miele, frutta secca e persistenza salina.")
    when 30
      w.merge!(nome_vino: "Valentino Brut Zero Riserva", produttore: "Podere Rocca dei Manzoni",
               categoria: "Alta Langa DOCG", regione: "Piemonte", zona: "Monforte d'Alba (Langhe)",
               denominazione: "Alta Langa DOCG / Metodo Classico",
               affinamento: "Passaggio in barrique e oltre 10 anni sui lieviti",
               note_profilo: "Pioniere del Metodo Classico nelle Langhe: complesso, burroso, tostato, agrumi canditi e lunghissima evoluzione.")
    when 31
      w.merge!(nome_vino: "D'Araprì Pas Dosé Metodo Classico", produttore: "D'Araprì",
               categoria: "Metodo Classico Italia", regione: "Puglia", zona: "San Severo (Daunia / Capitanata)",
               denominazione: "Vino Spumante di Qualità Metodo Classico",
               uvaggio: "Bombino Bianco 70%, Pinot Nero 30%",
               affinamento: "Almeno 30 mesi sui lieviti nei sotterranei di San Severo",
               note_profilo: "Riferimento del Metodo Classico del Sud Italia: pesca gialla, fiori d'arancio, pasticceria e vena sapida.")
    when 32
      w.merge!(nome_vino: "Milazzo Nature Brut", produttore: "G. Milazzo",
               categoria: "Metodo Classico Italia", regione: "Sicilia", zona: "Campobello di Licata (Agrigento)",
               denominazione: "Sicilia DOC Spumante Metodo Classico (Biologico)",
               uvaggio: "Chardonnay 100%",
               affinamento: "Oltre 24-30 mesi sui lieviti",
               note_profilo: "Bollicina solare e mediterranea: zagara, cedro, erbe aromatiche siciliane e finale marino.")
    when 33
      w.merge!(nome_vino: "Riserva V38AG Metodo Classico Brut", produttore: "G. Milazzo",
               categoria: "Metodo Classico Italia", regione: "Sicilia", zona: "Campobello di Licata (Agrigento)",
               denominazione: "Vino Spumante di Qualità Metodo Classico Riserva",
               uvaggio: "Inzolia e Chardonnay",
               affinamento: "Lungo affinamento sui lieviti (oltre 36-48 mesi) con uve da vecchi ceppi V38AG",
               note_profilo: "Intenso, cremoso e complesso: ginestra, agrumi canditi, mandorla di Sicilia e crosta di pane.")
    when 261, 262, 263, 264
      w.merge!(nome_vino: "Federico II / Duca di Montalbo Selezione di Famiglia", produttore: "G. Milazzo",
               categoria: "Metodo Classico Italia", regione: "Sicilia", zona: "Campobello di Licata (Agrigento)",
               denominazione: "Vino Spumante di Qualità Metodo Classico Riserva",
               uvaggio: "Chardonnay 100% (selezioni clonali storiche)",
               affinamento: "Lunghissimo affinamento sui lieviti (oltre 7-10 anni)",
               note_profilo: "Riserva storica di Casa Milazzo (#{ann}): evoluzione nobile, burro di nocciola, agrumi canditi, spezie e mineralità calcareo-gessosa.")
    when 34
      w.merge!(nome_vino: "Leonia Pomino Brut Metodo Classico", produttore: "Frescobaldi (Castello Pomino)",
               categoria: "Metodo Classico Italia", regione: "Toscana", zona: "Pomino (Rufina, Firenze)",
               denominazione: "Pomino Spumante DOC Metodo Classico",
               uvaggio: "Chardonnay 90%, Pinot Nero 10%",
               affinamento: "Parziale fermentazione in legno; 36 mesi sui lieviti",
               note_profilo: "Da vigneti d'alta quota a Castello Pomino (fino a 700m): elegante, pasticceria, fiori bianchi e agrumi.")
    when 35
      w.merge!(nome_vino: "Blanc de Morgex et de La Salle Extra Brut 'X.T.'", produttore: "Cave Mont Blanc de Morgex et La Salle",
               categoria: "Metodo Classico Italia", regione: "Valle d'Aosta", zona: "Valdigne (Morgex e La Salle, 1200m s.l.m.)",
               denominazione: "Valle d'Aosta Blanc de Morgex et de La Salle DOC Metodo Classico",
               uvaggio: "Prié Blanc 100% (vigne franche di piede a 1.200m)",
               affinamento: "Oltre 36-48 mesi sui lieviti con 10 cuvée d'annata",
               note_profilo: "Spumante estremo d'alta quota: cristallino, mela di montagna, erbe alpine, ghiacciaio e mineralità di roccia.")
    when 36
      w.merge!(nome_vino: "Io Aura Lessini Durello Riserva Pas Dosé", produttore: "Tonello",
               categoria: "Metodo Classico Italia", regione: "Veneto", zona: "Monti Lessini (Vicenza)",
               denominazione: "Lessini Durello Riserva DOC Metodo Classico",
               uvaggio: "Durella 100%",
               affinamento: "60 mesi sui lieviti su suoli vulcanici basaltici",
               note_profilo: "Elettrico e vulcanico: acidità vibrante tipica dell'uva Durella, pompelmo, pietra focaia e mandorla tostata.")
    when 37, 254
      w.merge!(nome_vino: "Riserva del Fondatore Metodo Classico Extra Brut", produttore: "Zamuner",
               categoria: "Metodo Classico Italia", regione: "Veneto", zona: "Sona (Colline Moreniche del Garda, Verona)",
               denominazione: "Vino Spumante di Qualità Metodo Classico Riserva",
               uvaggio: "Pinot Nero 70%, Pinot Meunier 20%, Chardonnay 10%",
               affinamento: "Oltre 90-100 mesi sui lieviti con ricettazione storica estilo Champagne",
               note_profilo: "Storica bollicina veronese da sole uve champenoise: evoluta, pan brioche, frutta secca e finale asciutto.")
    when 38
      w.merge!(nome_vino: "Superiore di Cartizze Valdobbiadene DOCG Dry", produttore: "Andreola",
               categoria: "Prosecco Superiore DOCG", regione: "Veneto", zona: "Valdobbiadene - Collina del Cartizze (Treviso)",
               denominazione: "Valdobbiadene Superiore di Cartizze DOCG",
               uvaggio: "Glera 100%",
               affinamento: "Metodo Martinotti/Charmat in autoclave da uve del cru storico di Cartizze",
               note_profilo: "Il Grand Cru del Prosecco Superiore: rosa bianca, pesca matura, pera glassata, cremosità avvolgente e fine sapidità.")
    when 49, 61
      w.merge!(nome_vino: "Rosé Rosa Metodo Classico Brut", produttore: "Villa Rinaldi",
               categoria: "Metodo Classico Rosé", regione: "Veneto", zona: "Soave / Trentino",
               denominazione: "Vino Spumante di Qualità Metodo Classico Rosé",
               uvaggio: "Pinot Nero 100%",
               affinamento: "Maturazione della base in barrique di rovere francese; lungo affinamento sui lieviti",
               note_profilo: "Rosé de Saignée cremoso e strutturato: fragolina di bosco, vaniglia, rosa canina e morbidezza vellutata.")
      w[:correzioni] << "Categoria corretta da Rosso a Bollicine (Metodo Classico Rosé)" if row_num == 49
    when 59
      w.merge!(nome_vino: "La Fiorita Franciacorta Rosé", produttore: "La Fiorita",
               categoria: "Metodo Classico Rosé", regione: "Lombardia", zona: "Franciacorta (Ome, Brescia)",
               denominazione: "Franciacorta Rosé DOCG",
               uvaggio: "Pinot Nero 50%, Chardonnay 50%",
               affinamento: "Almeno 24-30 mesi sui lieviti",
               note_profilo: "Fresco e fragrante: ribes rosso, melograno, lieviti fini e chiusura agrumata.")
    when 60
      w.merge!(nome_vino: "Trento DOC Brut Rosé Millesimato", produttore: "Letrari",
               categoria: "Metodo Classico Rosé", regione: "Trentino-Alto Adige", zona: "Vallagarina (Trentino)",
               denominazione: "Trento DOC Rosé",
               uvaggio: "Pinot Nero 60%, Chardonnay 40%",
               affinamento: "36 mesi sui lieviti",
               note_profilo: "Elegante Rosé di montagna: frutti di bosco freschi, mela rossa, crosta di pane e vena sapida.")
    when 62
      w.merge!(nome_vino: "Valentino Brut Elena Riserva Rosé", produttore: "Podere Rocca dei Manzoni",
               categoria: "Metodo Classico Rosé", regione: "Piemonte", zona: "Monforte d'Alba (Langhe)",
               denominazione: "Alta Langa Rosé DOCG / Metodo Classico",
               uvaggio: "Pinot Nero 90%, Chardonnay 10%",
               affinamento: "Passaggio in barrique e 48-60 mesi sui lieviti",
               note_profilo: "Rosé gastronomico e strutturato: amarena, lampone, spezie dolci e perlage finissimo.")
    when 164
      w.merge!(nome_vino: "Erpacrife Nebbiolo d'Alba Spumante Rosé Dosaggio Zero", produttore: "Erpacrife",
               categoria: "Metodo Classico Rosé", regione: "Piemonte", zona: "Langhe (Castagnito / Alba)",
               denominazione: "Nebbiolo d'Alba Spumante DOC Rosé Metodo Classico",
               uvaggio: "Nebbiolo 100%",
               affinamento: "Oltre 36-48 mesi sui lieviti, dosaggio zero",
               note_profilo: "Raro Metodo Classico da Nebbiolo in purezza di 4 giovani enologi: rosa appassita, melograno, arancia sanguinella e tannino finissimo.")
      w[:correzioni] << "Categoria corretta da Rosso a Bollicine (Metodo Classico Rosé)"
    when 166
      w.merge!(nome_vino: "Crémant de Bourgogne Brut", produttore: "Domaine François Mikulski",
               categoria: "Metodo Classico Internazionale", nazione: "Francia", regione: "Borgogna",
               zona: "Meursault (Côte de Beaune)", denominazione: "Crémant de Bourgogne AOC",
               annata: "s.a.",
               uvaggio: "Chardonnay, Pinot Noir, Aligoté",
               affinamento: "24-36 mesi sui lieviti a Meursault",
               note_profilo: "Crémant d'autore firmato da uno dei grandi vignerons di Meursault: teso, minerale, agrumi e nocciola.")
      w[:correzioni] << "Categoria corretta da Bianco Fermo a Bollicine (Crémant de Bourgogne)"
    when 205
      w.merge!(nome_vino: "Dogma Alta Langa Blanc de Noirs Pas Dosé", produttore: "Borgo Maragliano",
               categoria: "Alta Langa DOCG", regione: "Piemonte", zona: "Loazzolo (Alta Langa Astigiana)",
               denominazione: "Alta Langa DOCG",
               uvaggio: "Pinot Nero 100%",
               affinamento: "Almeno 36 mesi sui lieviti a 450m di altitudine",
               note_profilo: "Blanc de Noirs d'alta collina: teso, verticale, erbe aromatiche, pompelmo e crosta di pane.")
    when 236
      w.merge!(nome_vino: "Cuvée 'More' Brut / Pas Dosé Metodo Classico", produttore: "Castello di Cigognola (Moratti)",
               categoria: "Metodo Classico Italia", regione: "Lombardia", zona: "Oltrepò Pavese (Cigognola)",
               denominazione: "Oltrepò Pavese Metodo Classico DOCG Pinot Nero",
               uvaggio: "Pinot Nero 100%",
               affinamento: "Almeno 30-36 mesi sui lieviti",
               note_profilo: "Purezza del Pinot Nero dell'Oltrepò Pavese: ribes, agrumi, salvia, sapidità e grande eleganza.")
    end

  # --- VINI ROSATI FERMI ---
  when [58, 149].include?(row_num)
    w[:macro_tipologia] = "Vino Rosato"
    w[:categoria] = "Rosato Fermo"
    w[:nazione] = "Italia"
    case row_num
    when 58
      w.merge!(nome_vino: "Erreò Catalanesca / Vesuvio Rosato", produttore: "Cantine Olivella",
               regione: "Campania", zona: "Parco Nazionale del Vesuvio (Sant'Anastasia)",
               denominazione: "Campania IGT / Vesuvio DOC Rosato",
               uvaggio: "Piedirosso (Palummella) e Guarnaccia Nera da suoli vulcanici",
               affinamento: "Acciaio sui lieviti fini",
               note_profilo: "Rosato vulcanico del Monte Somma: ciliegia fresca, melograno, cenere lavica e spiccata sapidità.")
    when 149
      w.merge!(nome_vino: "Calafuria Rosato Salento IGT", produttore: "Tormaresca (Marchesi Antinori)",
               regione: "Puglia", zona: "Salento",
               denominazione: "Salento IGT Rosato",
               uvaggio: "Negroamaro 100%",
               affinamento: "Acciaio inox a temperatura controllata",
               note_profilo: "Celebre rosato salentino: pesca rosa, pompelmo, violetta, freschezza marina e beva irresistibile.")
      w[:correzioni] << "Categoria corretta da Rosso a Vino Rosato"
    end
  end

  w
end
