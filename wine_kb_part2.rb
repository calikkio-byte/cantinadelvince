# encoding: UTF-8

def enrich_still_wines(row_num, w)
  ann = w[:annata]
  case row_num
  # --- VINI BIANCHI FERMI & MACERATI ---
  when 1
    w.merge!(nome_vino: "Bourgogne Blanc 'Retour des Flandres'", produttore: "Régnard",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Borgogna / Chablis", denominazione: "Bourgogne Blanc AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio e parziale passaggio in legno",
             note_profilo: "Chardonnay borgognone fresco e minerale: agrumi, fiori bianchi, burro leggero e finale sapido.")
  when 2
    w.merge!(nome_vino: "Ischia Biancolella DOC", produttore: "Cenatiempo",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Campania", zona: "Isola d'Ischia", denominazione: "Ischia Biancolella DOC",
             uvaggio: "Biancolella 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Bianco isolano autentico da terrazzamenti vulcanici a picco sul mare: ginestra, erbe aromatiche, mandorla e iodio.")
  when 3
    w.merge!(nome_vino: "Blanc de Morgex et de La Salle DOC", produttore: "Cave Mont Blanc de Morgex et La Salle",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Valle d'Aosta", zona: "Valdigne (Morgex e La Salle, 1.000-1.200m)", denominazione: "Valle d'Aosta Blanc de Morgex et de La Salle DOC",
             uvaggio: "Prié Blanc 100% (vigne pre-fillossera a piede franco)", affinamento: "Acciaio sulle fecce fini",
             note_profilo: "Vino alpino d'altissima quota: mela verde, fiori di montagna, fieno, timo serpillo e mineralità glaciale.")
  when 4
    w.merge!(nome_vino: "Nuits-Saint-Georges 1er Cru 'Les Terres Blanches' Blanc", produttore: "Domaine Pierre Gelin / Vougeraie",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Côte de Nuits (Nuits-Saint-Georges)", denominazione: "Nuits-Saint-Georges 1er Cru AOC Blanc",
             uvaggio: "Pinot Blanc e Chardonnay", affinamento: "12-15 mesi in pièces di rovere francese",
             note_profilo: "Rarissimo Nuits-Saint-Georges 1er Cru Bianco su suoli calcarei bianchi: pera matura, nocciola, fiori bianchi e grande tensione.")
  when 5
    w.merge!(nome_vino: "R de Rieussec Bordeaux Blanc Sec", produttore: "Château Rieussec (Domaines Barons de Rothschild - Lafite)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Bordeaux", zona: "Sauternes / Graves", denominazione: "Bordeaux Blanc AOC",
             uvaggio: "Sauvignon Blanc 50%, Sémillon 50%", affinamento: "Parziale fermentazione in barrique di Château Rieussec e Lafite",
             note_profilo: "Bianco secco prodotto dal celebre 1er Cru di Sauternes: agrumi, pesca bianca, fiori di tiglio, cera d'api e bella freschezza.")
  when 7, 8
    w.merge!(nome_vino: "Sancerre Blanc 'La Moussière'", produttore: "Baron de Ladoucette (Comte Lafond)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Sancerre", denominazione: "Sancerre AOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Acciaio e vasche vetrificate sulle fecce fini",
             note_profilo: "Sancerre classico e cristallino: pompelmo rosa, bosso, pietra focaia, erbe fini e vibrante acidità.")
  when 9
    w.merge!(nome_vino: "Sancerre Blanc 'Comte Lafond'", produttore: "Baron de Ladoucette",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Sancerre", denominazione: "Sancerre AOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Acciaio sulle fecce fini da vigne storiche del Conte Lafond",
             note_profilo: "Selezioni pregiate di Sancerre: agrumi, pesca bianca, sambuco e spiccata mineralità silicea.")
  when 136
    w.merge!(nome_vino: "Bourgogne Aligoté AOC", produttore: "Jean-Marie Bouzereau",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Meursault (Côte de Beaune)", denominazione: "Bourgogne Aligoté AOC",
             uvaggio: "Aligoté 100%", affinamento: "Fusti di rovere usati e acciaio a Meursault",
             note_profilo: "Aligoté di razza prodotto a Meursault: limone, mela croccante, nocciola fresca e scia salina.")
  when 145
    w.merge!(nome_vino: "Pouilly-Fumé 'Buisson Renard'", produttore: "Domaine Didier Dagueneau (Louis-Benjamin Dagueneau)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Saint-Andelain (Pouilly-Fumé)", denominazione: "Pouilly-Fumé AOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "12 mesi in fusti di rovere (demi-muids e tonneau) sui lieviti",
             note_profilo: "Uno dei più grandi Sauvignon del mondo da suoli di selce (silex): tensione estrema, pompelmo, pietra focaia e profondità leggendaria.")
  when 191
    w.merge!(nome_vino: "Blanc Etc... (ex Pur Sang / XXI)", produttore: "Domaine Didier Dagueneau (Louis-Benjamin Dagueneau)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Saint-Andelain (Pouilly-Fumé)", denominazione: "Vin de France / Pouilly-Fumé",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Fusti di rovere su misura sui lieviti fini",
             note_profilo: "Purezza magistrale della famiglia Dagueneau: agrumi gialli, fiori bianchi, selce fumé e persistenza monumentale.")
  when 150
    w.merge!(nome_vino: "Chablis 1er Cru 'Mont de Milieu'", produttore: "Domaine Billaud-Simon",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Chablis (Rive Droite)", denominazione: "Chablis Premier Cru AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio inox e piccolo passaggio in legno su suoli kimmeridgiani",
             note_profilo: "Premier Cru storico della riva destra di Chablis: solare ma tagliente, agrumi maturi, guscio d'ostrica e fiori bianchi.")
  when 151
    w.merge!(nome_vino: "Chablis 1er Cru 'Vaillons'", produttore: "Domaine Servin",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Chablis (Rive Gauche)", denominazione: "Chablis Premier Cru AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio sulle fecce fini da marne kimmeridgiane",
             note_profilo: "Elegante e floreale Premier Cru della riva sinistra: biancospino, mela verde, gesso e iodio.")
  when 152
    w.merge!(nome_vino: "Chablis AOC", produttore: "Albert Pic (Baron de Ladoucette)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Chablis", denominazione: "Chablis AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Dalla più antica Maison di Chablis (1755): teso, minerale, limone, pietra focaia e mela verde.")
  when 153
    w.merge!(nome_vino: "Chablis Village AOC", produttore: "Domaine Billaud-Simon",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Chablis", denominazione: "Chablis AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Chablis cristallino e cesellato: agrumi freschi, fiori d'acacia e sapidità marina kimmeridgiana.")
  when 158
    w.merge!(nome_vino: "Cru Monplaisir Bordeaux Blanc Sec", produttore: "Gonet-Médeville",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Bordeaux", zona: "Graves / Entre-Deux-Mers", denominazione: "Bordeaux Blanc AOC",
             uvaggio: "Sauvignon Blanc 70%, Sémillon 30%", affinamento: "Fermentazione e affinamento in barrique di rovere francese",
             note_profilo: "Bordeaux bianco secco di stile Graves firmato Julie e Xavier Gonet-Médeville: pesca bianca, pompelmo, vaniglia fine e tensione.")
    w[:correzioni] << "Categoria corretta da Rosso a Vino Bianco (Bordeaux Blanc)"
  when 159
    w.merge!(nome_vino: "Derthona Timorasso Colli Tortonesi DOC", produttore: "Vigneti Massa",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Piemonte", zona: "Colli Tortonesi (Monleale, Alessandria)", denominazione: "Colli Tortonesi DOC Timorasso (Derthona)",
             uvaggio: "Timorasso 100%", affinamento: "Circa 12 mesi in acciaio sulle fecce fini (sur lie) con bâtonnage",
             note_profilo: "Il padre della rinascita del Timorasso (Walter Massa): strutturato, miele d'acacia, pesca gialla, pietra focaia e note idrocarburiche in evoluzione.")
  when 161
    w.merge!(nome_vino: "Condrieu AOC 'Les Terrasses de l'Empire'", produttore: "Domaine Georges Vernay",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle del Rodano", zona: "Condrieu (Rodano Settentrionale)", denominazione: "Condrieu AOC",
             uvaggio: "Viognier 100%", affinamento: "Botti di rovere (foudres e barriques) sui lieviti per 8-10 mesi",
             note_profilo: "Dalla cantina storica che ha salvato il Condrieu: albicocca, pesca bianca, violetta, spezie dolci e freschezza granitica.")
  when 163
    w.merge!(nome_vino: "Riesling d'Alsace 'Les Princes Abbés'", produttore: "Domaines Schlumberger",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Alsazia", zona: "Guebwiller (Haut-Rhin)", denominazione: "Alsace AOC",
             uvaggio: "Riesling 100%", affinamento: "Botti grandi tradizionali alsaziane (foudres) sulle fecce fini",
             note_profilo: "Riesling alsaziano elegante e verticale: lime, pompelmo, fiori bianchi e spiccata mineralità di arenaria.")
  when 170
    w.merge!(nome_vino: "Muscadet Sèvre et Maine Sur Lie 'Royal Oyster'", produttore: "Marc Brédif (Baron de Ladoucette)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Nantes (Sèvre et Maine)", denominazione: "Muscadet Sèvre et Maine Sur Lie AOC",
             uvaggio: "Melon de Bourgogne 100%", affinamento: "Affinamento 'Sur Lie' (sulle fecce fini) fino all'imbottigliamento",
             note_profilo: "Il compagno d'elezione di ostriche e crudi di mare: salmastro, iodato, limone verde e mela croccante.")
  when 173
    w.merge!(nome_vino: "Pouilly-Fumé AOC", produttore: "Baron de Ladoucette",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Pouilly-sur-Loire", denominazione: "Pouilly-Fumé AOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Acciaio e vasche vetrificate sui lieviti",
             note_profilo: "Grande classico della Loira: sentori fumé di pietra focaia, agrumi, fiori di sambuco e finale lunghissimo.")
  when 174, 175, 185, 186, 187
    w.merge!(nome_vino: "Pouilly-Fumé 'Baron de L'", produttore: "Baron de Ladoucette",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Valle della Loira", zona: "Pouilly-sur-Loire (Château du Nozet)", denominazione: "Pouilly-Fumé AOC",
             uvaggio: "Sauvignon Blanc 100% (selezioni parcellari solo nelle grandi annate)",
             affinamento: "Lungo affinamento sui lieviti fini in vasche vetrificate",
             note_profilo: "Una delle massime espressioni mondiali del Sauvignon Blanc: purezza assoluta, selce, erbe aromatiche, agrumi e longevità straordinaria.")
  when 183
    w.merge!(nome_vino: "Alteni di Brassica Langhe DOC", produttore: "Gaja",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Piemonte", zona: "Langhe (Barbaresco e Serralunga d'Alba)", denominazione: "Langhe DOC Sauvignon",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Fermentazione e 6 mesi di affinamento in barrique",
             note_profilo: "Il grande Sauvignon delle Langhe creato da Angelo Gaja nel 1983: papaya, pera, salvia, spezie fini e struttura avvolgente.")
  when 184
    w.merge!(nome_vino: "Aristòs Kerner Alto Adige Valle Isarco DOC", produttore: "Cantina Valle Isarco (Eisacktaler Kellerei)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Valle Isarco (Chiusa, 550-900m s.l.m.)", denominazione: "Alto Adige Valle Isarco DOC",
             uvaggio: "Kerner 100%", affinamento: "7 mesi sui lieviti nobili in acciaio inox",
             note_profilo: "Selezione di punta Aristòs da vigne eroiche: pesca bianca, mango, erbe alpine, noce moscata e tensione minerale.")
  when 192
    w.merge!(nome_vino: "Beyond the Clouds Alto Adige DOC", produttore: "Elena Walch",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Termeno (Alto Adige)", denominazione: "Alto Adige Bianco DOC",
             uvaggio: "Chardonnay (prevalente) con altre uve a bacca bianca aziendali",
             affinamento: "Fermentazione e 10 mesi di affinamento in barrique nuove di rovere francese + 6 mesi in bottiglia",
             note_profilo: "Cuvée bianca ammiraglia di Elena Walch: ananas, fiori di campo, nocciola tostata, vaniglia e freschezza alpina.")
  when 193
    w.merge!(nome_vino: "Bianca di Valguarnera Insolia Sicilia DOC", produttore: "Duca di Salaparuta",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sicilia", zona: "Tenuta di Suor Marchesa (Butera, Caltanissetta)", denominazione: "Sicilia DOC",
             uvaggio: "Inzolia (Insolia) 100%", affinamento: "Fermentazione e oltre 8-10 mesi in barrique di rovere su fecce fini",
             note_profilo: "Storico grande bianco siciliano da invecchiamento (dal 1987): frutta gialla matura, vaniglia, miele, mandorla tostata e sapidità.")
  when 194
    w.merge!(nome_vino: "Bianchi Grilli per la Testa Trebbiano d'Abruzzo DOC", produttore: "Torre dei Beati",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Abruzzo", zona: "Loreto Aprutino (Pescara)", denominazione: "Trebbiano d'Abruzzo DOC (Biologico)",
             uvaggio: "Trebbiano d'Abruzzo 100%", affinamento: "Acciaio e parziale passaggio in barrique e tonneau",
             note_profilo: "Trebbiano d'Abruzzo profondo e territoriale: ginestra, pesca gialla, zafferano, mandorla e grande allungo salino.")
  when 195
    w.merge!(nome_vino: "Chablis Premier Cru / Bourgogne Blanc 2009", produttore: "Régnard",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Chablis", denominazione: "Chablis Premier Cru / Bourgogne AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio sulle fecce fini e lungo affinamento in bottiglia",
             note_profilo: "Vecchia annata 2009 di Régnard: complessità terziaria di miele, nocciola, tartufo bianco, cera d'api e mineralità kimmeridgiana.")
  when 196
    w.merge!(nome_vino: "Bourgogne Chardonnay 'Couvent des Jacobins'", produttore: "Maison Louis Jadot",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Côte d'Or / Mâconnais / Chalonnais", denominazione: "Bourgogne Blanc AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Parziale affinamento in fusti di rovere francese per 8-10 mesi",
             note_profilo: "Classico Chardonnay borgognone di Louis Jadot: pera, fiori bianchi, nocciola leggera e bocca rotonda ed equilibrata.")
  when 197
    w.merge!(nome_vino: "Bourgogne Chardonnay AOC", produttore: "Régnard",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Borgogna / Yonne", denominazione: "Bourgogne Blanc AOC",
             uvaggio: "Chardonnay 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Fresco, verticale e minerale nello stile di Chablis: agrumi, mela verde e fiori di biancospino.")
  when 198
    w.merge!(nome_vino: "Capri Bianco DOC", produttore: "Scala Fenicia",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Campania", zona: "Isola di Capri (Scala Fenicia)", denominazione: "Capri Bianco DOC",
             uvaggio: "Greco 50%, Falanghina 30%, Biancolella 20%", affinamento: "Acciaio inox",
             note_profilo: "Raro bianco prodotto sull'Isola di Capri tra antichi limoneti a picco sul mare: zagara, cedro di Capri, macchia mediterranea e salinità.")
  when 200
    w.merge!(nome_vino: "Cervaro della Sala Umbria IGT", produttore: "Castello della Sala (Marchesi Antinori)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Umbria", zona: "Ficulle / Orvieto (Terni)", denominazione: "Umbria IGT Bianco",
             uvaggio: "Chardonnay 90%, Grechetto 10%", affinamento: "Fermentazione e 5 mesi in barrique di rovere francese (per lo Chardonnay) + affinamento in bottiglia",
             note_profilo: "Uno dei più grandi bianchi italiani da invecchiamento: camomilla, pietra focaia, burro di nocciola, vaniglia e agrumi.")
  when 201
    w.merge!(nome_vino: "Conte della Vipera Umbria IGT", produttore: "Castello della Sala (Marchesi Antinori)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Umbria", zona: "Ficulle / Orvieto (Terni)", denominazione: "Umbria IGT Bianco",
             uvaggio: "Sauvignon Blanc 80%, Sémillon 20%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Ispirato ai grandi bianchi di Bordeaux: pompelmo, pesca bianca, bosso, cedro e vibrante acidità.")
  when 202
    w.merge!(nome_vino: "Corte del Lupo Bianco Curtefranca DOC", produttore: "Ca' del Bosco",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Lombardia", zona: "Franciacorta (Erbusco, Brescia)", denominazione: "Curtefranca Bianco DOC (Biologico)",
             uvaggio: "Chardonnay 80%, Pinot Bianco 20%", affinamento: "8 mesi in acciaio e piccole botti di rovere sui lieviti",
             note_profilo: "Bianco fermo elegante della Franciacorta: pesca gialla, agrumi, mandorla, spezie leggere e sapidità.")
  when 203
    w.merge!(nome_vino: "Chardonnay 'Cuvée Bois' Valle d'Aosta DOC", produttore: "Les Crêtes",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Valle d'Aosta", zona: "Aymavilles / Valle d'Aosta", denominazione: "Valle d'Aosta Chardonnay DOC",
             uvaggio: "Chardonnay 100%", affinamento: "Fermentazione e 10-12 mesi in tonneau/barrique di rovere francese sui lieviti con bâtonnage",
             note_profilo: "Icona alpina di Costantino Charrère: ricchezza burrosa e tostata bilanciata da una lama di freschezza montana.")
  when 208
    w.merge!(nome_vino: "Elba Vermentino DOC", produttore: "Chiesina di Lacona",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Toscana", zona: "Isola d'Elba (Lacona)", denominazione: "Elba Vermentino DOC",
             uvaggio: "Vermentino 100%", affinamento: "Acciaio inox",
             note_profilo: "Bianco marino dell'Isola d'Elba: elicriso, rosmarino, pesca bianca, agrumi e finale salmastro.")
  when 209
    w.merge!(nome_vino: "Epokale Gewürztraminer Spätlese Alto Adige DOC", produttore: "Cantina Tramin",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Termeno (Söll, Alto Adige)", denominazione: "Alto Adige Gewürztraminer DOC Vendemmia Tardiva",
             uvaggio: "Gewürztraminer 100% (vigne vecchie)", affinamento: "Acciaio e 7 anni di affinamento nel buio della miniera di Monteneve a 2.000m di quota",
             note_profilo: "Primo bianco italiano a ricevere 100/100 Robert Parker: litchi, rosa bulgara, mango, zafferano, miele alpino e freschezza prodigiosa.")
  when 210
    w.merge!(nome_vino: "Lavico Etna Bianco DOC", produttore: "Duca di Salaparuta (Tenuta Vajasindi)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sicilia", zona: "Etna Nord (Castiglione di Sicilia)", denominazione: "Etna Bianco DOC",
             uvaggio: "Carricante (prevalente) e Catarratto", affinamento: "Acciaio sulle fecce fini",
             note_profilo: "Bianco vulcanico del versante nord dell'Etna: mela verde, ginestra, pompelmo e scia di pietra lavica.")
  when 211
    w.merge!(nome_vino: "Etna Bianco DOC", produttore: "Graci",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sicilia", zona: "Etna Nord (Passopisciaro)", denominazione: "Etna Bianco DOC (Biologico)",
             uvaggio: "Carricante 70%, Catarratto 30%", affinamento: "Vasche di cemento sulle fecce fini",
             note_profilo: "Teso, verticale e marino-vulcanico: limone, erbe selvatiche, cenere e lunghissima sapidità.")
  when 213, 214, 215, 216
    w.merge!(nome_vino: "Fiorduva Costa d'Amalfi Furore Bianco DOC", produttore: "Marisa Cuomo",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Campania", zona: "Costiera Amalfitana (Furore)", denominazione: "Costa d'Amalfi Furore Bianco DOC",
             uvaggio: "Fenile 30%, Ginestra 30%, Ripoli 40%", affinamento: "Fermentazione e 3 mesi in barrique di rovere francese nella cantina scavata nella roccia",
             note_profilo: "Mito eroico della Costiera Amalfitana: oro solare che sa di albicocca, ginestra, macchia mediterranea, miele e brezza marina.")
  when 217
    w.merge!(nome_vino: "Friulano Friuli Colli Orientali DOC", produttore: "Livio Felluga",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Rosazzo / Colli Orientali del Friuli", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Friulano (ex Tocai Friulano) 100%", affinamento: "6 mesi in acciaio inox sulle fecce fini",
             note_profilo: "Classico Friulano della 'Carta Geografica': fiori di campo, pesca bianca, salvia e tipico finale di mandorla amara.")
  when 218
    w.merge!(nome_vino: "Gaia & Rey Langhe DOC Chardonnay", produttore: "Gaja",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Piemonte", zona: "Langhe (Treiso e Serralunga d'Alba)", denominazione: "Langhe DOC Chardonnay",
             uvaggio: "Chardonnay 100%", affinamento: "Fermentazione e 6-8 mesi in barrique di rovere francese",
             note_profilo: "Primo Chardonnay italiano da lungo invecchiamento (1979): monumentale, agrumi canditi, nocciola, burro, pietra focaia e tensione da grande Borgogna.")
  when 219
    w.merge!(nome_vino: "Gewürztraminer Alsace AOC", produttore: "Vincent Spannagel",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Alsazia", zona: "Katzenthal (Haut-Rhin)", denominazione: "Alsace AOC (Biologico)",
             uvaggio: "Gewürztraminer 100%", affinamento: "Acciaio e botti tradizionali sulle fecce fini",
             note_profilo: "Gewürztraminer alsaziano artigianale: rosa, litchi, zenzero candito, spezie orientali ed equilibrio gastronomico.")
  when 220
    w.merge!(nome_vino: "Gewürztraminer Alto Adige DOC (Nussbaumer / Selezione)", produttore: "Cantina Tramin",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Termeno (patria del Gewürztraminer)", denominazione: "Alto Adige Gewürztraminer DOC",
             uvaggio: "Gewürztraminer 100%", affinamento: "Acciaio inox sui lieviti fini",
             note_profilo: "Dalla patria d'origine del vitigno (Tramin/Termeno): petali di rosa, frutto della passione, chiodi di garofano e freschezza alpina.")
  when 221
    w.merge!(nome_vino: "Giancu Isola dei Nuraghi IGT", produttore: "Cantina Tani / Tenute Ugolini (Tabarka - Isola di San Pietro)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sardegna", zona: "Isola di San Pietro - Carloforte (Sulcis)", denominazione: "Isola dei Nuraghi IGT Bianco",
             uvaggio: "Vermentino e Nasco / Moscato da vigne su sabbie marine", affinamento: "Acciaio sulle fecce fini",
             note_profilo: "Bianco isolano di Carloforte: macchia mediterranea, mirto bianco, agrumi, iodio e vento di maestrale.")
  when 224
    w.merge!(nome_vino: "Glarea Chardonnay Alto Adige DOC", produttore: "Cantina Tramin",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Termeno (Alto Adige)", denominazione: "Alto Adige Chardonnay DOC",
             uvaggio: "Chardonnay 100%", affinamento: "Fermentazione e affinamento tra acciaio e botti di rovere",
             note_profilo: "Chardonnay su ghiaie calcaree ('glarea'): pera matura, nocciola, agrumi e vena minerale.")
  when 227
    w.merge!(nome_vino: "L'Isola Ustica Bianco Terre Siciliane IGT", produttore: "Hibiscus",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sicilia", zona: "Isola di Ustica (Palermo)", denominazione: "Terre Siciliane IGT Bianco (Biologico)",
             uvaggio: "Inzolia, Catarratto, Grillo", affinamento: "Acciaio sulle fecce fini",
             note_profilo: "Vino eroico dalla piccola isola vulcanica di Ustica: cappero, ginestra, agrumi, pietra lavica e sale marino.")
  when 228
    w.merge!(nome_vino: "Latour a Civitella Grechetto Civitella d'Agliano IGT", produttore: "Sergio Mottura",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Lazio", zona: "Civitella d'Agliano (Tuscia Viterbese)", denominazione: "Civitella d'Agliano IGT Grechetto (Biologico)",
             uvaggio: "Grechetto 100%", affinamento: "Fermentazione e 9-12 mesi in barrique di rovere francese + lungo affinamento in bottiglia",
             note_profilo: "Il grande Grechetto italiano (spesso paragonato ai bianchi di Borgogna): nocciola tostata, pesca, zafferano e mineralità tufacea.")
  when 230
    w.merge!(nome_vino: "Petite Arvine Valle d'Aosta DOC", produttore: "Les Crêtes",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Valle d'Aosta", zona: "Aymavilles (Valle d'Aosta)", denominazione: "Valle d'Aosta Petite Arvine DOC",
             uvaggio: "Petite Arvine 100%", affinamento: "Acciaio sulle fecce fini con lavorazione a freddo",
             note_profilo: "Vitigno autoctono alpino vibrante: pompelmo rosa, rabarbaro, glicine, salvia e chiusura salina inconfondibile.")
  when 231
    w.merge!(nome_vino: "I Frati Lugana DOC", produttore: "Ca' dei Frati",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Lombardia", zona: "Sirmione (Lago di Garda)", denominazione: "Lugana DOC",
             uvaggio: "Turbiana 100%", affinamento: "6 mesi in acciaio sulle fecce fini + 2 mesi in bottiglia",
             note_profilo: "Il Lugana per antonomasia: fiori bianchi, albicocca, mandorla fresca e sapidità minerale delle argille del Garda.")
  when 233
    w.merge!(nome_vino: "Sergio Zenato Lugana Riserva DOC", produttore: "Zenato",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Veneto", zona: "Peschiera del Garda (Podere Massoni)", denominazione: "Lugana Riserva DOC",
             uvaggio: "Trebbiano di Lugana (Turbiana) 100% da vigne vecchie", affinamento: "Fermentazione e 6 mesi in botti e tonneaux di rovere + 12 mesi in bottiglia",
             note_profilo: "Lugana Riserva di grande struttura e longevità: frutta tropicale, spezie dolci, vaniglia e profondità minerale.")
  when 234
    w.merge!(nome_vino: "Malvasia Friuli Colli Orientali DOC", produttore: "Meroi",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Malvasia Istriana 100%", affinamento: "Fermentazione e 10 mesi in barrique di rovere francese",
             note_profilo: "Malvasia Istriana sartoriale di Paolo Meroi: pepe bianco, albicocca, erbe aromatiche, volume avvolgente e scia salina.")
  when 235
    w.merge!(nome_vino: "Vette di San Leonardo Sauvignon Vigneti delle Dolomiti IGT", produttore: "Tenuta San Leonardo (Marchesi Guerrieri Gonzaga)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Vallagarina / Borghetto all'Adige (Trento)", denominazione: "Vigneti delle Dolomiti IGT",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "5 mesi sui lieviti in acciaio inox",
             note_profilo: "Fresco, croccante e dolomitico: pesca bianca, salvia, frutto della passione e mineralità viva.")
  when 238
    w.merge!(nome_vino: "Schiefer Riesling Trocken Mosel", produttore: "Villa Huesgen",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Germania",
             regione: "Mosella", zona: "Traben-Trarbach (Mosel)", denominazione: "Mosel Qualitätswein",
             uvaggio: "Riesling 100%", affinamento: "Acciaio su ripidi pendii di ardesia blu della Mosella",
             note_profilo: "Riesling della Mosella su ardesia (Schiefer): mela verde, pesca bianca, lime e tensione minerale cristallina.")
  when 239
    w.merge!(nome_vino: "Pandataria Bianco Lazio IGT (Isola di Ventotene)", produttore: "Candidaterra",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Lazio", zona: "Isola di Ventotene (Isole Ponziane)", denominazione: "Lazio IGT Bianco",
             uvaggio: "Fiano 50%, Falanghina 30%, Greco 20%", affinamento: "Acciaio inox",
             note_profilo: "Vino eroico dell'Isola di Ventotene (antica Pandataria) su suoli vulcanici: ginestra, agrumi, erbe marine e spiccata sapidità.")
  when 244
    w.merge!(nome_vino: "Pinot Grigio Friuli Colli Orientali DOC", produttore: "Meroi",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Pinot Grigio 100%", affinamento: "Fermentazione e 8-10 mesi in barrique di rovere",
             note_profilo: "Pinot Grigio potente e cremoso da vecchie vigne a Buttrio: pera decana, nocciola, spezie fini e grande corpo.")
  when 245
    w.merge!(nome_vino: "Pinot Grigio Colli Orientali del Friuli / Collio DOC", produttore: "Livio Felluga",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Collio / Colli Orientali del Friuli", denominazione: "Collio / Friuli Colli Orientali DOC",
             uvaggio: "Pinot Grigio 100%", affinamento: "6 mesi in acciaio inox sulle fecce fini",
             note_profilo: "Elegante e sfaccettato: fiori d'acacia, nespola, pera williams e sapidità della ponca friulana.")
  when 246
    w.merge!(nome_vino: "Poggio alle Gazze dell'Ornellaia Toscana IGT", produttore: "Tenuta dell'Ornellaia",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Toscana", zona: "Bolgheri (Livorno)", denominazione: "Toscana IGT Bianco",
             uvaggio: "Sauvignon Blanc (prevalente) con Viognier e Vermentino",
             affinamento: "Fermentazione e 6 mesi tra barrique di rovere (nuove e usate), acciaio e cemento sui lieviti",
             note_profilo: "Il grande bianco di Tenuta dell'Ornellaia: agrumi maturi, pesca bianca, erbe mediterranee, bosso e finale salino.")
  when 247
    w.merge!(nome_vino: "Poggio della Costa Grechetto Civitella d'Agliano IGT", produttore: "Sergio Mottura",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Lazio", zona: "Civitella d'Agliano (Viterbo)", denominazione: "Civitella d'Agliano IGT Grechetto (Biologico)",
             uvaggio: "Grechetto 100%", affinamento: "Acciaio inox sulle fecce fini per 6 mesi",
             note_profilo: "Grechetto in purezza vinificato in solo acciaio: pera, mela renetta, ginestra, nocciola e mineralità tufacea.")
  when 250
    w.merge!(nome_vino: "Vini Orsone Ribolla Gialla Friuli DOC", produttore: "Bastianich",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Cividale del Friuli / Buttrio", denominazione: "Friuli Colli Orientali / Venezia Giulia IGT",
             uvaggio: "Ribolla Gialla 100%", affinamento: "Acciaio sulle fecce fini",
             note_profilo: "Fresco, agrumato e floreale: limone, mela verde, fiori di campo e vivace acidità.")
  when 251, 252
    w.merge!(nome_vino: "Vinnae Ribolla Gialla Venezia Giulia IGT", produttore: "Jermann",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Collio / Dolegna del Collio (Gorizia)", denominazione: "Venezia Giulia IGT Bianco",
             uvaggio: "Ribolla Gialla 90%, Friulano 5%, Riesling Renano 5%",
             affinamento: "6 mesi sui lieviti in acciaio e parte in botti grandi di rovere di Slavonia",
             note_profilo: "Storica etichetta Jermann (dedicata ai 100 anni della cantina): asciutto, sapido, mela renetta, agrumi e mineralità del Collio.")
  when 253
    w.merge!(nome_vino: "Riesling Alto Adige Valle Isarco DOC", produttore: "Weingut Villscheider",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Bressanone (Valle Isarco, 700m s.l.m.)", denominazione: "Alto Adige Valle Isarco DOC",
             uvaggio: "Riesling Renano 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Riesling d'alta montagna dalla tenuta storica Villscheider sopra Bressanone: pesca bianca, lime, selce e acidità verticale.")
  when 256
    w.merge!(nome_vino: "San Giovanni della Sala Orvieto Classico Superiore DOC", produttore: "Castello della Sala (Marchesi Antinori)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Umbria", zona: "Orvieto / Ficulle (Terni)", denominazione: "Orvieto Classico Superiore DOC",
             uvaggio: "Grechetto, Procanico, Pinot Bianco e Viognier", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Fresco, sapido e fragrante: pesca gialla, agrumi, fiori bianchi e mineralità dei suoli marini fossili.")
  when 258
    w.merge!(nome_vino: "Sauvignon 'Turi' Friuli Colli Orientali DOC", produttore: "Meroi",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Fermentazione e 10 mesi in barrique di rovere francese",
             note_profilo: "Sauvignon ricco e sfaccettato: sambuco, pompelmo, salvia, spezie dolci e persistenza avvolgente.")
  when 259
    w.merge!(nome_vino: "Sauvignon Friuli Colli Orientali DOC", produttore: "Miani",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Colli Orientali del Friuli)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Sauvignon Blanc 100% (rese bassissime)", affinamento: "Fermentazione e 12 mesi in barrique di rovere francese",
             note_profilo: "Rarissimo vino di culto di Enzo Pontoni (Miani): concentrazione, tensione elettrica, erbe aromatiche, agrumi e lunghezza infinita.")
  when 260
    w.merge!(nome_vino: "Sanct Valentin Sauvignon Alto Adige DOC", produttore: "San Michele Appiano (St. Michael-Eppan)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Trentino-Alto Adige", zona: "Appiano sulla Strada del Vino (Oltradige)", denominazione: "Alto Adige Sauvignon DOC",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Acciaio (75%) e botti di acacia/tonneau (25%) sui lieviti",
             note_profilo: "Uno dei Sauvignon più amati d'Italia: sambuco, uva spina, pesca bianca, foglia di fico e freschezza alpina.")
  when 266
    w.merge!(nome_vino: "Terre Alte Rosazzo DOCG", produttore: "Livio Felluga",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Rosazzo (Colli Orientali del Friuli)", denominazione: "Rosazzo DOCG",
             uvaggio: "Friulano, Pinot Bianco, Sauvignon",
             affinamento: "10 mesi in acciaio (Pinot Bianco e Sauvignon) e piccole botti di rovere francese (Friulano) + 9 mesi in bottiglia",
             note_profilo: "Capolavoro storico del vino bianco italiano (dal 1981): fiori d'arancio, frutta tropicale, erbe officinali, mandorla e maestosa eleganza.")
  when 267
    w.merge!(nome_vino: "Chablis 'Cuvée Thomas Pico' / Pattes Loup", produttore: "Domaine Pattes Loup (Thomas Pico)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Francia",
             regione: "Borgogna", zona: "Courgis (Chablis)", denominazione: "Chablis AOC (Biologico / Biodinamico)",
             uvaggio: "Chardonnay 100%", affinamento: "Lungo affinamento sur lie in vasche di cemento ovoidali e foudres",
             note_profilo: "Astro assoluto della nuova generazione biodinamica di Chablis: concentrazione salina, agrumi canditi, gesso e profondità vibrante.")
  when 268
    w.merge!(nome_vino: "Un Anno Dopo Vermentino di Sardegna Superiore", produttore: "Quarto Moro di Sardegna",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Sardegna", zona: "Arborea / Terralba (Oristano)", denominazione: "Vermentino di Sardegna DOC / Isola dei Nuraghi IGT",
             uvaggio: "Vermentino 100%", affinamento: "12 mesi sulle fecce fini prima dell'imbottigliamento",
             note_profilo: "Vermentino evoluto e gastronomico: macchia mediterranea, nespola, mandorla tostata e scia salina.")
  when 269
    w.merge!(nome_vino: "Vermentino Bolgheri DOC", produttore: "Tenuta Guado al Tasso (Marchesi Antinori)",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Toscana", zona: "Bolgheri (Castagneto Carducci)", denominazione: "Bolgheri Vermentino DOC",
             uvaggio: "Vermentino 100%", affinamento: "Acciaio inox a temperatura controllata",
             note_profilo: "Luminoso bianco della costa bolgherese: frutto della passione, pesca bianca, cedro e mineralità marina.")
  when 270
    w.merge!(nome_vino: "Vermentino Costa Toscana IGT / Val di Cornia", produttore: "Gualdo del Re",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Toscana", zona: "Suvereto (Val di Cornia, Livorno)", denominazione: "Costa Toscana IGT Vermentino (Biologico)",
             uvaggio: "Vermentino 100%", affinamento: "Acciaio inox sulle fecce fini",
             note_profilo: "Fresco e mediterraneo da Suvereto: fiori di campo, mela gialla, salvia e sapidità tirrenica.")
  when 271
    w.merge!(nome_vino: "Vespa Bianco Venezia Giulia IGT", produttore: "Bastianich",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio e Premariacco (Colli Orientali)", denominazione: "Venezia Giulia IGT Bianco",
             uvaggio: "Chardonnay 45%, Sauvignon 45%, Picolit 10%",
             affinamento: "Fermentazione e 12 mesi tra acciaio e botti di rovere + lungo affinamento in bottiglia",
             note_profilo: "Grande bianco friulano da invecchiamento: miele, agrumi maturi, pesca, pietra focaia e complessità data dal Picolit.")
  when 272
    w.merge!(nome_vino: "Vigna Zitelle Sauvignon Friuli Colli Orientali DOC", produttore: "Meroi",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Buttrio (Cru Zitelle, Colli Orientali)", denominazione: "Friuli Colli Orientali DOC",
             uvaggio: "Sauvignon Blanc 100% (Singolo Cru Zitelle)", affinamento: "Fermentazione e 10-12 mesi in barrique di rovere francese",
             note_profilo: "Cru iconico di Paolo Meroi: potenza e finezza, pompelmo, salvia, spezie orientali, crema e lunghissima persistenza.")
  when 273
    w.merge!(nome_vino: "Vigneti di Foscarino / Carbonare Soave Classico DOC", produttore: "Inama",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Veneto", zona: "Soave Classico (Suoli vulcanici basaltici)", denominazione: "Soave Classico DOC",
             uvaggio: "Garganega 100%", affinamento: "Acciaio e/o botti sui lieviti su suoli di basalto nero vulcanico",
             note_profilo: "Soave Classico vulcanico: fiori di sambuco, camomilla, mandorla dolce, agrumi e profonda mineralità basaltica.")
  when 274
    w.merge!(nome_vino: "Vintage Tunina Venezia Giulia IGT", produttore: "Jermann",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Dolegna del Collio (Cru Ronco del Fortino)", denominazione: "Venezia Giulia IGT Bianco",
             uvaggio: "Sauvignon, Chardonnay, Ribolla Gialla, Malvasia Istriana, Picolit",
             affinamento: "Acciaio e parziale passaggio in botte grande di rovere sui lieviti",
             note_profilo: "Leggenda dell'enologia italiana (dal 1975): sinfonia di fiori di campo, miele d'acacia, frutta esotica e persistenza regale.")
  when 275
    w.merge!(nome_vino: "Vitovska Carso DOC (Macerato)", produttore: "Skerk",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Macerato / Orange", nazione: "Italia",
             regione: "Friuli-Venezia Giulia", zona: "Carso Triestino (Prepotto, Duino-Aurisina)", denominazione: "Carso / Venezia Giulia IGT",
             uvaggio: "Vitovska 100%", affinamento: "Macerazione sulle bucce in tini aperti e 12 mesi in botti di rovere nella grotta scavata nella roccia carsica",
             note_profilo: "Bianco macerato artigianale del Carso: albicocca disidratata, erbe carsiche, scorza d'arancia, iodio e trama tannica finissima.")
  when 276
    w.merge!(nome_vino: "Vulcaia Fumé Veneto IGT Sauvignon", produttore: "Inama",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Italia",
             regione: "Veneto", zona: "Monte Foscarino (Soave, Verona)", denominazione: "Veneto IGT Bianco",
             uvaggio: "Sauvignon Blanc 100%", affinamento: "Fermentazione e 6-8 mesi in barrique di rovere francese",
             note_profilo: "Sauvignon da terroir vulcanico affinato in legno: pietra focaia fumé, frutto della passione, nocciola tostata e grande tensione.")
  when 277
    w.merge!(nome_vino: "Yarden Chardonnay Galilee", produttore: "Golan Heights Winery",
             macro_tipologia: "Vino Bianco", categoria: "Bianco Fermo", nazione: "Israele",
             regione: "Golan Heights", zona: "Alta Galilea / Alture del Golan (fino a 1.200m)", denominazione: "Galilee Appellation (Kosher)",
             uvaggio: "Chardonnay 100%", affinamento: "7 mesi in barrique di rovere francese sui lieviti",
             note_profilo: "Rinomato Chardonnay d'alta quota su suoli vulcanici del Golan: pera, limone, vaniglia, brioche e freschezza minerale.")
  when 267
    # covered above
  end
  w
end
