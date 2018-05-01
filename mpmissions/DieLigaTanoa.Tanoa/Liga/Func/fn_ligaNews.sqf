/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║	File: fn_ligaNews.sqf
║	Author: alleskapot
║ Editet by : Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/
private["_display","_mode","_msg"];
disableSerialization;
_mode = [_this,0,7,[7]] call BIS_fnc_param;
_msg =  [_this, 1, ""] call BIS_fnc_param;

 
switch (_mode) do {
	case 0: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='4.5' color='#FFFFFF' image='icons\Lnews\wracks.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>","Goldtransport vor der Küste gesunken!!! Suchgebiet wurde veröffentlicht!!!"]] spawn BIS_fnc_AAN;sleep 13;};   // Schiffswrack
	case 1: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='3.3' color='#FFFFFF' image='icons\Lnews\heli.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>","Warlord entsendet Waffen für die Rebellen!!! Die Abwurfzone wird noch bekannt gegeben!!!"]] spawn BIS_fnc_AAN;sleep 13;};	// Airdrop
	case 3: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='3.3' color='#FFFFFF' image='icons\Lnews\heli.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>","Ankunft der Waffenlieferung: 5 Minuten!!!"]] spawn BIS_fnc_AAN;sleep 13;};	// Airdrop
	case 4: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='3.3' color='#FFFFFF' image='icons\Lnews\heli.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>","Die Waffenkiste wurde abgeworfen! In 20 Minuten zerstört sie sich selbst !!!"]] spawn BIS_fnc_AAN;sleep 13;};	// Airdrop
/*EVENT*/	//case 5: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='5' color='#ff0000' image='icons\money.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_msg]] spawn BIS_fnc_AAN;};	// Event
/*ADMIN*/ //	case 6: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='5' color='#ff0000' image='icons\money.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_msg]] spawn BIS_fnc_AAN;};	// Event
	/*USER*/ 	
	case 7: {[parseText format["<t size='2'>Die Liga - Nachricht </t>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_msg]] spawn BIS_fnc_AAN; sleep 40;};	// Event
	/*WH Dump*/
	case 8: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='3.3' color='#FFFFFF' image='icons\money.paa'/>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>","Das Warenhaus ist überfüllt!!! Um Lagerkapazitäten zu schaffen wird in kürze das Exportschiff ablegen."]] spawn BIS_fnc_AAN;sleep 13;};
	/*Lotto*/
	case 9: {[parseText format["<t size='2'>Die Liga - Nachricht </t><img size='3.3' color='#FFFFFF' image='icons\Lnews\lotto_news_55.paa'/>"],(parseText format["<t size='1.2'>%1 - %1 - %1</t>",(format["Lottoziehung... Die heutigen Gewinnzahlen lauten: %1, %2, %3, %4, %5 ... Diese Angaben sind wie immer ohne Gewähr.",(_msg select 0),(_msg select 1),(_msg select 2),(_msg select 3),(_msg select 4)  ])])] spawn BIS_fnc_AAN;sleep 26;};

	default {[parseText format["<t size='2'>Die Liga - Nachricht </t>"],parseText format["<t size='1.2'>%1 - %1 - %1</t>",_msg]] spawn BIS_fnc_AAN; sleep 40;};	// Event

	};
_display = uinamespace getvariable "BIS_AAN";
_display closeDisplay 0; 