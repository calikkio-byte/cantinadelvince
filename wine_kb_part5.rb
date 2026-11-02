# encoding: UTF-8

def enrich_red_wines_part3(row_num, w)
  case row_num
  # --- CENTRO E SUD ITALIA, ISOLE (UMBRIA, ABRUZZO, MOLISE, CAMPANIA, PUGLIA, CALABRIA, SICILIA, SARDEGNA) ---
  when 44
    w.merge!(nome_vino: "Santera Primitivo di Manduria DOC", produttore: "Sassirossi / Leone de Castris",
             regione: "Puglia", zona: "Manduria / Salento (Taranto)", denominazione: "Primitivo di Manduria DOC",
             uvaggio: "Primitivo 100%", affinamento: "Maturazione per 6-12 mesi in botti di rovere e acciaio + affinamento in bottiglia",
             note_profilo: "Primitivo di Manduria avvolgente e solare: prugna nera matura, marasca sotto spirito, carruba, cacao e spezie dolci.")
  when 51
    w.merge!(nome_vino: "Macchiarossa Tintilia del Molise DOC", produttore: "Claudio Cipressi",
             regione: "Molise", zona: "San Felice del Molise (Campobasso, 550m s.l.m.)", denominazione: "Tintilia del Molise DOC",
             uvaggio: "Tintilia 100% (vitigno autoctono molisano recuperato da Claudio Cipressi)",
             affinamento: "24 mesi in acciaio e 12 mesi in bottiglia (alcune selezioni con passaggio in legno grande)",
             note_profilo: "Vino simbolo della rinascita del vitigno autoctono Tintilia: pepe nero, prugna selvatica, liquirizia, macchia montana e grande carattere.")
  when 157, 349
    w.merge!(nome_vino: "Costa d'Amalfi Furore Rosso DOC", produttore: "Marisa Cuomo",
             regione: "Campania", zona: "Furore - Costiera Amalfitana (Salerno)", denominazione: "Costa d'Amalfi Furore Rosso DOC",
             uvaggio: "Piedirosso (Pere 'e Palummo) 60%, Aglianico 40%",
             affinamento: "12 mesi in barrique di rovere francese",
             note_profilo: "Rosso eroico da terrazzamenti a picco sul mare: geranio, ciliegia nera, mirto, pepe nero e iodio marino.")
  when 282
    w.merge!(nome_vino: "Arberesko Calabria IGT Rosso", produttore: "Tenuta San Martino",
             regione: "Calabria", zona: "Colline di Cosenza / Comunità Arbëreshe (Calabria)", denominazione: "Calabria IGT Rosso",
             uvaggio: "Magliocco e Aglianico (vitigni autoctoni calabresi)",
             affinamento: "Affinamento in botti di rovere e bottiglia",
             note_profilo: "Rosso identitario calabrese: mora di rovo, amarena, spezie mediterranee, liquirizia e trama tannica vigorosa.")
  when 357
    w.merge!(nome_vino: "Duca Enrico Sicilia DOC", produttore: "Duca di Salaparuta",
             regione: "Sicilia", zona: "Tenuta di Suor Marchesa - Butera / Riesi (Caltanissetta)", denominazione: "Sicilia DOC Nero d'Avola",
             uvaggio: "Nero d'Avola 100%", affinamento: "18 mesi in barrique di rovere francese + almeno 12 mesi in bottiglia",
             note_profilo: "Primo grande Nero d'Avola in purezza della storia enologica siciliana (nato nel 1984): amarena, mirto, tabacco, vaniglia e portamento regale.")
  when 358
    w.merge!(nome_vino: "Etna Rosso DOC", produttore: "Graci",
             regione: "Sicilia", zona: "Passopisciaro - Versante Nord dell'Etna (Castiglione di Sicilia, 600-700m s.l.m.)", denominazione: "Etna Rosso DOC (Biologico)",
             uvaggio: "Nerello Mascalese 100%", affinamento: "18 mesi in tini di cemento e botti grandi di rovere",
             note_profilo: "Etna Rosso vulcanico di Alberto Graci: melograno, piccoli frutti rossi, cenere lavica, erbe selvatiche e tannino cesellato.")
  when 373, 374
    w.merge!(nome_vino: "Ghirada Fittiloghe Cannonau di Sardegna DOC", produttore: "VikeVike (Simone Sedilesu)",
             regione: "Sardegna", zona: "Mamoiada - Barbagia (Nuoro, 750m s.l.m., vigne ad alberello di 60+ anni)", denominazione: "Cannonau di Sardegna DOC",
             uvaggio: "Cannonau 100%", affinamento: "Fermentazione spontanea; 12 mesi in tonneaux di rovere francese usati",
             note_profilo: "Cru ('Ghirada') d'alta quota a Mamoiada su sabbie granitiche: arancia sanguinella, mirto, rosa canina, spezie e beva magnetica.")
  when 386
    w.merge!(nome_vino: "I Viaggiatori Campania Aglianico IGT", produttore: "Joaquin (Raffaele Pagano)",
             regione: "Campania", zona: "Montefalcione (Avellino, Irpinia)", denominazione: "Campania Aglianico IGT",
             uvaggio: "Aglianico 100%", affinamento: "12-18 mesi in botti di rovere e acciaio + lungo riposo in bottiglia",
             note_profilo: "Aglianico d'autore firmato Raffaele Pagano: ciliegia nera, pepe nero, cenere, sottobosco e freschezza irpina.")
  when 405
    w.merge!(nome_vino: "Mille e una Notte Sicilia DOC", produttore: "Donnafugata",
             regione: "Sicilia", zona: "Contessa Entellina (Palermo)", denominazione: "Sicilia DOC Rosso",
             uvaggio: "Nero d'Avola (prevalente), Petit Verdot, Syrah",
             affinamento: "13-14 mesi in barrique di rovere francese nuove + 20 mesi in bottiglia",
             note_profilo: "Il grande rosso icona di Donnafugata (nato con Giacomo Tachis): gelso nero, prugna, pepe nero, cacao finissimo e balsamico.")
  when 413
    w.merge!(nome_vino: "Nawàri Pinot Nero Sicilia DOC", produttore: "Duca di Salaparuta (Tenuta Vajasindi)",
             regione: "Sicilia", zona: "Passopisciaro - Versante Nord dell'Etna (Castiglione di Sicilia)", denominazione: "Sicilia DOC Pinot Nero",
             uvaggio: "Pinot Nero 100%", affinamento: "12-15 mesi in barrique di rovere francese + 12 mesi in bottiglia",
             note_profilo: "Pinot Nero vulcanico coltivato sulle pendici dell'Etna: ribes nero, fragolina selvatica, grafite, spezie orientali ed eleganza.")
  when 419
    w.merge!(nome_vino: "Eloveni / 125 Negroamaro del Salento IGP", produttore: "Feudi Salentini",
             regione: "Puglia", zona: "Leporano / Salento (Taranto)", denominazione: "Salento IGP Negroamaro",
             uvaggio: "Negroamaro 100%", affinamento: "6-12 mesi in barrique/botti di rovere",
             note_profilo: "Negroamaro salentino morbido e speziato: frutti di bosco neri, timo, carruba, vaniglia e tannino vellutato.")
  when 428
    w.merge!(nome_vino: "Palizzi IGT Rosso", produttore: "Altomonte",
             regione: "Calabria", zona: "Palizzi Superiore - Costa dei Gelsomini (Reggio Calabria, estremo Sud Ionico)", denominazione: "Palizzi IGT Rosso",
             uvaggio: "Nerello Mascalese e Nerello Cappuccio (con Nocera / Calabrese)",
             affinamento: "12-18 mesi in botti di rovere e acciaio",
             note_profilo: "Vino solare dell'estremo sud calabrese: macchia mediterranea, amarena, fico secco, spezie salmastre e calore avvolgente.")
  when 444
    w.merge!(nome_vino: "Montefalco Sagrantino DOCG", produttore: "Cantine Napolini",
             regione: "Umbria", zona: "Montefalco (Perugia)", denominazione: "Montefalco Sagrantino DOCG",
             uvaggio: "Sagrantino 100%", affinamento: "Almeno 37 mesi complessivi di cui 18 mesi in botti di rovere di Slavonia e barrique",
             note_profilo: "Tutta la potenza del Sagrantino di Montefalco: mora in confettura, chiodi di garofano, cuoio, china e tannino monumentale.")
  when 460
    w.merge!(nome_vino: "Scilla IGT Rosso", produttore: "Casa Vinicola Criserà",
             regione: "Calabria", zona: "Costa Viola - Scilla (Reggio Calabria, terrazzamenti sullo Stretto)", denominazione: "Scilla IGT Rosso",
             uvaggio: "Gaglioppo e Nero d'Avola (Calabrese) / Nerello",
             affinamento: "Maturazione in botti di rovere e acciaio",
             note_profilo: "Rosso calabrese dai terrazzamenti eroici della Costa Viola affacciati sullo Stretto di Messina: ciliegia matura, mirto, spezie e nota marina.")
  when 465
    w.merge!(nome_vino: "Spelt Montepulciano d'Abruzzo Riserva DOC", produttore: "Fattoria La Valentina",
             regione: "Abruzzo", zona: "Spoltore / Colline Pescaresi (Pescara)", denominazione: "Montepulciano d'Abruzzo Riserva DOC",
             uvaggio: "Montepulciano 100%", affinamento: "18 mesi tra botti grandi da 25 hl e barrique + 6 mesi in bottiglia",
             note_profilo: "Uno dei Montepulciano d'Abruzzo più celebri e premiati: marasca, prugna, liquirizia, cacao amaro e tannino avvolgente.")
  when 467
    w.merge!(nome_vino: "Taurasi Riserva 'Della Società' DOCG", produttore: "Joaquin (Raffaele Pagano)",
             regione: "Campania", zona: "Montefalcione - Taurasi (Avellino, vigne pre-fillossera / centenarie)", denominazione: "Taurasi Riserva DOCG",
             uvaggio: "Aglianico 100%", affinamento: "Oltre 24 mesi in botti e barrique di rovere + lunghissimo affinamento in bottiglia (rilasciato dopo 8-10 anni)",
             note_profilo: "Taurasi Riserva da collezione prodotto in pochissime bottiglie: tartufo nero, incenso, amarena, ferro, cenere vulcanica e profondità abissale.")
  when 468
    w.merge!(nome_vino: "Terra di Lavoro Roccamonfina IGT", produttore: "Galardi",
             regione: "Campania", zona: "San Carlo di Sessa Aurunca - Vulcano di Roccamonfina (Caserta)", denominazione: "Roccamonfina IGT Rosso",
             uvaggio: "Aglianico 80%, Piedirosso 20%",
             affinamento: "12 mesi in barrique nuove di rovere francese (su progetto storico di Riccardo Cotarella)",
             note_profilo: "Leggendario Supertuscan del Sud nato sulle pendici vulcaniche di Roccamonfina: mora, grafite, catrame nobile, pepe nero e potenza vellutata.")
  when 474
    w.merge!(nome_vino: "Turriga Isola dei Nuraghi IGT", produttore: "Argiolas",
             regione: "Sardegna", zona: "Selegas - Trexenta (Sud Sardegna)", denominazione: "Isola dei Nuraghi IGT Rosso",
             uvaggio: "Cannonau 85%, Carignano 5%, Bovale Sardo 5%, Malvasia Nera 5%",
             affinamento: "18-24 mesi in barrique nuove di rovere francese + 12-14 mesi in bottiglia",
             note_profilo: "Il vino icona della Sardegna nel mondo (creato con Giacomo Tachis): mirto, corbezzolo, prugna nera, caffè, spezie mediterranee e maestosità.")
  when 475
    w.merge!(nome_vino: "Verso Sera Colline Teramane Montepulciano d'Abruzzo DOCG", produttore: "Velenosi",
             regione: "Abruzzo", zona: "Controguerra - Colline Teramane (Teramo)", denominazione: "Colline Teramane Montepulciano d'Abruzzo DOCG",
             uvaggio: "Montepulciano 100%", affinamento: "12-14 mesi in botti e barrique di rovere francese",
             note_profilo: "Cru abruzzese di casa Velenosi dalle Colline Teramane: mora matura, amarena, vaniglia, tabacco dolce e bocca opulenta.")
  when 476
    w.merge!(nome_vino: "Vipt / Vesuvio Rosso in Anfora DOP", produttore: "Cantine Olivella",
             regione: "Campania", zona: "Parco Nazionale del Vesuvio (Sant'Anastasia, Napoli)", denominazione: "Vesuvio Rosso DOP / Campania IGT",
             uvaggio: "Piedirosso (Pere 'e Palummo) 100% da vigne a piede franco su sabbie laviche",
             affinamento: "Macerazione e affinamento per 10-12 mesi in anfore di terracotta",
             note_profilo: "Piedirosso vulcanico vinificato in anfora: geranio selvatico, ciliegia croccante, pomice lavica, pepe e purezza minerale.")

  # --- FRANCIA: BORGOGNA, BORDEAUX, RODANO, SUD-OVEST ---
  when 137, 383
    w.merge!(nazione: "Francia", nome_vino: "Bourgogne Hautes-Côtes de Beaune Rouge AOC", produttore: "Domaine Jean Féry & Fils",
             regione: "Borgogna (Francia)", zona: "Hautes-Côtes de Beaune", denominazione: "Bourgogne Hautes-Côtes de Beaune AOC (Biologico)",
             uvaggio: "Pinot Noir 100%", affinamento: "12 mesi in pièces borgognone di rovere francese",
             note_profilo: "Pinot Noir d'altura della Côte de Beaune: lampone fresco, ciliegia rossa, peonia, spezie delicate e beva setosa.")
  when 138
    w.merge!(nazione: "Francia", nome_vino: "Bourgogne Pinot Noir AOC", produttore: "Maison Régnard",
             regione: "Borgogna (Francia)", zona: "Borgogna", denominazione: "Bourgogne Pinot Noir AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "Affinamento tradizionale in botti di rovere e acciaio",
             note_profilo: "Classico Pinot Noir di Borgogna firmato Régnard: piccoli frutti di bosco, ribes rosso, violetta e tannino fine.")
  when 154
    w.merge!(nazione: "Francia", nome_vino: "Chassagne-Montrachet 'Les Chaumes' AOC", produttore: "La Croix de Brully",
             regione: "Borgogna (Francia)", zona: "Côte de Beaune - Chassagne-Montrachet", denominazione: "Chassagne-Montrachet AOC",
             uvaggio: "Pinot Noir 100% (o Chardonnay se versione Blanc)", affinamento: "12-15 mesi in pièces di rovere francese",
             note_profilo: "Lieu-dit 'Les Chaumes' a Chassagne-Montrachet: finezza borgognona, ciliegia selvatica, spezie dolci, sottobosco e mineralità calcarea.")
  when 155
    w.merge!(nazione: "Francia", nome_vino: "Château Le Grand Verdus Bordeaux Supérieur AOC", produttore: "Famille Le Grix de la Salle",
             regione: "Bordeaux (Francia)", zona: "Entre-Deux-Mers (Sadirac, Bordeaux)", denominazione: "Bordeaux Supérieur AOC",
             uvaggio: "Merlot 65%, Cabernet Sauvignon 20%, Cabernet Franc 15%",
             affinamento: "12 mesi in vasche e barrique di rovere francese",
             note_profilo: "Storico château rinascimentale nell'Entre-Deux-Mers: ribes nero, prugna, cedro, grafite e freschezza bordolese.")
  when 156
    w.merge!(nazione: "Francia", nome_vino: "Châteauneuf-du-Pape Rouge AOC", produttore: "Domaine di Châteauneuf-du-Pape",
             regione: "Valle del Rodano (Francia)", zona: "Rodano Meridionale - Châteauneuf-du-Pape", denominazione: "Châteauneuf-du-Pape AOC",
             uvaggio: "Grenache Noir, Syrah, Mourvèdre",
             affinamento: "12-18 mesi in foudres di rovere e cemento",
             note_profilo: "Grande rosso del Rodano meridionale dai celebri galets roulés: garrigue provenzale, amarena sotto spirito, pepe nero e calore avvolgente.")
  when 160, 359
    w.merge!(nazione: "Francia", nome_vino: "Givry 1er Cru 'Clos de Mortières' AOC", produttore: "Domaine de la Ferté (Famille Devillard)",
             regione: "Borgogna (Francia)", zona: "Côte Chalonnaise - Givry Premier Cru", denominazione: "Givry 1er Cru AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "12 mesi in pièces borgognone di rovere francese (20% nuove)",
             note_profilo: "Premier Cru storico della Côte Chalonnaise: marasca, fragola matura, liquirizia, sottobosco e trama vellutata.")
  when 162, 345
    w.merge!(nazione: "Francia", nome_vino: "Beaune 1er Cru 'Clos de la Féguine' Monopole Rouge AOC", produttore: "Domaine Jacques Prieur",
             regione: "Borgogna (Francia)", zona: "Côte de Beaune - Beaune Premier Cru (Monopole)", denominazione: "Beaune 1er Cru AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "17 mesi in pièces di rovere francese",
             note_profilo: "Prestigioso Monopole di Jacques Prieur esposto a sud: ciliegia nera, rosa appassita, spezie orientali e tannino setoso.")
  when 167
    w.merge!(nazione: "Francia", nome_vino: "Gevrey-Chambertin AOC", produttore: "Domaine Chanson (Chanson Père & Fils)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Gevrey-Chambertin", denominazione: "Gevrey-Chambertin AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "14-16 mesi in pièces di rovere francese nella storica Bastion del XV secolo",
             note_profilo: "Tutta la nobiltà della Côte de Nuits: ribes nero, amarena, cuoio, liquirizia e struttura profonda.")
  when 168
    w.merge!(nazione: "Francia", nome_vino: "Château Lynch-Bages 5ème Grand Cru Classé Pauillac AOC", produttore: "Château Lynch-Bages (Famille Cazes)",
             regione: "Bordeaux (Francia)", zona: "Médoc - Pauillac (5ème Grand Cru Classé 1855)", denominazione: "Pauillac AOC",
             uvaggio: "Cabernet Sauvignon 70%, Merlot 24%, Cabernet Franc 4%, Petit Verdot 2%",
             affinamento: "18 mesi in barrique di rovere francese (75% nuove)",
             note_profilo: "Icona assoluta di Pauillac: cassis, scatola di sigari, grafite, cedro del Libano e struttura tannica monumentale.")
  when 172
    w.merge!(nazione: "Francia", nome_vino: "Château La Violette Pomerol AOC", produttore: "Château La Violette (Vignobles Péré-Vergé)",
             regione: "Bordeaux (Francia)", zona: "Rive Droite - Altopiano di Pomerol", denominazione: "Pomerol AOC",
             uvaggio: "Merlot 100% da vecchie vigne", affinamento: "Vinificazione integrale e 18 mesi in barrique nuove di rovere francese",
             note_profilo: "Gioiello rarissimo dell'altopiano di Pomerol: profumo inebriante di violetta, tartufo nero, mora, velluto puro e persistenza infinita.")
  when 176, 177
    w.merge!(nazione: "Francia", nome_vino: "Savigny-lès-Beaune 1er Cru 'Les Vergelesses' AOC", produttore: "Domaine Jean Féry & Fils",
             regione: "Borgogna (Francia)", zona: "Côte de Beaune - Savigny-lès-Beaune Premier Cru", denominazione: "Savigny-lès-Beaune 1er Cru AOC (Biologico)",
             uvaggio: "Pinot Noir 100%", affinamento: "14 mesi in pièces di rovere francese",
             note_profilo: "Il più celebre Premier Cru di Savigny-lès-Beaune: griotta, lampone, sottobosco, spezie fini ed eleganza cristallina.")
  when 178
    w.merge!(nazione: "Francia", nome_vino: "Château Calon Saint-Georges-Saint-Émilion AOC", produttore: "Château Calon (Vignobles Boidron)",
             regione: "Bordeaux (Francia)", zona: "Rive Droite - Saint-Georges-Saint-Émilion", denominazione: "Saint-Georges-Saint-Émilion AOC",
             uvaggio: "Merlot 80%, Cabernet Franc e Cabernet Sauvignon 20%",
             affinamento: "12-18 mesi in barrique di rovere francese",
             note_profilo: "Classico della Rive Droite bordolese: prugna matura, amarena, sottobosco, tabacco dolce e tannino levigato.")
  when 337, 338
    w.merge!(nazione: "Francia", nome_vino: "Château Clarke Listrac-Médoc AOC", produttore: "Baron Edmond de Rothschild",
             regione: "Bordeaux (Francia)", zona: "Médoc - Listrac-Médoc", denominazione: "Listrac-Médoc AOC",
             uvaggio: "Merlot 70%, Cabernet Sauvignon 30%",
             affinamento: "16 mesi in barrique di rovere francese",
             note_profilo: "Proprietà simbolo del Barone Edmond de Rothschild nel Médoc su suoli calcareo-argillosi: mora, cedro, spezie tostate e grande longevità.")
  when 339
    w.merge!(nazione: "Francia", nome_vino: "Château Puygueraud Francs - Côtes de Bordeaux AOC", produttore: "Famille Nicolas Thienpont",
             regione: "Bordeaux (Francia)", zona: "Rive Droite - Francs Côtes de Bordeaux", denominazione: "Francs - Côtes de Bordeaux AOC",
             uvaggio: "Merlot 80%, Cabernet Franc 15%, Malbec 5%",
             affinamento: "12-16 mesi in barrique e foudres di rovere francese",
             note_profilo: "Il capolavoro di Nicolas Thienpont a Francs: ciliegia nera, prugna, liquirizia, viola e straordinaria finezza.")
  when 369, 370
    w.merge!(nazione: "Francia", nome_vino: "Gevrey-Chambertin 'Mes Cinq Terroirs' AOC", produttore: "Domaine Denis Mortet (Arnaud Mortet)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Gevrey-Chambertin", denominazione: "Gevrey-Chambertin AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "18 mesi in pièces borgognone di rovere francese",
             note_profilo: "Uno dei Domaine più venerati di tutta la Borgogna: purezza di frutto abbagliante, rosa rossa, ciliegia nera, seta e profondità magistrale.")
  when 376
    w.merge!(nazione: "Francia", nome_vino: "Château Margaux 1er Grand Cru Classé Margaux AOC", produttore: "Château Margaux",
             regione: "Bordeaux (Francia)", zona: "Médoc - Margaux (Premier Grand Cru Classé 1855)", denominazione: "Margaux AOC",
             uvaggio: "Cabernet Sauvignon, Merlot, Petit Verdot, Cabernet Franc",
             affinamento: "24 mesi in barrique nuove di rovere francese al 100%",
             note_profilo: "Premier Grand Cru Classé leggendario: l'apoteosi della grazia bordolese, violetta, cassis, tartufo, grafite e nobiltà senza tempo.")
  when 377
    w.merge!(nazione: "Francia", nome_vino: "Grands-Échézeaux Grand Cru AOC", produttore: "Domaine de la Romanée-Conti (DRC)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Flagey-Échézeaux Grand Cru", denominazione: "Grands-Échézeaux Grand Cru AOC (Biodinamico)",
             uvaggio: "Pinot Noir 100%", affinamento: "18-20 mesi in pièces nuove di rovere francese Troncais",
             note_profilo: "Mito assoluto del Domaine de la Romanée-Conti: complessità ultraterrena, petali di rosa, spezie orientali, sottobosco nobile e seta infinita.")
  when 390
    w.merge!(nazione: "Francia", nome_vino: "La Tâche Grand Cru Monopole AOC", produttore: "Domaine de la Romanée-Conti (DRC)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Vosne-Romanée Grand Cru (Monopole)", denominazione: "La Tâche Grand Cru AOC (Biodinamico)",
             uvaggio: "Pinot Noir 100%", affinamento: "18-20 mesi in pièces nuove di rovere francese selezionato",
             note_profilo: "Monopole leggendario di Vosne-Romanée, tra i vini più rari e ricercati del pianeta: sinfonia di rosa damascena, incenso, amarena, tè nero ed eternità.")
  when 391
    w.merge!(nazione: "Francia", nome_vino: "Bourgogne / Côte de Beaune Pinot Noir AOC", produttore: "Domaine Labruyère-Prieur",
             regione: "Borgogna (Francia)", zona: "Côte de Beaune / Côte de Nuits", denominazione: "Bourgogne AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "14-18 mesi in pièces di rovere francese",
             note_profilo: "Nobile selezione borgognona della famiglia Labruyère-Prieur: piccoli frutti rossi, spezie sottili, mineralità e classe.")
  when 410
    w.merge!(nazione: "Francia", nome_vino: "Château Montus 'Cuvée Prestige' Madiran AOC", produttore: "Alain Brumont (Château Montus)",
             regione: "Sud-Ovest (Francia)", zona: "Pirenei Atlantici - Madiran", denominazione: "Madiran AOC",
             uvaggio: "Tannat 100% da parcelle storiche su ciottoli ripidi",
             affinamento: "14-16 mesi in barrique nuove di rovere francese",
             note_profilo: "Il 'Petrus dei Pirenei' creato da Alain Brumont: mora nera, mirtillo, cacao, liquirizia e struttura monumentale domata in velluto.")
  when 421
    w.merge!(nazione: "Francia", nome_vino: "Nuits-Saint-Georges AOC", produttore: "Domaine Chanson (Chanson Père & Fils)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Nuits-Saint-Georges", denominazione: "Nuits-Saint-Georges AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "14-16 mesi in pièces di rovere francese",
             note_profilo: "Pinot Noir vigoroso e speziato di Nuits-Saint-Georges: ciliegia nera, prugna, pepe nero, sottobosco e ottima spalla.")
  when 430
    w.merge!(nazione: "Francia", nome_vino: "Pernand-Vergelesses 1er Cru 'Les Vergelesses' AOC", produttore: "Domaine Chanson (Domaine de la Bastion)",
             regione: "Borgogna (Francia)", zona: "Côte de Beaune - Pernand-Vergelesses Premier Cru", denominazione: "Pernand-Vergelesses 1er Cru AOC",
             uvaggio: "Pinot Noir 100% (5 ettari di proprietà del Domaine)",
             affinamento: "14-16 mesi in pièces di rovere francese",
             note_profilo: "Storico cru di proprietà di Chanson: lampone, ribes, peonia, nota minerale ferrosa e finale persistente.")
  when 437
    w.merge!(nazione: "Francia", nome_vino: "Mercurey Rouge AOC", produttore: "Domaine Faiveley",
             regione: "Borgogna (Francia)", zona: "Côte Chalonnaise - Mercurey", denominazione: "Mercurey AOC",
             uvaggio: "Pinot Noir 100%", affinamento: "12 mesi in botti e pièces di rovere francese",
             note_profilo: "Classico Mercurey del Domaine Faiveley: frutti rossi croccanti, marasca, spezie leggere e tannino rotondo.")
  when 445
    w.merge!(nazione: "Francia", nome_vino: "Romanée-Saint-Vivant Grand Cru AOC", produttore: "Domaine de la Romanée-Conti (DRC)",
             regione: "Borgogna (Francia)", zona: "Côte de Nuits - Vosne-Romanée Grand Cru (Ex vigneti dell'Abbazia di Saint-Vivant)", denominazione: "Romanée-Saint-Vivant Grand Cru AOC (Biodinamico)",
             uvaggio: "Pinot Noir 100%", affinamento: "18-20 mesi in pièces nuove di rovere francese",
             note_profilo: "Il Grand Cru più etereo e seducente del Domaine de la Romanée-Conti: violetta, petali di rosa, lampone selvatico, pizzo tannico e grazia sublime.")

  # --- MONDO: SPAGNA, PORTOGALLO, STATI UNITI, ARGENTINA, CILE ---
  when 350
    w.merge!(nazione: "Argentina", nome_vino: "Reserva Malbec Mendoza", produttore: "Terrazas de los Andes",
             regione: "Mendoza (Argentina)", zona: "Luján de Cuyo & Valle de Uco (Ande, 1070m s.l.m.)", denominazione: "Mendoza IG",
             uvaggio: "Malbec 100%", affinamento: "12 mesi in barrique di rovere francese e americano",
             note_profilo: "Malbec d'alta quota delle Ande argentine: prugna nera, violetta, mora, cioccolato fondente e tannino morbido.")
  when 356
    w.merge!(nazione: "Portogallo", nome_vino: "Duas Quintas Douro Tinto DOC", produttore: "Adriano Ramos Pinto",
             regione: "Douro (Portogallo)", zona: "Douro Superior (Quinta de Ervamoira & Quinta dos Bons Ares)", denominazione: "Douro DOC",
             uvaggio: "Touriga Nacional, Touriga Franca, Tinta Roriz",
             affinamento: "12 mesi tra botti grandi, barrique di rovere e acciaio",
             note_profilo: "Grande rosso del Douro da due tenute complementari a diversa altitudine: prugna nera, cisto, lavanda, grafite e freschezza scistosa.")
  when 384
    w.merge!(nazione: "Cile", nome_vino: "Hussonet Gran Reserva Cabernet Sauvignon", produttore: "Haras de Pirque (Marchesi Antinori)",
             regione: "Maipo Valley (Cile)", zona: "Alto Maipo - Pirque (Piedimonte Andino)", denominazione: "Valle del Maipo DO (Biologico)",
             uvaggio: "Cabernet Sauvignon 95%, Cabernet Franc 5%",
             affinamento: "12 mesi in barrique di rovere francese",
             note_profilo: "Cabernet Sauvignon cileno d'alta quota ai piedi delle Ande: ribes nero, menta piperita, eucalipto, cacao e tannino setoso.")
  when 412
    w.merge!(nazione: "Stati Uniti", nome_vino: "Opus One Napa Valley", produttore: "Opus One Winery (Baron Philippe de Rothschild & Robert Mondavi)",
             regione: "California (USA)", zona: "Oakville - Napa Valley AVA", denominazione: "Napa Valley AVA",
             uvaggio: "Cabernet Sauvignon 78%, Petit Verdot 8%, Merlot 6%, Cabernet Franc 6%, Malbec 2%",
             affinamento: "19 mesi in barrique nuove di rovere francese al 100% + 18 mesi in bottiglia",
             note_profilo: "Leggendaria joint-venture franco-californiana a Oakville: crème de cassis, rosa nera, espresso, grafite e opulenza vellutata.")
  when 439
    w.merge!(nazione: "Spagna", nome_vino: "Reserva Rioja DOCa (Finca Ygay)", produttore: "Marqués de Murrieta",
             regione: "La Rioja (Spagna)", zona: "Rioja Alta - Finca Ygay (Logroño)", denominazione: "Rioja DOCa Reserva",
             uvaggio: "Tempranillo 80%, Garnacha Negra 12%, Mazuelo 6%, Graciano 2%",
             affinamento: "20 mesi in barrique di rovere americano da 225 litri + 18 mesi in bottiglia",
             note_profilo: "Storica Reserva della più antica bodega di Rioja (1852): ciliegia matura, tabacco biondo, vaniglia nobile, cuoio e grande eleganza.")
  when 479
    w.merge!(nazione: "Stati Uniti", nome_vino: "Diamond Collection Zinfandel California", produttore: "Francis Ford Coppola Winery",
             regione: "California (USA)", zona: "Sonoma / Paso Robles (California)", denominazione: "California AVA",
             uvaggio: "Zinfandel 85%, Petite Sirah 15%",
             affinamento: "10-12 mesi in botti di rovere francese e americano",
             note_profilo: "Zinfandel californiano ricco e avvolgente: mora matura, lampone in confettura, pepe nero, vaniglia e spezie tostate.")
  end
  w
end
