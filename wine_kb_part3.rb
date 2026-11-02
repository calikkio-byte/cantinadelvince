# encoding: UTF-8

def enrich_red_wines(row_num, w)
  ann = w[:annata]
  w[:macro_tipologia] = "Vino Rosso" if w[:macro_tipologia].empty?
  w[:categoria] = "Rosso Fermo" if w[:categoria].empty?

  case row_num
  # --- PIEMONTE: BAROLO, BARBARESCO, BARBERA, DOLCETTO, NEBBIOLO, ALTO PIEMONTE ---
  when 42
    w.merge!(nome_vino: "Pomorosso Barbera d'Asti Superiore Nizza DOCG (900 cl)", produttore: "Coppo",
             regione: "Piemonte", zona: "Nizza Monferrato / Canelli (Asti)", denominazione: "Nizza DOCG / Barbera d'Asti Superiore DOCG",
             uvaggio: "Barbera 100%", affinamento: "14 mesi in barrique di rovere francese",
             note_profilo: "La Barbera simbolo di Casa Coppo in formato imperiale Salmanazar (9 Litri): amarena matura, spezie dolci, cacao e grande struttura.")
  when 45, 46, 47
    w.merge!(nome_vino: "Camp Gros Martinenga Barbaresco Riserva DOCG", produttore: "Marchesi di Grésy",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Cru Martinenga - Monopole)", denominazione: "Barbaresco Riserva DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "Circa 12 mesi in barrique di rovere francese e 16-24 mesi in botte grande di Slavonia",
             note_profilo: "Selezione parcella storica Camp Gros nel monopole Martinenga: rosa canina, liquirizia, tartufo, viola e tannino nobilissimo.")
  when 364, 365, 366
    w.merge!(nome_vino: "Gaiun Martinenga Barbaresco DOCG", produttore: "Marchesi di Grésy",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Cru Martinenga - Monopole)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "24 mesi in barrique di rovere francese + lungo affinamento in bottiglia",
             note_profilo: "Cru Gaiun dall'anfiteatro Martinenga: veste moderna e avvolgente, piccoli frutti neri, spezie orientali, tabacco e seta tannica.")
  when 130
    w.merge!(nome_vino: "Barbera d'Alba 'Tre Vigne' DOC", produttore: "Vietti",
             regione: "Piemonte", zona: "Langhe - Castiglione Falletto", denominazione: "Barbera d'Alba DOC",
             uvaggio: "Barbera 100%", affinamento: "12 mesi tra barrique, botte grande di rovere e acciaio",
             note_profilo: "Succosa, fragrante ed equilibrata: ciliegia rossa, mirtillo, vaniglia delicata e freschezza gastronomica.")
  when 131, 132, 133
    w.merge!(nome_vino: "Barolo 'Castiglione' DOCG", produttore: "Vietti",
             regione: "Piemonte", zona: "Langhe - Barolo (Castiglione Falletto, Monforte, Barolo, Novello)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "24-30 mesi in grandi botti di rovere e piccola parte in barrique",
             note_profilo: "Assemblaggio classico da grandi parcelle della denominazione: petali di rosa, lampone, liquirizia, erbe balsamiche e tannino armonioso.")
  when 281
    w.merge!(nome_vino: "Basarin / Baudana Barbaresco DOCG", produttore: "Angelo Negro",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Neive / Treiso)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "20-24 mesi in botti di rovere",
             note_profilo: "Barbaresco elegante e speziato: viola appassita, marasca, cannella, sottobosco e finale balsamico.")
  when 285, 287
    w.merge!(nome_vino: "Barbaresco DOCG", produttore: "Produttori del Barbaresco",
             regione: "Piemonte", zona: "Langhe - Barbaresco", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "24 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Riferimento della tradizione langarola: ciliegia, rosa, pepe bianco, cuoio e trama tannica classica e longeva.")
  when 286, 288
    w.merge!(nome_vino: "Barbaresco DOCG", produttore: "Gaja",
             regione: "Piemonte", zona: "Langhe - Barbaresco (14 vigneti di proprietà)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "12 mesi in barrique e 12 mesi in botte grande di rovere",
             note_profilo: "Il vino bandiera di Casa Gaja dal 1859: finezza aristocratica, frutti di bosco, violetta, incenso, liquirizia e profondità magistrale.")
  when 289
    w.merge!(nome_vino: "Barbaresco 'Asili' DOCG", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Cru Asili)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100% (MGA Asili)", affinamento: "Oltre 24 mesi in grandi botti di rovere francese",
             note_profilo: "Uno dei vertici assoluti del Nebbiolo mondiale: grazia eterea di rosa, fragolina di bosco, arancia rossa e tannini di pura seta.")
  when 290
    w.merge!(nome_vino: "Barbaresco 'Asili' Riserva DOCG (Etichetta Rossa)", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Cru Asili)", denominazione: "Barbaresco Riserva DOCG",
             uvaggio: "Nebbiolo 100% (MGA Asili)", affinamento: "Oltre 30-36 mesi in grandi botti di rovere francese + lungo riposo in bottiglia",
             note_profilo: "La leggendaria Etichetta Rossa di Bruno Giacosa: capolavoro da collezione di struggente complessità floreale, balsamica e minerale.")
  when 291
    w.merge!(nome_vino: "Barbaresco 'Faset / Asili' o Barbera d'Asti 'Le Orme / La Court'", produttore: "Michele Chiarlo",
             regione: "Piemonte", zona: "Langhe - Barbaresco", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "24 mesi in botte di rovere",
             note_profilo: "Eleganza piemontese firmata Michele Chiarlo: piccoli frutti rossi, violetta, spezie dolci e tannino levigato.")
  when 292
    w.merge!(nome_vino: "Barbaresco 'Rabajà' DOCG", produttore: "Bruno Rocca (Rabajà)",
             regione: "Piemonte", zona: "Langhe - Barbaresco (Cru Rabajà)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100% (MGA Rabajà)", affinamento: "12 mesi in barrique e 12 mesi in botte grande di rovere francese",
             note_profilo: "Il cru simbolo di Bruno Rocca: potente, vellutato, lampone, tartufo, cacao e lunghissima persistenza balsamica.")
  when 293, 294
    w.merge!(nome_vino: "Barbera d'Alba DOC", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe (Alba / Neive)", denominazione: "Barbera d'Alba DOC",
             uvaggio: "Barbera 100%", affinamento: "14 mesi in botti di rovere francese",
             note_profilo: "Barbera d'Alba di grande rigore ed eleganza: prugna, amarena, viola e acidità perfettamente integrata.")
  when 295
    w.merge!(nome_vino: "Barbera d'Alba 'Vigna Francia' DOC", produttore: "Giacomo Conterno",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba (Cru Francia)", denominazione: "Barbera d'Alba DOC",
             uvaggio: "Barbera 100% (Cru Francia)", affinamento: "20-24 mesi in grandi botti di rovere austriaco/Slavonia",
             note_profilo: "La Barbera più ricercata d'Italia, dallo stesso vigneto del Monfortino: profondità abissale, mora, ferro, grafite e tensione vibrante.")
  when 296
    w.merge!(nome_vino: "Barbera d'Alba DOC", produttore: "Massolino (Vigna Rionda)",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba", denominazione: "Barbera d'Alba DOC",
             uvaggio: "Barbera 100%", affinamento: "Vasche di cemento e grandi botti di rovere di Slavonia",
             note_profilo: "Succosa, croccante e territoriale: ciliegia nera, mora, spezie fresche e grande bevibilità.")
  when 297
    w.merge!(nome_vino: "Barbera d'Alba 'Vigna Martina' DOC", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Ginestra)", denominazione: "Barbera d'Alba DOC",
             uvaggio: "Barbera 100%", affinamento: "12 mesi in barrique di rovere francese (nuove e di secondo passaggio) + 8 mesi in bottiglia",
             note_profilo: "Barbera di grande ricchezza da Monforte d'Alba: marasca sotto spirito, mirtillo, cioccolato fondente e freschezza viva.")
  when 298, 299
    w.merge!(nome_vino: "Barolo Riserva 'Rüncot' DOCG", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Ginestra - Vigna Rüncot)", denominazione: "Barolo Riserva DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "28-30 mesi in barrique nuove di rovere francese + oltre 24 mesi in bottiglia",
             note_profilo: "La grande Riserva di Elio Grasso prodotta solo nelle migliori annate: monumentale, balsamica, rosa nera, tabacco e longevità secolare.")
  when 300
    w.merge!(nome_vino: "Barolo DOCG", produttore: "Massolino (Vigna Rionda)",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "30 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Fedele espressione di Serralunga d'Alba: austero e nobile, frutti rossi, liquirizia, ferro, rosa appassita e trama tannica incisiva.")
  when 301, 302, 303, 304, 305, 306, 307
    w.merge!(nome_vino: "Barolo 'Bussia' DOCG", produttore: "Agricola Gian Piero Marrone",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Bussia)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Bussia)", affinamento: "30 mesi in botti di rovere + affinamento in bottiglia",
             note_profilo: "Dal celebre cru Bussia di Monforte d'Alba: elegante, viola, piccoli frutti di bosco, tartufo, spezie dolci e tannino avvolgente.")
  when 308, 309
    w.merge!(nome_vino: "Barolo 'Dagromis' DOCG", produttore: "Gaja",
             regione: "Piemonte", zona: "Langhe - Barolo (La Morra e Serralunga d'Alba)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "12 mesi in barrique e 18 mesi in grandi botti di rovere",
             note_profilo: "Unione dell'eleganza floreale di La Morra e della potenza strutturale di Serralunga: lampone, rosa, erbe alpine e spezie.")
  when 310, 311
    w.merge!(nome_vino: "Barolo 'Falletto' DOCG", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba (Tenuta Falletto)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Falletto)", affinamento: "30 mesi in grandi botti di rovere francese",
             note_profilo: "Capolavoro dal monopole Falletto a Serralunga d'Alba: potenza maestosa, china, arancia sanguinella, goudron, tartufo e tannino regale.")
  when 312
    w.merge!(nome_vino: "Barolo 'Francia' DOCG", produttore: "Giacomo Conterno",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba (Cru Francia)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Francia)", affinamento: "Circa 4 anni in grandi botti di rovere austriaco",
             note_profilo: "Icona mondiale del Barolo tradizionale da Serralunga: complessità sconfinata di rosa, menta, catrame, ferro, ciliegia e longevità immortale.")
  when 313, 314
    w.merge!(nome_vino: "Barolo 'Gavarini Chiniera' DOCG", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Gavarini)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Gavarini)", affinamento: "24 mesi in grandi botti di rovere di Slavonia da 25 hl",
             note_profilo: "Da suoli sabbiosi-calcarei di Gavarini: il più profumato e cesellato dei Barolo di Elio Grasso, con note di rosa, melograno e menta.")
  when 315, 316
    w.merge!(nome_vino: "Barolo 'Ginestra Casa Maté' DOCG", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Ginestra)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Ginestra)", affinamento: "24 mesi in grandi botti di rovere di Slavonia da 25 hl",
             note_profilo: "Da suoli argilloso-calcarei di Ginestra: strutturato, profondo, balsamico, con note di marasca, liquirizia, tabacco e tannini vigorosi.")
  when 317
    w.merge!(nome_vino: "Barolo 'Mosconi' DOCG", produttore: "Pio Cesare",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Mosconi)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Mosconi)", affinamento: "30 mesi in botti grandi di rovere e piccola parte in barrique",
             note_profilo: "Singolo vigneto nel prestigioso cru Mosconi di Monforte: austero, potente, prugna, goudron, spezie nere e lunghissima vita.")
  when 318
    w.merge!(nome_vino: "Barolo 'Parussi' DOCG", produttore: "Massolino (Vigna Rionda)",
             regione: "Piemonte", zona: "Langhe - Castiglione Falletto (Cru Parussi)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100% (MGA Parussi)", affinamento: "30 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Cru di Castiglione Falletto: ampio, solare, avvolgente con note di rosa rossa, spezie dolci, sottobosco e tannino fitto.")
  when 319
    w.merge!(nome_vino: "Barolo Pio DOCG", produttore: "Pio Cesare",
             regione: "Piemonte", zona: "Langhe - Barolo (Serralunga, Grinzane, La Morra, Novello, Monforte)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "30 mesi in botti di rovere francese e di Slavonia",
             note_profilo: "Il Barolo classico secondo la tradizione multicru di Pio Cesare (dal 1881): armonioso, strutturato, ciliegia, viola e tartufo.")
  when 320
    w.merge!(nome_vino: "Barolo Riserva 'Vigna Rionda' DOCG (Etichetta Nera)", produttore: "Massolino (Vigna Rionda)",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba (Cru Vigna Rionda)", denominazione: "Barolo Riserva DOCG",
             uvaggio: "Nebbiolo 100% (MGA Vigna Rionda)", affinamento: "42 mesi in grandi botti di rovere di Slavonia + 30 mesi in bottiglia (6 anni totali)",
             note_profilo: "Dal Grand Cru per eccellenza di Serralunga d'Alba nell'annata da 100 punti 2016: sinfonia monumentale di incenso, rosa, ferro e seta.")
  when 324
    w.merge!(nome_vino: "Bricco dell'Uccellone Barbera d'Asti DOCG", produttore: "Braida di Giacomo Bologna",
             regione: "Piemonte", zona: "Rocchetta Tanaro (Asti)", denominazione: "Barbera d'Asti DOCG",
             uvaggio: "Barbera 100%", affinamento: "12 mesi in barrique di rovere + 12 mesi in bottiglia",
             note_profilo: "Il vino che nel 1982 ha rivoluzionato la storia della Barbera: opulento, vellutato, amarena, vaniglia, cacao, liquirizia e finale infinito.")
  when 346
    w.merge!(nome_vino: "Conteisa Barolo DOCG", produttore: "Gaja",
             regione: "Piemonte", zona: "Langhe - La Morra (Cru Cerequio)", denominazione: "Barolo DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "30 mesi tra barrique e grandi botti di rovere",
             note_profilo: "Dalla celebre conca di Cerequio a La Morra: profumi inebrianti di viola, frutti di bosco, erbe balsamiche, menta e tannino setoso.")
  when 353, 355
    w.merge!(nome_vino: "Dolcetto d'Alba DOC", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe (Alba / Neive)", denominazione: "Dolcetto d'Alba DOC",
             uvaggio: "Dolcetto 100%", affinamento: "Acciaio inox e vasche vetrificate",
             note_profilo: "Purezza varietale del Dolcetto: ciliegia nera croccante, viola, mandorla amara nel finale e beva scorrevole.")
  when 354
    w.merge!(nome_vino: "Dolcetto d'Alba 'Dei Grassi' DOC", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba", denominazione: "Dolcetto d'Alba DOC",
             uvaggio: "Dolcetto 100%", affinamento: "Acciaio inox a temperatura controllata",
             note_profilo: "Dolcetto di montagna da Monforte (400m): fragrante, mirtillo, marasca, violetta e piacevole tensione.")
  when 367
    w.merge!(nome_vino: "Gattinara DOCG", produttore: "Travaglini",
             regione: "Piemonte", zona: "Alto Piemonte - Gattinara (Vercelli)", denominazione: "Gattinara DOCG",
             uvaggio: "Nebbiolo (Spanna) 100%", affinamento: "36 mesi di cui almeno 24 in botti di rovere di Slavonia",
             note_profilo: "Nella storica bottiglia storta Travaglini da suoli porfirici-ferrosi: rosa appassita, selce, melograno, chinotto e sapidità minerale.")
  when 368
    w.merge!(nome_vino: "Gattinara DOCG", produttore: "Nervi - Giacomo Conterno",
             regione: "Piemonte", zona: "Alto Piemonte - Gattinara (Vercelli)", denominazione: "Gattinara DOCG",
             uvaggio: "Nebbiolo (Spanna) 100%", affinamento: "Circa 36-42 mesi in grandi botti di rovere",
             note_profilo: "La più antica cantina di Gattinara (1906) guidata da Roberto Conterno: purezza cristallina, arancia rossa, pietra focaia, ferro e finezza suprema.")
  when 371, 372
    w.merge!(nome_vino: "Ghemme 'Collis Breclemae / Anno Primo' DOCG", produttore: "Antichi Vigneti di Cantalupo",
             regione: "Piemonte", zona: "Alto Piemonte - Ghemme (Novara)", denominazione: "Ghemme DOCG",
             uvaggio: "Nebbiolo (Spanna) 85%, Vespolina e Uva Rara 15%",
             affinamento: "Oltre 20-30 mesi in botti di rovere + lungo affinamento in bottiglia",
             note_profilo: "Nobile rosso dell'Alto Piemonte dalle colline moreniche del Monte Rosa: viola, pepe nero, liquirizia, sottobosco e freschezza alpina.")
  when 387
    w.merge!(nome_vino: "Il Bricco Barbaresco DOCG", produttore: "Pio Cesare",
             regione: "Piemonte", zona: "Langhe - Treiso (Cru Il Bricco)", denominazione: "Barbaresco DOCG",
             uvaggio: "Nebbiolo 100%", affinamento: "30 mesi in botti grandi di rovere e piccola parte in barrique",
             note_profilo: "Cru d'alta quota a Treiso della famiglia Pio Cesare: strutturato, balsamico, mora, tartufo e grande longevità.")
  when 388
    w.merge!(nome_vino: "Il Nebbio Langhe DOC Nebbiolo", produttore: "Pio Cesare",
             regione: "Piemonte", zona: "Langhe (Diano d'Alba, Barbaresco, Sinio)", denominazione: "Langhe DOC Nebbiolo",
             uvaggio: "Nebbiolo 100%", affinamento: "Acciaio e breve passaggio in botte grande di rovere",
             note_profilo: "Nebbiolo fragrante, succoso e immediato: fragolina, lampone, petali di rosa e tannino gentile.")
  when 406
    w.merge!(nome_vino: "Montebruna Barbera d'Asti DOCG", produttore: "Braida di Giacomo Bologna",
             regione: "Piemonte", zona: "Rocchetta Tanaro (Asti)", denominazione: "Barbera d'Asti DOCG",
             uvaggio: "Barbera 100%", affinamento: "12 mesi in grandi botti di rovere di Slavonia",
             note_profilo: "Espressione autentica del cru Montebruna in botte grande: ciliegia matura, prugna, mandorla e succosità irresistibile.")
  when 414
    w.merge!(nome_vino: "Langhe Nebbiolo 'Vigna Arione' DOC", produttore: "Giacomo Conterno",
             regione: "Piemonte", zona: "Langhe - Serralunga d'Alba (Cru Arione)", denominazione: "Langhe DOC Nebbiolo",
             uvaggio: "Nebbiolo 100% (Cru Arione)", affinamento: "Circa 24 mesi in grandi botti di rovere austriaco",
             note_profilo: "Dal leggendario cru Arione di Serralunga d'Alba: la stoffa di un grande Barolo con profumi di rosa, ferro, lampone e menta.")
  when 415
    w.merge!(nome_vino: "Nebbiolo d'Alba DOC", produttore: "Bruno Giacosa",
             regione: "Piemonte", zona: "Langhe / Roero", denominazione: "Nebbiolo d'Alba DOC",
             uvaggio: "Nebbiolo 100%", affinamento: "12-14 mesi in botti di rovere francese",
             note_profilo: "Finezza inconfondibile di Casa Giacosa: violetta, ciliegia selvatica, spezie delicate e trama setosa.")
  when 416
    w.merge!(nome_vino: "Gavarini Langhe Nebbiolo DOC", produttore: "Elio Grasso",
             regione: "Piemonte", zona: "Langhe - Monforte d'Alba (Cru Gavarini)", denominazione: "Langhe DOC Nebbiolo",
             uvaggio: "Nebbiolo 100%", affinamento: "Acciaio inox e breve riposo in bottiglia",
             note_profilo: "Nebbiolo puro e croccante da vigne giovani nel cru Gavarini: rosa fresca, melograno, lampone e beva scattante.")
  when 417, 418
    w.merge!(nome_vino: "Nebbiolo d'Alba Superiore DOC", produttore: "Agricola Gian Piero Marrone",
             regione: "Piemonte", zona: "Langhe - La Morra / Madonna di Como", denominazione: "Nebbiolo d'Alba Superiore DOC",
             uvaggio: "Nebbiolo 100%", affinamento: "18 mesi in botti di rovere",
             note_profilo: "Morbido ed elegante: piccoli frutti rossi, cannella, vaniglia, viola e tannino vellutato.")
  when 461, 462
    w.merge!(nome_vino: "Sito Moresco Langhe DOC", produttore: "Gaja",
             regione: "Piemonte", zona: "Langhe - Barbaresco", denominazione: "Langhe DOC Rosso",
             uvaggio: "Nebbiolo, Barbera, Merlot, Cabernet Sauvignon",
             affinamento: "12 mesi in barrique di rovere e 6 mesi in bottiglia",
             note_profilo: "Rosso langarolo moderno ed elegante: finezza aromatica del Nebbiolo unita alla morbidezza fruttata di Barbera e Merlot.")
  end
  w
end
