waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

//player createDiarySubject ["changelog","Das Team"];
//player createDiarySubject ["serverrules","Serverregeln"];
//player createDiarySubject ["policerules","Polizeiregeln"];
//player createDiarySubject ["safezones","Safe Zones "];
//player createDiarySubject ["civrules","Civilian Rules"];
//player createDiarySubject ["illegalitems","Illegales"];
player createDiarySubject ["buss","Bußgelder"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Steuerung"];

	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					The official change log can be found on the BIS forums (search Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Custom Change Log",
				"
					This section is meant for people doing their own edits to the mission, DO NOT REMOVE THE ABOVE.
				"
		]
	];

	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Das Ausrauben, Niederschlagen oder Töten in diesen Zonen ist verboten und kann mit Kick/Ban bestraft werden.br/><br/>
					
					Alle Fahrzeugspawns (Händler und öffentliche Garagen)<br/>
					Alle Waffenläden<br/>
					Alle Bankautomaten<br/>
					Alle Polizei HQs und Stationen<br/>
					Rebellen HQ<br/><br/>
				"
		]
	];
					

		
				player createDiaryRecord ["serverrules",
		[
			"Abschlussworte", 
				"
				<br/>								
				Für Anregungen und Verbesserungsvorschläge von euch <br/>
				haben wir immer ein offenes Ohr.<br/>
				Denn nur das Miteinander ermöglicht es uns gemeinsam<br/>
				auf Altis zu spielen und Spaß dabei zu haben.<br/><br/>
				
				Es liegt an jedem selber wie erfolgreich er auf unserem <br/>
				Server ist, aber bedenkt, dass man mit Ruhe und einem <br/>
				gewissen <br/><br/>
				
				Rahmen an Freundlichkeit oft leichter an sein Ziel kommt.<br/>
				Oft ist es auch hilfreich nicht jedes gesagte <br/>
				Wort persönlich zu nehmen.<br/><br/>
		
				"
		]
	];	
		
		player createDiaryRecord ["serverrules",
		[
			"Allgemeine Regeln", 
				"
				<br/>								
				- Das Zerstören von Fahrzeugen ist verboten,<br/>
				  ausgenommen Erpressungen im RP Rahmen (angemessen max. 1/3 des Fahrzeugwertes).<br/><br/>
				
				- Das Abschleppen und Transportieren von Fahrzeugen ist<br/>
				  nur dann erlaubt wenn man sich mit dem<br/>
				  Eigentümer in einer aktiven RP Situation befindet.<br/>
				  Ebenfalls gilt in Safezonen ein Ladeverbot.<br/><br/>
				  
				- Das unerlaubte Einsteigen in gerade gespawnte Fahrzeuge und <br/>
				  in gerade geöffnete Fahrzeuge <br/>
				  ist verboten und wird geahndet.<br/><br/>
				  
				- Das Überfliegen (auch Hovern) von Safezonen ist nur in <br/>
				  einer Höhe von mindestens 250 Metern<br/>
				  erlaubt. <br/>
				  Ausnahme: Polizei, Sanitäter, ALAC.<br/><br/>
				  
				- Das Überfliegen des Zentralbankgebietes ist verboten<br/>
				  und wird von der Polizei direkt als Straftat<br/>
				  angesehen.<br/><br/>
				
				- Blockieren von Fahrzeug Spawnpunkten ist zu<br/>
				  unterlassen.<br/>
				  Straßensperren mit Fahrzeugen sind nur<br/>
				  mit RP Hintergrund erlaubt.<br/><br/>
				
				- Zugriff auf Häuser und I-Inventar ist verboten.<br/>
				  Ausnahme Polizei.<br/><br/>
				
				-  Das aufsammeln von Waffen getöteter Personen ist erlaubt so lange sie greifbar sind, jedoch nicht die Inventargegenständen(z.b Klamotten).<br/><br/><br/><br/>
				
				
				
				- Sanitäter und Mitarbeiter des ADAC sind <br/>
				  UNANTASTBAR und dürfen nicht als Ziel <br/>
				  für Entführung,<br/>
				  Erpressung und Anschläge missbraucht werden.<br/><br/>
				  
				  Außerdem dürfen Medics NICHT gegen ihren <br/>
				  Willen festgehalten werden,es steht <br/>
				  JEDEM Medic jederzeit FREI zu gehen, <br/>				  
				  es sei denn, es sind noch Menschenleben in <br/>
				  Gefahr(Außnahme siehe DRK-Regel 2).<br/><br/>
				  
				  Der Beschuss auf einen Medic ist ausdrücklich untersagt<br/>
				  es sei denn der Medic begibt sich trotz Warnung<br/>
				  (Schriftlich bzw. Verbal) in ein Feuergefecht.<br/><br/>
				  
				  Dies gilt ebenfalls für ihre Fahrzeuge. <br/>
				  Ebenfalls verboten ist jedliche Physische <br/>
				  Gewalteinwirkung gegenüber einem Medic <br/>
				  (Z.b. das Niederschlagen eines Medics)<br/><br/>
				  
				  Die Fahrzeuge eines Medic sind genauso Unantastbar wie <br/>
				  der Medic selber. D.h. die Fahrzeuge eines Medics dürfen <br/>
				  NICHT Geklaut bzw. beschädigt oder beschossen werden.<br/><br/><br/><br/>
				  
				  
				  
				- Während eines Banküberfalls ist es nicht erlaubt<br/>
				  irgendwo anders eine Geiselnahme durchzuführen. <br/>
				  Alle anderen Straftaten sind erlaubt.<br/><br/>
				  
				- Der Beschuss auf weiche Ziele (Personen) ist mit dem<br/>
				  Rebellen Offroader bewaffnet nicht erlaubt.<br/><br/>
				
				- Bei Geiselnahmen ist darauf zu achten das die <br/>
				  Forderungen realistisch an das RP angepasst sind.<br/><br/>
				
				- Übernahmen von Städten sind generell vorher bei der <br/>
				  Polizei anzukündigen. <br/>
				  Wenn mehrere Gangs daran beteiligt sind <br/>
				  ist von jeder Gang separat das RP zu eröffnen.<br/><br/>
				  
				- Wenn es unausweichliche Streitereien oder<br/>
				  Unstimmigkeiten gibt ist es Hilfreich den<br/>
				  Support oder einen Admin dazu zu <br/>
				  bitten.<br/><br/>
		
				"
		]
	];	

	
		player createDiaryRecord ["serverrules",
		[
			"Waffen", 
				"
				<br/>								
				Alle Waffen und Anbauteile die nicht im Waffenladen<br/>
				erhältlich sind, sind illegal.<br/><br/>
				
				Polizeiwaffen in Besitz von Zivilisten und Rebellen sind <br/>
				ebenfalls illegal.<br/><br/>
				
				Die Polizei ist befugt diese Waffen zu beschlagnahmen.<br/><br/>
				
				Dabei spielt es keine Rolle ob die Person die<br/>
				die Waffe trägt lebt oder gestorben ist.<br/><br/>		
		
				"
		]
	];	
	
		player createDiaryRecord ["serverrules",
		[
			"Rebellen", 
				"
				<br/>								
				Als Rebele gilt man wenn man im Besitz eines Items des<br/>
				Rebellenshop + Waffe Rebellenshop + Alle Klamotten<br/>
				aus dem Rebellenshop ist.<br/><br/>

				In dieser Kombination gilt man als illegale Person und <br/>
				der Aufenthalt in Safezonen stellt eine Straftat da.<br/><br/>
				
				Es ist nicht erlaubt, bei einer Verfolgungsjagt in einen<br/>
				Rebellenstützpunkt zu flüchten, <br/>
				um sich neu auszurüsten oder Fahrzeuge spawnen<br/>
				zu lassen.<br/><br/>
				
				Der Rebellenstützpunkt darf gegen eindringen durch die<br/>
				Polizei mit Waffengewalt verteidigt werden.<br/><br/>			
				"
		]
	];	
	
	player createDiaryRecord ["serverrules",
		[
			"Safezonen (SZ)", 
				"
				<br/>								
				Als Safezone sind folgende Orte definiert:<br/><br/>
				
				Städte: Kavala, Pyrgos, Athira, Sofia<br/>
				Geldautomaten<br/>
				Fahrzeughändler<br/>
				Polizei HQ und Stationen<br/>
				öffentliche Garagen<br/><br/>
				
				In einer Safezone haben Waffen stets geholstert oder im<br/>
				Rucksack verstaut zu sein. Ausnahme Polizei.<br/><br/>
				
				Es ist verboten in einer Safezone Fahrzeuge zu stehlen,<br/>
				Niederschlagen / Ausrauben von Spielern, Beschuss von <br/>
				außerhalb, das offene tragen von illegalen Waffen.<br/><br/>
				
				Es ist möglich die Wirkung einer Safezone aufzuheben. <br/>
				Dies erfolgt wenn eine Verfolgung durch die Polizei <br/>
				stattfindet.<br/><br/>
				
				RP Interaktionen außerhalb beginnen und sich in eine<br/>
				Safezone verlagern oder Handlungsbedingt erforderlich<br/>
				sind.<br/><br/>
				
				Air-Dropmission und Quarantänezone gelten als RDM Zonen.<br/>
				Hier ist der Beschuss ohne vorherige Ankündigung erlaubt.<br/><br/>
				
				Kavala ist aus dieser Regel ausgenommen, hier besteht<br/>
				eine permanente Safezone.<br/><br/>
								
				"
		]
	];	

	
	player createDiaryRecord ["serverrules",
		[
			"New Life", 
				"
				<br/>								
				Die New Life Regel tritt in Kraft wenn nach einem Tod<br/>
				respawnt wird, sollte man durch einen Sanitäter<br/>
				wiederbelebt werden gilt New Life nicht.<br/><br/>
				
				Nach dem Tod und respawn, darf man sich nicht mehr an<br/>
				den Ort des Geschehens oder in die dazu führende<br/>
				Situation begeben.<br/><br/>
				
				Für Straftaten in einem früheren Leben darf ein Spieler<br/>
				nicht belangt werden.<br/><br/>
				
				Sollte ein Spieler durch VDM, Selbstmord,<br/>
				spielmechanische Fehler oder<br/>
				Serverrestart sterben gilt New Life nicht.<br/><br/>			
				"
		]
	];	
	
	player createDiaryRecord ["serverrules",
		[
			"Kommunikation", 
				"
				<br/>								
				Spamming, persönliche Beleidigungen, rassistische<br/>
				Äußerungen sowie destruktive Kommunikation, <br/>
				sind im Ingame Chat und per SMS als auch im<br/>
				TS generell untersagt.<br/><br/>
				
				Im Side Chat ist das sprechen oder abspielen von Musik<br/>
				nicht erlaubt.<br/><br/>			
								
				"
		]
	];	
	
		player createDiaryRecord ["serverrules",
		[
			"Admins / Support und Erstattungen", 
				"
				<br/>								
				Ein Admin/Support ist ein Vorgesetzter, der in keinerlei<br/>
				Hinsicht bei einem Support-Gespräch als Spieler fungiert.<br/><br/>
				
				Ein Admin/Support ist nicht verpflichtet etwas zurück zu<br/>
				erstatten, er kann dies allerdings tun, wenn der<br/>
				Sachverhalt es hergibt. <br/><br/>
				
				Bei Beweisvideos erhöht sich die Chance einer<br/>
				Rückerstattung. <br/><br/>
				
				Bei einem erlogenen Sachverhalt kann der Admin/Support<br/>
				einen Ban und/oder auch eine entsprechende Strafe  <br/>
				verhängen <br/><br/>
				
				Der Autosave kann für nichts verantwortlich gemacht<br/>
				werden. <br/><br/>		
					
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Handlungen die zum Ban führen", 
				"
				<br/>								
				1. Cheats / Hacks führen zu einem permanenten Ban<br/><br/>
				
				    - Jegliche Form von Betrug im Spiel durch das<br/>
					  Ausnutzen von fehlerhafter Spielmechanik oder<br/>
					  durch Cheats und Hacks und daraus<br/>
					  hervorgehende Objekte, Fahrzeugen oder Geld.<br/><br/>				  
	
				2. Random Deathmatch (RDM) das erste Mal = 24 Stunden<br/>
				    Ban, mehrfach permanent Ban<br/>				
			    	- Beschuss von Fahrzeugen und erschießen von<br/>
					  Spielern ohne RP Hintergrund <br/><br/>								
								
				3. Vehicle Deathmatch (VDM) das erste Mal = 24 Stunden<br/>
				    Ban, mehrfach permanent Ban<br/>				
				    - Anfahren oder Überfahren von Spielern<br/><br/>

				4. Trolling = 24 Stunden Ban<br/><br/>				
				
				5. Mehrfacher Kick vom Server führt zu einem<br/>
				    permanent Ban.<br/><br/><br/>	
				
								
				Des Weiteren ist es verboten aus Fahrzeugen zu<br/>
				verkaufen oder zu verarbeiten.<br/><br/>
				
				Lobbyhopping um sich schnellstmöglich auf der Karte zu<br/>
				bewegen und schlechtes RP oder die Flucht aus<br/>
				RP Situationen werden mit Konsequenzen<br/>
				geahndet.<br/><br/>
				
				Generell sollte Spielern immer genug Zeit gegeben werden<br/>
				um auf RP zu reagieren.<br/><br/>
				
				"
		]
	];
	
	
	player createDiaryRecord ["serverrules",
		[
			"Vorwort", 
				"
				<br/>								
				Um auf unserem Server zu spielen ist es wichtig, dass<br/>
				euch das Roleplay (RP) genauso am Herzen<br/>
				liegt wie uns.<br/><br/>
				
				Um euch einen höchstmöglichen Spaß am Leben und<br/>
				spielen auf Altis zu bieten, ist es erforderlich<br/>
				das sich jeder an die	Regeln auf unserem<br/>
				Server hält. <br/><br/>			
								
				"
		]
	];
	
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Fahrzeuge",
				"
				Die folgenden Fahrzeuge sind nicht erlaubt und werden bei einer Kontrolle sofort beschlagnahmt.<br/><br/>

				1. Ifrit<br/>
				2. Hunter<br/>
				3. Speedboot<br/>
				4. Polizei Offroad<br/>
				5. Strider<br/>
				6. Hummingbird camouflage<br/>
				7. Orca camouflage<br/>
				8. Mohawk camouflage<br/>
				9. Taru Bank<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegale Waffen",
				"
				Die folgenden Waffen sind für Zivilisten nicht erlaubt zu tragen und werden bei einer Kontrolle sofort beschlagnahmt.<br/><br/>

					Alle beim Rebellen Shop erhältlichen Waffen ..<br/>

				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegales",
				"
				Die folgenden Sachen sind Illegal:<br/><br/>
				1. Schildkröten<br/>
				2. Kokain<br/>
				3. Heroin<br/>
				4. Cannabis<br/>
				5. Marihuana<br/>
				6. Meth<br/>
				7. LSD<br/>
				8. Goldmünzen + Silbermünzen<br/>
				9. Dietriche<br/>
				10. Bolzenschneider<br/>			
				11. Schranken Fernbedienung<br/>
				12. Destille<br/>
				13. Moonshine<br/><br/>
				"
		]
	];


	player createDiaryRecord ["buss",
		[
			"1 - Bußgeldkatalog",
				"
				Bußgeldkatalog<br/><br/>
			
				
Fahren o.Führerschein PKW<br/>: 1.0000 $<br/><br/>
Fahren o.Führerschein LKW<br/>: 15.000 $<br/><br/>
Paren im Parkverbot<br/>: 5.000  $<br/><br/>
Fahren o. Licht<br/>: 5.000  $<br/><br/>
Ständiges Hupen<br/>: 10.000 $<br/><br/>
Tempolimit ueberschritten<br/>: 5000  $<br/><br/>
Unfallverursachung<br/>: 25.000 $<br/><br/>
Gefährliche Fahrweise<br/>: 25.000 $<br/><br/>
Gefährliche Fahrw. m. Todesf.<br/>: 50.000 $<br/><br/>

Fahrerflucht<br/>: 50.000 $<br/><br/><br/>
Fliegen ohne Fluglizenz<br/>: 20.000 $<br/><br/>
Landen  ohne Landeerlaubnis<br/>: 10.000 $<br/><br/>
Fliegen o. Licht u. Kollisonslichter<br/>: 10.000 $<br/><br/>
Nicht Einh. d. Mindestflughöhe<br/>: 20.000 $<br/><br/>
Unfallverursachung Luft<br/>: 30.000 $<br/><br/>
Gefährliche Flugweise<br/>: 30.000 $<br/><br/>
Gefährliche Flugw. m. Todesf.<br/>: 60.000 $<br/><br/>
Unfallflucht Luft<br/>: 60.000 $<br/><br/><br/>
Fahren ohne Bootsschein<br/>: 10.000 $<br/><br/>
Unfallverursachung Wasser<br/>: 25.000 $<br/><br/>
Gefährliche Fahrweise Wasser<br/>: 20.000 $<br/><br/>
Gefährliche Fahrw. m. Todesf. Wasser<br/>: 50.000 $<br/><br/>
Unfallflucht Wasser<br/>: 10.000 $<br/><br/><br/>
Führen o. besitzen e. Waffe o. Lizenz<br/>: 20.000 $<br/><br/>
offenes tragen von Waffen in Städten<br/>: 50.000 $<br/><br/>
Besitz v. Illeg. Waffen u. ihre Anbauteilen<br/>: 100.000 $<br/><br/>
Nutzen e. Waffe in Stadt/Savezone<br/>: 150.000 $<br/><br/>
Verstecken einer Illegalen Waffe<br/>: 50.000 $<br/><br/>
Kein Personalausweis<br/>: 100 $<br/><br/>
Fahren/Fliegen von Illegalen Fahrzeugen<br/>: 50.000 $<br/><br/>
Flucht vor Polizei<br/>: 45.000 $<br/><br/>
Erregung öffentliches Ärgernisses<br/>: 10.000 $<br/><br/>
Konsum von Drogen<br/>: 15.000 $<br/><br/>
Besitz von Drogen / Illegalen Gegenständen<br/>: 50.000 $<br/><br/>
Handel mit Drogen / Illegalen Gegenständen<br/>: 100.000 $<br/><br/>
Betreten von polizeilichen Sperrzonen<br/>: 25.000 $<br/><br/>
Nicht befolgen polizeil. Anordnungen<br/>: 15.000 $<br/><br/>
Wiederstand gegen die Staatsgewalt<br/>: 30.000 $<br/><br/>
Beschuss auf Fahrzeuge<br/>: 25.000 $<br/><br/>
Beschuss auf weiche Ziele<br/>: 50.000 $<br/><br/>
Bestechung eines BOS<br/>: 25.000 $<br/><br/>
Beihilfe zur Straftat<br/>: 10.000 $<br/><br/>
Amtsanmaßung<br/>: 15.000 $<br/><br/>
Beschädigung o. Zerstörung fremden Eigentums<br/>: 5.000 $<br/><br/>
Beleidigung<br/>: 25.000 $<br/><br/>
Fahrzeugdiebstahl bzw. Versuchter<br/>: 15.000 $<br/><br/>
Androhung von Gewalt<br/>: 25.000 $<br/><br/>
Bewaffnet.Raubüberfall<br/>: 100.000 $<br/><br/>
Entführung<br/>: 100.000 $<br/><br/>
Tankstellenraub<br/>: 100.000 $<br/><br/>
Bankraub<br/>: 100.000 $<br/><br/>
Tötung aus Notwehr<br/>: 50.000 $<br/><br/>
Fahrl. Tötung<br/>: 150.000 $<br/><br/>
Vers. Mord<br/>: 125.000 $<br/><br/>
Mord<br/>: 250.000 $<br/><br/>
				"
			]
		];

	player createDiaryRecord ["buss",
		[
			"Allgemeines",
				"
				Allgemeines<br/><br/>
				
				Hier werden die Bußgelder aufgeführt. Es entscheidet immer der Beamte der vor einem steht ob die Strafe im vollen Umfang gegeben wird.<br/>
				"
			]
		];
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Z          : Spieler Menü<br/>
				U          : Autos auf, und zu schliessen<br/>
				F          : Martinshorn (Cops)<br/>
				T          : Kofferraum<br/>
				L Shift + R: Festnehmen (Cops, Civs)<br/>
				O          : Schranken öffnen<br/>
				L Shift + G: K.O. Schlagen (Civs)<br/>
				L Windows  : Farmen, Fahrzeug Interaktionen, Haus Interaktionen, bei gefesselten Personen ausrauben<br/>
				L Shift + L: Blaulicht (Cops , LRK, ALAC).<br/>
				L Shift + H: Waffe holstern<br/>
				H          : Liga Handy öffnen<br/>
				L ALT + H  : kleine Handy unten rechts ausblenden<br/>
				Shift + P  : Gehörschutz<br/>
				"
		]
	];