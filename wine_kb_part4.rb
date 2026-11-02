# encoding: UTF-8

def enrich_red_wines_part2(row_num, w)
  case row_num
  # --- TOSCANA: BRUNELLO, BOLGHERI, CHIANTI CLASSICO, SUPERTUSCAN, MAREMMA ---
  when 43
    w.merge!(nome_vino: "Brunello di Montalcino 'Pianrosso' DOCG", produttore: "Ciacci Piccolomini d'Aragona",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "36 mesi in botti di rovere di Slavonia da 20-62 hl + oltre 8 mesi in bottiglia",
             note_profilo: "Cru Pianrosso a Castelnuovo dell'Abate: potente, balsamico, marasca, erbe mediterranee, cuoio e tannino aristocratico.")
  when 127, 128, 129, 283
    w.merge!(nome_vino: "Arnione Bolgheri Superiore DOC", produttore: "Campo alla Sughera",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Superiore DOC",
             uvaggio: "Cabernet Sauvignon 40%, Cabernet Franc 20%, Merlot 20%, Petit Verdot 20%",
             affinamento: "18 mesi in barrique di rovere francese (nuove al 50%) + 24 mesi in bottiglia",
             note_profilo: "Bolgheri Superiore di grande sartorialità: mora, ribes nero, mirto, tabacco biondo, grafite e bocca setosa.")
  when 334
    w.merge!(nome_vino: "Campo alla Sughera IGT Toscana / Adèo Bolgheri", produttore: "Campo alla Sughera",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Toscana IGT / Bolgheri DOC",
             uvaggio: "Petit Verdot e Cabernet Franc (o Cabernet Sauvignon / Merlot)",
             affinamento: "18-24 mesi in barrique di rovere francese",
             note_profilo: "Selezione di punta di Campo alla Sughera: concentrazione, mirtillo, cioccolato amaro, macchia costiera e speziatura nobile.")
  when 139
    w.merge!(nome_vino: "Brunello di Montalcino DOCG", produttore: "Tenute Silvio Nardi",
             regione: "Toscana", zona: "Montalcino (Versante Nord-Ovest - Casale del Bosco)", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "12 mesi in barrique di rovere francese e 18 mesi in botte grande di Slavonia",
             note_profilo: "Brunello elegante e forestale dal quadrante nord-ovest: piccoli frutti rossi, ginepro, eucalipto, viola e freschezza.")
  when 352
    w.merge!(nome_vino: "Rosso di Montalcino DOC", produttore: "Tenute Silvio Nardi",
             regione: "Toscana", zona: "Montalcino", denominazione: "Rosso di Montalcino DOC",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "12 mesi in botti di rovere di Slavonia e barrique usate",
             note_profilo: "Rosso di Montalcino fragrante e dinamico: ciliegia croccante, arancia sanguinella, erbe aromatiche e tannino vivace.")
  when 140
    w.merge!(nome_vino: "Brunello di Montalcino 'Cerretalto' DOCG", produttore: "Casanova di Neri",
             regione: "Toscana", zona: "Montalcino (Anfiteatro Cerretalto - Torrente Asso)", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "Oltre 36 mesi in botti di rovere + 24 mesi in bottiglia",
             note_profilo: "Leggendario cru da 100 punti da un anfiteatro naturale ricco di galestro e grafite: potenza monumentale, ferro, tartufo, amarena e longevità eterna.")
  when 141
    w.merge!(nome_vino: "Brunello di Montalcino 'Giovanni Neri' DOCG", produttore: "Casanova di Neri",
             regione: "Toscana", zona: "Montalcino (Sesta / Sud di Montalcino, vigne di 50 anni)", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "33 mesi in botti di rovere + lungo affinamento in bottiglia",
             note_profilo: "Cru dedicato al fondatore da vigne vecchie di mezzo secolo: purezza assoluta, rosa rossa, agrumi, seta tannica e finezza commovente.")
  when 142
    w.merge!(nome_vino: "Brunello di Montalcino 'Tenuta Nuova' DOCG", produttore: "Casanova di Neri",
             regione: "Toscana", zona: "Montalcino Sud (Sant'Angelo in Colle / Tavernelle)", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "30-36 mesi in botti di rovere + 18 mesi in bottiglia",
             note_profilo: "Vincitore del titolo di Miglior Vino del Mondo per Wine Spectator: mediterraneo, avvolgente, rosmarino, ciliegia nera e spezie dolci.")
  when 326
    w.merge!(nome_vino: "Brunello di Montalcino DOCG (Etichetta Bianca)", produttore: "Casanova di Neri",
             regione: "Toscana", zona: "Montalcino", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "42 mesi in botti di rovere + 6 mesi in bottiglia",
             note_profilo: "La storica Etichetta Bianca di Casanova di Neri: equilibrio classico, marasca, violetta, cuoio e tannino levigato.")
  when 351
    w.merge!(nome_vino: "Rosso di Montalcino 'Giovanni Neri / Etichetta Rossa' DOC", produttore: "Casanova di Neri",
             regione: "Toscana", zona: "Montalcino", denominazione: "Rosso di Montalcino DOC",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "15 mesi in botti di rovere",
             note_profilo: "Un 'piccolo Brunello' di straordinaria stoffa: ciliegia matura, viola, pepe nero e grande struttura.")
  when 143, 144
    w.merge!(nome_vino: "Brunello di Montalcino DOCG", produttore: "Le Ragnaie",
             regione: "Toscana", zona: "Montalcino (Passo del Lume Spento, 600m s.l.m. - vigne più alte di Montalcino)", denominazione: "Brunello di Montalcino DOCG (Biologico)",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "36 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Brunello d'alta quota dallo stile verticale e borgognone: ribes rosso, scorza d'arancia, erbe officinali e tensione salina.")
  when 165, 361
    w.merge!(nome_vino: "Flaccianello della Pieve Colli della Toscana Centrale IGT", produttore: "Fontodi",
             regione: "Toscana", zona: "Panzano in Chianti (Conca d'Oro)", denominazione: "Colli della Toscana Centrale IGT (Biologico)",
             uvaggio: "Sangiovese 100%", affinamento: "24 mesi in barrique di rovere francese (Troncais e Allier) e anfore/botti",
             note_profilo: "Mito assoluto del Sangiovese in purezza dalla Conca d'Oro di Panzano: amarena, violetta, grafite, incenso e maestosità tannica.")
  when 341
    w.merge!(nome_vino: "Chianti Classico DOCG", produttore: "Fontodi",
             regione: "Toscana", zona: "Panzano in Chianti (Conca d'Oro)", denominazione: "Chianti Classico DOCG (Biologico)",
             uvaggio: "Sangiovese 100%", affinamento: "18 mesi in barrique e botti di rovere francese",
             note_profilo: "Uno dei Chianti Classico d'annata più ricchi e completi: ciliegia nera, mammola, terra bagnata e freschezza vibrante.")
  when 360
    w.merge!(nome_vino: "Filetta di Lamole Chianti Classico DOCG", produttore: "Fontodi",
             regione: "Toscana", zona: "Lamole (Greve in Chianti, 600m s.l.m.)", denominazione: "Chianti Classico DOCG (Biologico)",
             uvaggio: "Sangiovese 100%", affinamento: "18 mesi in botti grandi di rovere",
             note_profilo: "Da terrazzamenti d'alta quota su arenaria a Lamole: profumatissimo, iris, fragolina, pepe bianco e finezza montana.")
  when 466
    w.merge!(nome_vino: "Case Via Syrah Colli della Toscana Centrale IGT", produttore: "Fontodi",
             regione: "Toscana", zona: "Panzano in Chianti", denominazione: "Colli della Toscana Centrale IGT (Biologico)",
             uvaggio: "Syrah 100%", affinamento: "18 mesi in barrique e anfore di terracotta",
             note_profilo: "Syrah toscano di timbro rodaniano: mora selvatica, pepe nero in grani, oliva nera, cacao e spezie affumicate.")
  when 169
    w.merge!(nome_vino: "Villa Antinori / Marchese Antinori Chianti Classico Riserva DOCG", produttore: "Marchesi Antinori",
             regione: "Toscana", zona: "Chianti Classico (San Casciano / Tignanello)", denominazione: "Chianti Classico Riserva DOCG",
             uvaggio: "Sangiovese 90%, Cabernet Sauvignon e Merlot 10%",
             affinamento: "14-16 mesi tra botti grandi e barrique di rovere francese e ungherese + 12 mesi in bottiglia",
             note_profilo: "Storica Riserva di Casa Antinori: marasca, viola, tabacco dolce, spezie e tannino vellutato.")
  when 278
    w.merge!(nome_vino: "50 & 50 Toscana IGT", produttore: "Avignonesi & Capannelle",
             regione: "Toscana", zona: "Montepulciano & Gaiole in Chianti", denominazione: "Toscana IGT Rosso",
             uvaggio: "Merlot 50% (Avignonesi, Montepulciano), Sangiovese 50% (Capannelle, Chianti Classico)",
             affinamento: "24 mesi in barrique di rovere francese + oltre 12 mesi in bottiglia",
             note_profilo: "Celebre joint-venture nata nel 1988: fusione perfetta tra la seta avvolgente del Merlot e la spina dorsale toscana del Sangiovese.")
  when 284
    w.merge!(nome_vino: "Baffonero Maremma Toscana DOC", produttore: "Rocca di Frassinello",
             regione: "Toscana", zona: "Gavorrano (Maremma Toscana)", denominazione: "Maremma Toscana DOC Merlot",
             uvaggio: "Merlot 100% (Vigna Baffonero)", affinamento: "14 mesi in barrique nuove di rovere francese al 100% + 12 mesi in bottiglia",
             note_profilo: "Il grande Merlot in purezza di Rocca di Frassinello (progetto Castellare + Domaines Barons de Rothschild Lafite): opulento, mora, espresso, vaniglia e velluto.")
  when 395, 396
    w.merge!(nome_vino: "Le Sughere di Frassinello Maremma Toscana DOC", produttore: "Rocca di Frassinello",
             regione: "Toscana", zona: "Gavorrano (Maremma Toscana)", denominazione: "Maremma Toscana DOC Rosso",
             uvaggio: "Sangioveto 50%, Cabernet Sauvignon 25%, Merlot 25%",
             affinamento: "12 mesi in barrique di rovere francese (50% nuove) + 9 mesi in bottiglia",
             note_profilo: "Secondo vino della joint-venture italo-francese con Lafite-Rothschild: mirto, amarena, spezie mediterranee ed eleganza bordolese.")
  when 426, 427
    w.merge!(nome_vino: "Ornello Maremma Toscana DOC", produttore: "Rocca di Frassinello",
             regione: "Toscana", zona: "Gavorrano (Maremma Toscana)", denominazione: "Maremma Toscana DOC Rosso",
             uvaggio: "Sangioveto 40%, Cabernet Sauvignon 20%, Merlot 20%, Syrah 20%",
             affinamento: "10 mesi in barrique di rovere francese + 6 mesi in bottiglia",
             note_profilo: "Taglio maremmano moderno con un tocco speziato di Syrah: frutti di bosco, pepe nero, macchia costiera e morbidezza.")
  when 322
    w.merge!(nome_vino: "Grattamacco Bolgheri Rosso DOC", produttore: "Grattamacco (Collemassari)",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Rosso DOC (Biologico)",
             uvaggio: "Cabernet Sauvignon 60%, Cabernet Franc 20%, Merlot 10%, Sangiovese 10%",
             affinamento: "10 mesi in barrique di primo e secondo passaggio",
             note_profilo: "Dalla seconda cantina storica nata a Bolgheri (1977): balsamico, pino marittimo, ribes, ciliegia e freschezza data dal Sangiovese.")
  when 323, 389
    w.merge!(nome_vino: "L'Alberello Bolgheri Superiore DOC", produttore: "Grattamacco (Collemassari)",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Superiore DOC (Biologico)",
             uvaggio: "Cabernet Sauvignon 70%, Cabernet Franc 30% (vigna ad alberello)",
             affinamento: "18 mesi in barrique di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Cru da una singola vigna allevata ad alberello: profumi inebrianti di macchia mediterranea, cassis, grafite, spezie e bocca setosa.")
  when 378, 379
    w.merge!(nome_vino: "Grattamacco Bolgheri Superiore DOC", produttore: "Grattamacco (Collemassari)",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci, collina a 100-200m)", denominazione: "Bolgheri Superiore DOC (Biologico)",
             uvaggio: "Cabernet Sauvignon 65%, Merlot 20%, Sangiovese 15%",
             affinamento: "18 mesi in barrique di rovere francese + oltre 12 mesi in bottiglia",
             note_profilo: "Uno dei pilastri storici di Bolgheri: inconfondibile firma balsamica di eucalipto, rosmarino, amarena, tabacco e sapidità marina.")
  when 325
    w.merge!(nome_vino: "Il Bruciato Bolgheri DOC", produttore: "Tenuta Guado al Tasso (Marchesi Antinori)",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Rosso DOC",
             uvaggio: "Cabernet Sauvignon 65%, Merlot 20%, Syrah 15%",
             affinamento: "8 mesi in barrique di rovere e 4 mesi in bottiglia",
             note_profilo: "Intenso, avvolgente e mediterraneo: mora matura, prugna, spezie dolci, liquirizia e tannini morbidi.")
  when 380
    w.merge!(nome_vino: "Guado al Tasso Bolgheri Superiore DOC", produttore: "Tenuta Guado al Tasso (Marchesi Antinori)",
             regione: "Toscana", zona: "Bolgheri (Anfiteatro Bolgherese)", denominazione: "Bolgheri Superiore DOC",
             uvaggio: "Cabernet Sauvignon 60%, Merlot 25%, Cabernet Franc 12%, Petit Verdot 3%",
             affinamento: "18 mesi in barrique nuove di rovere francese + 10 mesi in bottiglia",
             note_profilo: "Grand Vin della tenuta bolgherese degli Antinori: mirtillo, cassis, mirto, moka, cioccolato fondente e regale potenza vellutata.")
  when 327
    w.merge!(nome_vino: "Brunello di Montalcino DOCG", produttore: "Ciacci Piccolomini d'Aragona",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "Oltre 24 mesi in botti di rovere di Slavonia + oltre 4 mesi in bottiglia",
             note_profilo: "Classico Brunello di Castelnuovo dell'Abate: ciliegia matura, erbe mediterranee, spezie calde e struttura solida.")
  when 328
    w.merge!(nome_vino: "Brunello di Montalcino DOCG", produttore: "Poggio di Sotto",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate", denominazione: "Brunello di Montalcino DOCG (Biologico)",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "48 mesi in grandi botti di rovere di Slavonia da 30 hl + 12 mesi in bottiglia",
             note_profilo: "Tra i Brunello più venerati e ricercati al mondo: purezza eterea, arancia sanguinella, rosa canina, ferro, incenso e leggiadria infinita.")
  when 329
    w.merge!(nome_vino: "Brunello di Montalcino Riserva DOCG", produttore: "Poggio di Sotto",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate", denominazione: "Brunello di Montalcino Riserva DOCG (Biologico)",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "60 mesi (5 anni) in grandi botti di rovere di Slavonia + 12 mesi in bottiglia",
             note_profilo: "Rarissimo capolavoro da collezione prodotto in pochissime bottiglie: profondità mistica, erbe balsamiche, ciliegia, grafite e seta immortale.")
  when 330
    w.merge!(nome_vino: "Vigna Ferrovia Brunello di Montalcino Riserva DOCG", produttore: "Pian delle Vigne (Marchesi Antinori)",
             regione: "Toscana", zona: "Montalcino (Camigliano)", denominazione: "Brunello di Montalcino Riserva DOCG",
             uvaggio: "Sangiovese Grosso 100% (Singolo Vigneto Vigna Ferrovia)",
             affinamento: "Oltre 24-30 mesi in botti di rovere + lungo affinamento in bottiglia",
             note_profilo: "Cru Riserva prodotto solo nelle grandi annate accanto alla storica stazioncina ferroviaria: amarena, tabacco, viola, spezie e cacao.")
  when 331
    w.merge!(nome_vino: "Cabraia Suvereto DOCG / Costa Toscana IGT", produttore: "Gualdo del Re",
             regione: "Toscana", zona: "Suvereto (Val di Cornia, Livorno)", denominazione: "Suvereto DOCG / Toscana IGT Cabernet (Biologico)",
             uvaggio: "Cabernet Sauvignon 100%", affinamento: "18 mesi in barrique nuove di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Grande Cabernet della Val di Cornia: ribes nero, peperone arrostito, eucalipto, vaniglia e struttura imponente.")
  when 340, 342, 343
    w.merge!(nome_vino: "Chianti Classico DOCG", produttore: "Castellare di Castellina",
             regione: "Toscana", zona: "Castellina in Chianti (Siena)", denominazione: "Chianti Classico DOCG",
             uvaggio: "Sangioveto 95%, Canaiolo 5%", affinamento: "7 mesi in barrique di rovere francese usate + 7 mesi in bottiglia",
             note_profilo: "Con le iconiche etichette degli uccellini: autentico Chianti Classico da sole uve autoctone, profumato di mammola, ciliegia e iris.")
  when 385
    w.merge!(nome_vino: "I Sodi di San Niccolò Toscana IGT", produttore: "Castellare di Castellina",
             regione: "Toscana", zona: "Castellina in Chianti (Siena)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Sangioveto 85%, Malvasia Nera 15%", affinamento: "24-30 mesi in barrique di rovere francese (50% nuove) + 12 mesi in bottiglia",
             note_profilo: "Supertuscan orgogliosamente autoctono: finezza aristocratica, marasca, cuoio fiorentino, viola, spezie e longevità leggendaria.")
  when 438
    w.merge!(nome_vino: "Poggio ai Merli Toscana IGT", produttore: "Castellare di Castellina",
             regione: "Toscana", zona: "Castellina in Chianti (Siena)", denominazione: "Toscana IGT Merlot",
             uvaggio: "Merlot 100%", affinamento: "18-24 mesi in barrique nuove di rovere francese",
             note_profilo: "Singolo vigneto di Merlot nel cuore del Chianti Classico: prugna nera, mirtillo, cioccolato, caffè e trama vellutata.")
  when 344
    w.merge!(nome_vino: "Ciliegiolo Toscana IGT", produttore: "Mastrojanni",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate", denominazione: "Toscana IGT Rosso",
             uvaggio: "Ciliegiolo 100%", affinamento: "Maturazione tra cemento e legno",
             note_profilo: "Raro Ciliegiolo in purezza dalle terre di Montalcino: esplosione di ciliegia fresca, pepe nero, macchia mediterranea e succosità.")
  when 477
    w.merge!(nome_vino: "Vigna Loreto Brunello di Montalcino DOCG", produttore: "Mastrojanni",
             regione: "Toscana", zona: "Montalcino - Castelnuovo dell'Abate (Cru Vigna Loreto)", denominazione: "Brunello di Montalcino DOCG",
             uvaggio: "Sangiovese Grosso 100%", affinamento: "36 mesi in botti di rovere di Allier + oltre 12 mesi in bottiglia",
             note_profilo: "Cru storico di Mastrojanni nella straordinaria annata 2016: profondo, minerale, frutti neri, erbe officinali, tabacco e tannini scolpiti.")
  when 375
    w.merge!(nome_vino: "Giusto di Notri Toscana IGT", produttore: "Tua Rita",
             regione: "Toscana", zona: "Suvereto (Val di Cornia, Livorno)", denominazione: "Toscana IGT Rosso (Biologico)",
             uvaggio: "Cabernet Sauvignon 60%, Merlot 30%, Cabernet Franc 10%",
             affinamento: "18 mesi in barrique di rovere francese (nuove e di secondo passaggio)",
             note_profilo: "Il grande taglio bordolese di Tua Rita (cantina del Redigaffi): cassis, mora, macchia tirrenica, grafite e freschezza balsamica.")
  when 381, 382
    w.merge!(nome_vino: "Guidalberto Toscana IGT", produttore: "Tenuta San Guido",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Cabernet Sauvignon 60%, Merlot 40%", affinamento: "15 mesi in barrique di rovere francese e americano",
             note_profilo: "Secondo vino della Tenuta del Sassicaia: elegante, armonioso, piccoli frutti neri, cipresso, spezie fini e tannino setoso.")
  when 393
    w.merge!(nome_vino: "Le Difese Toscana IGT", produttore: "Tenuta San Guido",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Cabernet Sauvignon 70%, Sangiovese 30%", affinamento: "12 mesi in barrique di rovere francese e americano",
             note_profilo: "Incontro tra lo stile bordolese di Tenuta San Guido e la vivacità toscana del Sangiovese: ciliegia, ribes, erbe aromatiche e beva agile.")
  when 454, 455, 456, 457, 458, 459
    w.merge!(nome_vino: "Sassicaia Bolgheri Sassicaia DOC", produttore: "Tenuta San Guido",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Sassicaia DOC",
             uvaggio: "Cabernet Sauvignon 85%, Cabernet Franc 15%",
             affinamento: "24 mesi in barrique di rovere francese (1/3 nuove) + affinamento in bottiglia",
             note_profilo: "L'icona assoluta del vino italiano nel mondo (unico vino aziendale con una DOC dedicata): classe aristocratica, cassis, macchia mediterranea, cedro, grafite e armonia senza tempo.")
  when 394
    w.merge!(nome_vino: "Le Serre Nuove dell'Ornellaia Bolgheri Rosso DOC", produttore: "Tenuta dell'Ornellaia",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Rosso DOC",
             uvaggio: "Merlot, Cabernet Sauvignon, Cabernet Franc, Petit Verdot",
             affinamento: "15 mesi in barrique di rovere francese (25% nuove) + 6 mesi in bottiglia",
             note_profilo: "'Second Vin' dell'Ornellaia: avvolgente, generoso, frutti di bosco maturi, spezie tostate, mirto e tannino vellutato.")
  when 397
    w.merge!(nome_vino: "Le Volte dell'Ornellaia Toscana IGT", produttore: "Tenuta dell'Ornellaia",
             regione: "Toscana", zona: "Bolgheri / Toscana", denominazione: "Toscana IGT Rosso",
             uvaggio: "Merlot, Sangiovese, Cabernet Sauvignon",
             affinamento: "10 mesi in barrique usate per l'Ornellaia e vasche di cemento",
             note_profilo: "Mediterraneo, fragrante e gastronomico: ciliegia rossa, mora, pepe nero e piacevole freschezza.")
  when 423, 424, 425
    w.merge!(nome_vino: "Ornellaia Bolgheri Superiore DOC", produttore: "Tenuta dell'Ornellaia",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Superiore DOC",
             uvaggio: "Cabernet Sauvignon (~50-55%), Merlot (~25%), Cabernet Franc (~10-12%), Petit Verdot (~8-10%)",
             affinamento: "18 mesi in barrique di rovere francese (70% nuove) + 12 mesi in bottiglia",
             note_profilo: "Capolavoro bolgherese (Vendemmia d'Artista): opulenza e precisione, ribes nero, erbe balsamiche, tabacco, cacao e persistenza regale.")
  when 398, 399, 400
    w.merge!(nome_vino: "Lupicaia Costa Toscana IGT", produttore: "Castello del Terriccio",
             regione: "Toscana", zona: "Castellina Marittima (Costa Pisana)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Cabernet Sauvignon 85%, Petit Verdot 15%",
             affinamento: "22 mesi in tonneau e barrique nuove di rovere francese d'Allier + 18 mesi in bottiglia",
             note_profilo: "Uno dei più grandi Supertuscan della costa tirrenica: potenza maestosa, mora, mirto, eucalipto, grafite e longevità straordinaria.")
  when 407
    w.merge!(nome_vino: "Montesodi Chianti Rufina Riserva 1974", produttore: "Frescobaldi (Castello Nipozzano) / Antinori",
             regione: "Toscana", zona: "Chianti Rufina (Pelago, Firenze)", denominazione: "Chianti Rufina Riserva DOCG",
             uvaggio: "Sangiovese 100%", affinamento: "Botti di rovere austriaco e francese + mezzo secolo di riposo in bottiglia",
             note_profilo: "Prima storica annata (1974) del cru Montesodi a Castello Nipozzano: rarità assoluta da collezione.")
  when 408
    w.merge!(nome_vino: "Monteverro Costa Toscana IGT", produttore: "Monteverro",
             regione: "Toscana", zona: "Capalbio (Maremma Sud)", denominazione: "Costa Toscana IGT Rosso",
             uvaggio: "Cabernet Sauvignon 40%, Cabernet Franc 30%, Merlot 20%, Petit Verdot 10%",
             affinamento: "24 mesi in barrique di rovere francese (70% nuove)",
             note_profilo: "Il 'Premier Cru' della Maremma a Capalbio: concentrazione, cassis, macchia mediterranea, spezie esotiche e tannini cesellati.")
  when 473
    w.merge!(nome_vino: "Tinata Costa Toscana IGT", produttore: "Monteverro",
             regione: "Toscana", zona: "Capalbio (Maremma Sud)", denominazione: "Costa Toscana IGT Rosso",
             uvaggio: "Syrah 70%, Grenache 30%", affinamento: "16 mesi in barrique di rovere francese, uova di cemento e anfora",
             note_profilo: "Omaggio ai grandi vini del Rodano sulle colline di Capalbio: garrigue, pepe nero, amarena, lavanda e velluto.")
  when 409
    w.merge!(nome_vino: "Montevertine Toscana IGT", produttore: "Montevertine",
             regione: "Toscana", zona: "Radda in Chianti (Siena, 425m s.l.m.)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Sangiovese 90%, Canaiolo 5%, Colorino 5%",
             affinamento: "Fermentazione in vasche di cemento e 24 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Purezza leggendaria del Sangiovese d'alta quota di Radda: ciliegia rossa, arancia sanguinella, violetta, ferro e tensione vibrante.")
  when 429
    w.merge!(nome_vino: "Le Pergole Torte Toscana IGT", produttore: "Montevertine",
             regione: "Toscana", zona: "Radda in Chianti (Siena)", denominazione: "Toscana IGT Sangiovese",
             uvaggio: "Sangiovese 100% (dalle vigne più vecchie piantate dal 1968)",
             affinamento: "12 mesi in barrique di rovere di Allier e 12 mesi in botti di rovere di Slavonia + 6 mesi in bottiglia",
             note_profilo: "Mito immortale con le etichette di Alberto Manfredi: l'essenza più pura e commovente del Sangiovese, tra rosa, lampone, ferro e seta.")
  when 431
    w.merge!(nome_vino: "Pian del Ciampolo Toscana IGT", produttore: "Montevertine",
             regione: "Toscana", zona: "Radda in Chianti (Siena)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Sangiovese 90%, Canaiolo 5%, Colorino 5%",
             affinamento: "12 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Fragrante, croccante e autentico: l'ingresso perfetto nello stile inconfondibile di Montevertine.")
  when 411
    w.merge!(nome_vino: "Morellino di Scansano DOCG", produttore: "Podere 414 (Simone Castelli)",
             regione: "Toscana", zona: "Scansano / Magliano in Toscana (Maremma)", denominazione: "Morellino di Scansano DOCG (Biologico)",
             uvaggio: "Sangiovese 85%, Ciliegiolo, Alicante, Colorino, Syrah 15%",
             affinamento: "12 mesi in tonneau e botti di rovere",
             note_profilo: "Morellino solare e succoso: marasca, prugna, macchia maremmana, spezie e grande piacevolezza.")
  when 463, 464
    w.merge!(nome_vino: "Solaia Toscana IGT", produttore: "Marchesi Antinori (Tenuta Tignanello)",
             regione: "Toscana", zona: "San Casciano in Val di Pesa (Collina del Solaia, Chianti Classico)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Cabernet Sauvignon 75%, Sangiovese 20%, Cabernet Franc 5%",
             affinamento: "18 mesi in barrique nuove di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Vertice assoluto di Casa Antinori dal vigneto più assolato di Tignanello: cassis, amarena, menta, cacao, grafite e potenza regale.")
  when 470, 471, 472
    w.merge!(nome_vino: "Tignanello Toscana IGT", produttore: "Marchesi Antinori (Tenuta Tignanello)",
             regione: "Toscana", zona: "San Casciano in Val di Pesa (Chianti Classico)", denominazione: "Toscana IGT Rosso",
             uvaggio: "Sangiovese 80%, Cabernet Sauvignon 15%, Cabernet Franc 5%",
             affinamento: "14-16 mesi in barrique di rovere francese e ungherese + 12 mesi in bottiglia",
             note_profilo: "Il primo storico Supertuscan (1971) che ha cambiato il vino italiano: ciliegia nera, viola, tabacco biondo, erbe balsamiche e armonia perfetta.")
  when 478
    w.merge!(nome_vino: "Villa Antinori Toscana IGT", produttore: "Marchesi Antinori",
             regione: "Toscana", zona: "Toscana", denominazione: "Toscana IGT Rosso",
             uvaggio: "Sangiovese, Cabernet Sauvignon, Merlot, Syrah",
             affinamento: "12 mesi in botti e barrique di rovere",
             note_profilo: "Storica etichetta creata nel 1928 da Niccolò Antinori: frutti rossi maturi, vaniglia leggera, spezie e morbidezza.")

  # --- VENETO, TRENTINO-ALTO ADIGE, FRIULI, LOMBARDIA, VALLE D'AOSTA ---
  when 48
    w.merge!(nome_vino: "Ros di Buri Merlot Friuli Colli Orientali DOC", produttore: "Meroi",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Merlot 100%", affinamento: "18-24 mesi in barrique di rovere francese",
             note_profilo: "Grande Merlot friulano di Paolo Meroi da vecchie vigne a Buttrio: amarena sotto spirito, cacao, spezie dolci, balsamico e potente.")
  when 333
    w.merge!(nome_vino: "Calvari Refosco dal Peduncolo Rosso Friuli Colli Orientali DOC", produttore: "Meroi",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Refosco dal Peduncolo Rosso 100%", affinamento: "24 mesi in barrique nuove di rovere francese",
             note_profilo: "Refosco monumentale prodotto in pochissime bottiglie: mora di rovo, pepe nero, inchiostro, liquirizia e struttura imponente.")
  when 420
    w.merge!(nome_vino: "Nestri Friuli Colli Orientali DOC Rosso", produttore: "Meroi",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Merlot 70%, Refosco 20%, Cabernet Franc 10%", affinamento: "12 mesi in barrique di rovere",
             note_profilo: "Rosso friulano avvolgente e gastronomico: prugna, frutti di bosco, erbe aromatiche e tannino morbido.")
  when 146, 147, 148
    w.merge!(nome_vino: "Pietro Dal Cero Amarone della Valpolicella DOCG", produttore: "Ca' dei Frati",
             regione: "Veneto", zona: "Valpolicella / Montecchia di Crosara (Verona)", denominazione: "Amarone della Valpolicella DOCG",
             uvaggio: "Corvina, Corvinone, Rondinella, Croatina",
             affinamento: "Appassimento di 4 mesi; 24 mesi in barrique + 12 mesi in botte grande + 24 mesi in bottiglia",
             note_profilo: "Amarone opulento e sontuoso dedicato al fondatore Pietro Dal Cero: amarena, cioccolato fondente, caffè, tabacco dolce e balsamico.")
  when 179
    w.merge!(nome_vino: "Vallée d'Aoste Donnas DOC", produttore: "Caves Coopératives de Donnas",
             regione: "Valle d'Aosta", zona: "Bassa Valle d'Aosta (Donnas)", denominazione: "Valle d'Aosta Donnas DOC",
             uvaggio: "Nebbiolo (Picotendro) 90%, Freisa e Neyret 10%",
             affinamento: "12-18 mesi in grandi botti di rovere",
             note_profilo: "Il 'fratello di montagna' del Barolo e del Carema da pergole eroiche su roccia: rosa alpina, ribes, pepe bianco e mineralità.")
  when 180
    w.merge!(nome_vino: "Villa Gresti Vigneti delle Dolomiti IGT", produttore: "Tenuta San Leonardo",
             regione: "Trentino-Alto Adige", zona: "Vallagarina - Avio (Trento)", denominazione: "Vigneti delle Dolomiti IGT Rosso (Biologico)",
             uvaggio: "Merlot 90%, Carmenère 10%", affinamento: "12-14 mesi in barrique di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Selezioni di Merlot e Carmenère della Tenuta San Leonardo: prugna matura, pepe verde, cacao e grande morbidezza.")
  when 335
    w.merge!(nome_vino: "Carmenère Vigneti delle Dolomiti IGT", produttore: "Tenuta San Leonardo",
             regione: "Trentino-Alto Adige", zona: "Vallagarina - Avio (Trento)", denominazione: "Vigneti delle Dolomiti IGT (Biologico)",
             uvaggio: "Carmenère 100% (vigne vecchie)", affinamento: "18-24 mesi in barrique di rovere francese + 18 mesi in bottiglia",
             note_profilo: "Rarissimo Carmenère in purezza prodotto solo nelle migliori annate: balsamico, foglia di pomodoro, pepe nero, eucalipto e seta.")
  when 446, 447, 448, 449, 450, 451, 452, 453
    w.merge!(nome_vino: "San Leonardo Vigneti delle Dolomiti IGT", produttore: "Tenuta San Leonardo",
             regione: "Trentino-Alto Adige", zona: "Vallagarina - Avio (Trento)", denominazione: "Vigneti delle Dolomiti IGT Rosso (Biologico)",
             uvaggio: "Cabernet Sauvignon 60%, Carmenère 30%, Merlot 10%",
             affinamento: "24 mesi in barrique di rovere francese di primo e secondo passaggio + 18 mesi in bottiglia",
             note_profilo: "Il 'Château delle Dolomiti': leggendario taglio bordolese italiano di inarrivabile eleganza balsamica, grafite, ribes nero e freschezza alpina.")
  when 469
    w.merge!(nome_vino: "Terre di San Leonardo Vigneti delle Dolomiti IGT", produttore: "Tenuta San Leonardo",
             regione: "Trentino-Alto Adige", zona: "Vallagarina - Avio (Trento)", denominazione: "Vigneti delle Dolomiti IGT Rosso (Biologico)",
             uvaggio: "Cabernet Sauvignon 50%, Merlot 40%, Carmenère 10%",
             affinamento: "80% in botti grandi di rovere di Slavonia e 20% in barrique per 18 mesi",
             note_profilo: "Fratello minore del San Leonardo: fresco, fragrante, piccoli frutti di bosco, erbe di montagna e beva armoniosa.")
  when 279
    w.merge!(nome_vino: "Amarone della Valpolicella DOCG", produttore: "Villa Rinaldi",
             regione: "Veneto", zona: "Valpolicella (Verona)", denominazione: "Amarone della Valpolicella DOCG",
             uvaggio: "Corvina, Rondinella, Molinara", affinamento: "Lungo affinamento in barrique di rovere francese per oltre 36 mesi",
             note_profilo: "Millennium vintage 2000 di Villa Rinaldi: evoluzione terziaria straordinaria di marasca sotto spirito, tabacco da pipa, cacao e spezie.")
  when 440
    w.merge!(nome_vino: "Valpolicella Ripasso Superiore DOC", produttore: "Villa Rinaldi",
             regione: "Veneto", zona: "Valpolicella (Verona)", denominazione: "Valpolicella Ripasso DOC Superiore",
             uvaggio: "Corvina, Rondinella, Molinara", affinamento: "Rifermentazione sulle vinacce dell'Amarone e affinamento in barrique",
             note_profilo: "Ripasso ricco e vellutato: ciliegia matura, vaniglia, spezie dolci e morbidezza avvolgente.")
  when 280
    w.merge!(nome_vino: "Amarone della Valpolicella Classico DOCG", produttore: "Boni Alessandro",
             regione: "Veneto", zona: "Valpolicella Classica (Verona)", denominazione: "Amarone della Valpolicella Classico DOCG",
             uvaggio: "Corvina, Corvinone, Rondinella", affinamento: "Appassimento tradizionale e lungo affinamento in botti di rovere",
             note_profilo: "Amarone artigianale in formato Magnum: prugna secca, amarena, spezie calde, cioccolato e struttura generosa.")
  when 441, 442
    w.merge!(nome_vino: "Valpolicella Ripasso Classico Superiore DOC", produttore: "Boni Alessandro",
             regione: "Veneto", zona: "Valpolicella Classica (Verona)", denominazione: "Valpolicella Ripasso Classico Superiore DOC",
             uvaggio: "Corvina, Corvinone, Rondinella", affinamento: "Ripasso sulle vinacce dell'Amarone e affinamento in rovere",
             note_profilo: "Succoso, speziato e avvolgente: marasca, mora, cannella e tannino rotondo.")
  when 321
    w.merge!(nome_vino: "Vinschgauer Blauburgunder (Pinot Nero Val Venosta) Alto Adige DOC", produttore: "Stachlburg - Baron von Kripp",
             regione: "Trentino-Alto Adige", zona: "Val Venosta / Parcines (Alto Adige)", denominazione: "Alto Adige Val Venosta DOC Pinot Nero (Biologico)",
             uvaggio: "Pinot Nero (Blauburgunder) 100%", affinamento: "12 mesi in botti di rovere",
             note_profilo: "Pinot Nero alpino della Val Venosta da agricoltura biologica: lampone, ribes rosso, sottobosco, pepe bianco e finezza montana.")
  when 332
    w.merge!(nome_vino: "Calabrone Rosso Venezia Giulia IGT", produttore: "Bastianich",
             regione: "Friuli-Venezia Giulia", zona: "Premariacco / Cividale del Friuli", denominazione: "Venezia Giulia IGT Rosso",
             uvaggio: "Refosco 50%, Schioppettino 20%, Pignolo 15%, Merlot 15%",
             affinamento: "Leggero appassimento delle uve; 24 mesi in barrique e tonneau di rovere + 24 mesi in bottiglia",
             note_profilo: "Il grande rosso di punta di Bastianich da uve autoctone friulane: potente, speziato, mora, pepe nero, cacao e balsamico.")
  when 336
    w.merge!(nome_vino: "Carminium Colli Berici DOC Carmenère", produttore: "Inama",
             regione: "Veneto", zona: "Colli Berici (Vicenza)", denominazione: "Colli Berici DOC Carmenère (Biologico)",
             uvaggio: "Carmenère 100%", affinamento: "12 mesi in barrique di rovere francese (20% nuove)",
             note_profilo: "Dalla terra d'elezione italiana del Carmenère (Colli Berici): mirtillo, pepe nero, cacao amaro ed erbe aromatiche.")
  when 403
    w.merge!(nome_vino: "Campo del Lago Colli Berici DOC Merlot", produttore: "Inama",
             regione: "Veneto", zona: "Colli Berici (Vicenza)", denominazione: "Colli Berici DOC Merlot (Biologico)",
             uvaggio: "Merlot 100%", affinamento: "12 mesi in barrique di rovere francese",
             note_profilo: "Merlot morbido e vellutato dalle terre rosse calcaree dei Colli Berici: ciliegia nera, prugna, vaniglia e spezie.")
  when 422
    w.merge!(nome_vino: "Oratorio di San Lorenzo Veneto IGT Carmenère Riserva", produttore: "Inama",
             regione: "Veneto", zona: "Colli Berici (Cru Oratorio di San Lorenzo, Vicenza)", denominazione: "Colli Berici Riserva DOC / Veneto IGT Carmenère",
             uvaggio: "Carmenère 100% (Selezione parcellare)", affinamento: "18 mesi in barrique nuove di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Cru vertice assoluto di Inama: concentrazione, amarena, fava di cacao, tabacco, pepe di Sichuan e seta tannica.")
  when 347, 348
    w.merge!(nome_vino: "Corte del Lupo Rosso Curtefranca DOC", produttore: "Ca' del Bosco",
             regione: "Lombardia", zona: "Franciacorta (Erbusco, Brescia)", denominazione: "Curtefranca Rosso DOC (Biologico)",
             uvaggio: "Merlot 38%, Cabernet Sauvignon 33%, Cabernet Franc 22%, Carmenère 7%",
             affinamento: "Circa 20 mesi tra acciaio, botti grandi e barrique di rovere",
             note_profilo: "Classico taglio di Franciacorta firmato Ca' del Bosco: piccoli frutti rossi e neri, spezie fini, note erbacee nobili ed eleganza.")
  when 402
    w.merge!(nome_vino: "Maurizio Zanella Sebino IGT Rosso", produttore: "Ca' del Bosco",
             regione: "Lombardia", zona: "Franciacorta (Erbusco, Brescia)", denominazione: "Sebino IGT Rosso",
             uvaggio: "Cabernet Sauvignon 50%, Merlot 25%, Cabernet Franc 25%",
             affinamento: "18-24 mesi in barrique nuove di rovere francese + lungo affinamento in bottiglia",
             note_profilo: "Storico taglio bordolese italiano (nato nel 1981) che porta la firma del fondatore: ribes nero, grafite, cedro, tabacco e grande longevità.")
  when 432
    w.merge!(nome_vino: "Pinéro Sebino IGT Pinot Nero", produttore: "Ca' del Bosco",
             regione: "Lombardia", zona: "Franciacorta (Erbusco, Brescia)", denominazione: "Sebino IGT Pinot Nero",
             uvaggio: "Pinot Nero 100%", affinamento: "12 mesi in barrique di rovere francese + oltre 24 mesi in bottiglia",
             note_profilo: "Uno dei primi grandi Pinot Nero italiani in stile borgognone (dal 1983): marasca, ribes, humus, spezie orientali e velluto.")
  when 362
    w.merge!(nome_vino: "Fratta Veneto IGT Rosso", produttore: "Maculan",
             regione: "Veneto", zona: "Breganze (Vicenza)", denominazione: "Veneto IGT Rosso",
             uvaggio: "Cabernet Sauvignon 70%, Merlot 30%",
             affinamento: "12 mesi in barrique nuove di rovere francese su suoli vulcanici tufacei",
             note_profilo: "Vino ammiraglia di Fausto Maculan: ricchezza di mora, lampone, cioccolato fondente, caffè e mineralità vulcanica.")
  when 363
    w.merge!(nome_vino: "Rosso Friuli Colli Orientali DOC", produttore: "Miani",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC Rosso",
             uvaggio: "Merlot (prevalente) con Refosco e Cabernet",
             affinamento: "24 mesi in barrique di rovere francese",
             note_profilo: "Rarissimo rosso di Enzo Pontoni (Miani): densità estrattiva spaventosa, frutti neri in confettura, grafite, spezie e potenza assoluta.")
  when 392
    w.merge!(nome_vino: "Lagrein Alto Adige DOC", produttore: "Elena Walch",
             regione: "Trentino-Alto Adige", zona: "Termeno / Bolzano (Alto Adige)", denominazione: "Alto Adige Lagrein DOC",
             uvaggio: "Lagrein 100%", affinamento: "Maturazione in botti di rovere e acciaio",
             note_profilo: "Autoctono altoatesino intenso e vellutato: mirtillo nero, viola mammola, cacao amaro, spezie di montagna e freschezza.")
  when 401
    w.merge!(nome_vino: "Maglen Pinot Nero Riserva Alto Adige DOC", produttore: "Cantina Tramin",
             regione: "Trentino-Alto Adige", zona: "Mazon / Gleno (Montagna, 450-650m s.l.m.)", denominazione: "Alto Adige Pinot Nero Riserva DOC",
             uvaggio: "Pinot Nero 100%", affinamento: "12 mesi in barrique di rovere francese e 6 mesi in botte grande",
             note_profilo: "Dalle migliori microzone altoatesine per il Pinot Nero (Mazon e Gleno): ciliegia selvatica, lampone, sottobosco e setosità.")
  when 404
    w.merge!(nome_vino: "Merlot Riserva 'DJJ' Alto Adige DOC", produttore: "Weingut Niklas (Dieter Sölva)",
             regione: "Trentino-Alto Adige", zona: "Caldaro sulla Strada del Vino (Alto Adige)", denominazione: "Alto Adige Merlot Riserva DOC",
             uvaggio: "Merlot 100%", affinamento: "18 mesi in barrique e tonneau di rovere",
             note_profilo: "Riserva altoatesina selezionata da vecchie vigne a Caldaro: mora matura, prugna, tabacco dolce, cacao e tannino fitto.")
  when 433
    w.merge!(nome_vino: "Madruzzo Vigneti delle Dolomiti IGT Pinot Nero", produttore: "Pravis",
             regione: "Trentino-Alto Adige", zona: "Valle dei Laghi (Lasino, Trento)", denominazione: "Vigneti delle Dolomiti IGT Pinot Nero",
             uvaggio: "Pinot Nero 100%", affinamento: "12-15 mesi in barrique di rovere francese",
             note_profilo: "Pinot Nero trentino dedicato ai Principi Vescovi di Madruzzo: ribes, marasca, spezie fini ed eleganza alpina.")
  when 434
    w.merge!(nome_vino: "Red Angel on the Moonlight Venezia Giulia IGT Pinot Nero", produttore: "Jermann",
             regione: "Friuli-Venezia Giulia", zona: "Farra d'Isonzo / Collio", denominazione: "Venezia Giulia IGT Pinot Nero",
             uvaggio: "Pinot Nero 100%", affinamento: "12 mesi in barrique e botti di rovere francese",
             note_profilo: "Elegante Pinot Nero friulano di Silvio Jermann: piccoli frutti di bosco, rosa, pepe bianco e bocca setosa.")
  when 435, 436
    w.merge!(nome_vino: "Pinot Nero Vallagarina IGT", produttore: "La Cadalora",
             regione: "Trentino-Alto Adige", zona: "Vallagarina - Santa Margherita di Ala (Trento)", denominazione: "Vallagarina IGT Pinot Nero (Biologico)",
             uvaggio: "Pinot Nero 100%", affinamento: "12-18 mesi in barrique di rovere francese",
             note_profilo: "Pinot Nero artigianale della Vallagarina: ciliegia croccante, erbe di bosco, spezie leggere e tensione montana.")
  when 443
    w.merge!(nome_vino: "Valpolicella Superiore 'Monte Lodoletta' DOC", produttore: "Romano Dal Forno",
             regione: "Veneto", zona: "Val d'Illasi (Cellore, Verona)", denominazione: "Valpolicella Superiore DOC",
             uvaggio: "Corvina 70%, Rondinella 20%, Croatina 5%, Oseleta 5%",
             affinamento: "Leggero appassimento (45 giorni); 36 mesi in barrique nuove di rovere + 24 mesi in bottiglia",
             note_profilo: "Un Valpolicella che ha la potenza e la maestosità di un grande Amarone: concentrazione assoluta, amarena, espresso, cacao e seta.")
  end
  w
end
