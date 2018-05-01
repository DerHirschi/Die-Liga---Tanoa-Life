#include "..\..\Liga_script_macros.hpp"
/*
	Author	: RyanTT
	Quelle	: native-network.net
	Edit	: Hirschi - Die Liga
*/

disableSerialization;
_dialog = findDisplay 15000;
_myListbox = _dialog displayCtrl 15001;
_myAmount = _dialog displayCtrl 15002;

_tochangePriceText = ctrlText _myAmount;
_tochangePriceNumber = parseNumber _tochangePriceText;

if (_tochangePriceText=="") exitWith {hint parseText "<t color='#FF0000'>--ERROR--</t><br/><t color='#FF0000'>INVALID INPUT</t>";};
if (lbCurSel _myListbox < 0) exitWith {hint "Bitte waehle ein Item";};
_classname = _myListbox lbData (lbCurSel _myListbox);
_price = floor(_tochangePriceNumber);

if (_price < 1) exitWith {hint "Invalid value"};
/* OH Je  ...... */
/*
	if (isNil {profileNamespace getVariable "listings"}) then {profileNamespace setVariable ["listings",[]];};
	_currentListings = profileNamespace getVariable "listings";
	_currentListings pushBack [getPlayerUID player,_classname,_price];
	profileNamespace setVariable ["listings",_currentListings];
*/

//systemChat format ["%1",[getPlayerUID player,_classname,_price]];

[getPlayerUID player,_classname,_price]remoteExecCall ["LIGA_fnc_SAH_addOffer",HC_id];

hint parseText format
[	"Angebot erstellt:<br/><br/>
	<t color='#FF0000'>%1</t> für<br/>
	<t color='#228B22'>%3%2</t>",
	([_classname] call life_fnc_fetchCfgDetails select 1),_price,"$"
];

[_classname,false] spawn life_fnc_handleItem;

closeDialog 0;

