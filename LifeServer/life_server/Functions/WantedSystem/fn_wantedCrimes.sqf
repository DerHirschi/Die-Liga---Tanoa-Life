#include "\life_server\Liga_Macros.hpp"
/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_result = format["wantedFetchCrimes:%1",_criminal select 0];
//waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "459": {_x = "Burglary"};
		case "500": {_x = "Geblitzt"};
		case "501": {_x = "Geblitzt"};
		case "502": {_x = "Geblitzt"};
		case "503": {_x = "Geblitzt"};
		case "504": {_x = "Geblitzt"};
		case "505": {_x = "Geblitzt"};
		case "506": {_x = "Geblitzt"};
		case "507": {_x = "Geblitzt"};
		case "508": {_x = "Geblitzt"};
		case "509": {_x = "Geblitzt"};
		case "510": {_x = "Geblitzt"};
		case "511": {_x = "Geblitzt"};
		case "512": {_x = "Geblitzt"};
		case "513": {_x = "Geblitzt"};
		case "514": {_x = "Geblitzt"};
		case "515": {_x = "Geblitzt"};
		
		case "187V": {_x = "Überfahren mit Todesfolge"};
		case "187": {_x = "Mord"};
		case "901": {_x = "Gefängnisflucht"};
		case "261": {_x = "Raub"};
		case "261A": {_x = "Versuchter Raub"};
		case "215": {_x = "Versuchter Autodiebstahl"};
		case "213": {_x = "Verwenden illegaler Sprengstoff"};
		case "211": {_x = "Raub/Diebstahl"};
		case "207": {_x = "Entführung"};
		case "207A": {_x = "Versuchte Entführung"};
		case "487": {_x = "Autodiebstahl"};
		case "488": {_x = "Diebstahl"};
		case "480": {_x = "Fahrerflucht"};
		case "481": {_x = "Drogenbesitz"};
		case "482": {_x = "Versuchter Drogenhandel"};
		case "483": {_x = "Drogenhandel"};

		case "1": {_x = "K-01 Fahren o.Führerschein PKW"};
		case "2": {_x = "K-02 Fahren o.Führerschein LKW"};
		case "3": {_x = "K-03 Parkverbot"};
		case "4": {_x = "K-04 Fahren o. Licht"};
		case "5": {_x = "K-05 Ständiges Hupen"};
		case "6": {_x = "K-06 Tempolimit ueberschritten"};
		case "7": {_x = "K-07 Unfallverursacher"};
		case "8": {_x = "K-08 Gefährliche Fahrweise"};
		case "9": {_x = "K-09 Gefährliche Fahrw. m. Todesf."};
		case "10": {_x = "K-10 Fahrerflucht"};
		case "11": {_x = "L-01 Fliegen ohne Fluglizenz"};
		case "12": {_x = "L-02 Landen  ohne Landeerlaubnis"};
		case "13": {_x = "L-03 Fliegen o. Licht u. Kollisonslichter"};
		case "14": {_x = "L-04 Nicht Einh. d. Mindestflughöhe"};
		case "15": {_x = "L-05 Unfallverursacher air"};
		case "16": {_x = "L-06 Gefährliche Flugweise"};
		case "17": {_x = "L-07 Gefährliche Flugw. m. Todesf."};
		case "18": {_x = "L-08 Unfallflucht air"};
		case "19": {_x = "W-01 Fahren ohne Bootsschein"};
		case "20": {_x = "W-02 Unfallverursacher marin"};
		case "21": {_x = "W-03 Gefährliche Fahrweise marin"};
		case "22": {_x = "W-04 Gefährliche Fahrw. m. Todesf. marin"};
		case "23": {_x = "W-05 Unfallflucht marin"};
		case "24": {_x = "B-01 Führen o. besitzen e. Waffe o. Lizenz"};
		case "25": {_x = "B-02 Offenes tragen von Waffen in Städten"};
		case "26": {_x = "B-03 Besitz v. Illeg. Waffen u. ihre Anbauteilen"};
		case "27": {_x = "B-04 Nutzen e. Waffe in Stadt/Savezone"};
		case "28": {_x = "B-05 Verstecken einer Illegalen Waffe"};
		case "29": {_x = "A-01 Kein Personalausweis"};
		case "30": {_x = "A-02 Fahren/Fliegen von Illegalen Fahrzeugen"};
		case "31": {_x = "A-03 Flucht vor Polizei"};
		case "32": {_x = "A-04 Erregung öffentliches Ärgernisses"};
		case "33": {_x = "A-05 Konsum von Drogen"};
		case "34": {_x = "A-06 Besitz von Drogen / Illegalen Gegenständen"};
		case "35": {_x = "A-07 Handel mit Drogen / Illegalen Gegenständen"};
		case "36": {_x = "A-08 Betreten von polizeilichen Sperrzonen"};
		case "37": {_x = "A-09 Nicht befolgen polizeil. Anordnungen"};
		case "38": {_x = "A-10 Wiederstand gegen die Staatsgewalt"};
		case "39": {_x = "A-11 Beschuss auf Fahrzeuge"};
		case "40": {_x = "A-12 Beschuss auf weiche Ziele"};
		case "41": {_x = "A-13 Bestechung eines BOS"};
		case "42": {_x = "A-14 Beihilfe zur Straftat"};
		case "43": {_x = "A-15 Amtsanmaßung"};
		case "44": {_x = "A-16 Beschädigung bzw. Zerstörung von fremden Eigentum"};
		case "45": {_x = "A-17 Beleidigung"};
		case "46": {_x = "A-18 Fahrzeugdiebstahl bzw. Versuchter"};
		case "47": {_x = "A-19 Androhung von Gewalt"};
		case "48": {_x = "A-20 Bewaffnet.Raubüberfall"};
		case "49": {_x = "A-21 Entführung"};
		case "50": {_x = "A-22 Tankstellenraub"};
		case "51": {_x = "A-23 Bankraub"};
		case "52": {_x = "A-24 Tötung aus Notwehr"};
		case "53": {_x = "A-25 Fahrl. Tötung"};
		case "54": {_x = "A-26 Vers. Mord"};
		case "55": {_x = "A-27 Mord"};
		case "56": {_x = "A-28 Forderung Geiseln. 100k Schritte"};
		case "57": {_x = "A-29 Forderung Tankstellenraub"};
		case "58": {_x = "A-30 Entschädigungen 100k Schritte"};
		case "59": {_x = "A-31 Entschädigungen 10k Schritte"};
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then {
	["diag_log",[
		"------------- Wanted Query Request -------------",
		format["QUERY: %1",_result],
		format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)],
		format["Result: %1",_queryResult],
		"------------------------------------------------"
	]] call TON_fnc_logIt;
};


[_queryResult] remoteExec ["life_fnc_wantedInfo",_ret];
