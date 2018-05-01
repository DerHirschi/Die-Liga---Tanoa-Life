#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear","_quote","_ligaZitat"];
disableSerialization;

_medicsOnline 	= ((findDisplay 7300) displayCtrl 7304);
_medicsNear 	= ((findDisplay 7300) displayCtrl 7305);
_ligaZitat 		= ((findDisplay 7300) displayCtrl 7306);
if(liga_handy_kl)then{liga_handy_kl = false ; 2 cutText ["", "PLAIN"];};
	_ais_killcam_quotes = [
		[(localize "STR_QUOTE_1"),(localize "STR_AUTHOR_1")],
		[(localize "STR_QUOTE_2"),(localize "STR_AUTHOR_2")],
		[(localize "STR_QUOTE_3"),(localize "STR_AUTHOR_3")],
		[(localize "STR_QUOTE_4"),(localize "STR_AUTHOR_4")],
		[(localize "STR_QUOTE_5"),(localize "STR_AUTHOR_5")],
		[(localize "STR_QUOTE_6"),(localize "STR_AUTHOR_6")],
		[(localize "STR_QUOTE_7"),(localize "STR_AUTHOR_7")],
		[(localize "STR_QUOTE_8"),(localize "STR_AUTHOR_8")],
		[(localize "STR_QUOTE_9"),(localize "STR_AUTHOR_9")],
		[(localize "STR_QUOTE_10"),(localize "STR_AUTHOR_10")],
		[(localize "STR_QUOTE_11"),(localize "STR_AUTHOR_11")],
		[(localize "STR_QUOTE_12"),(localize "STR_AUTHOR_12")],
		[(localize "STR_QUOTE_13"),(localize "STR_AUTHOR_13")],
		[(localize "STR_QUOTE_14"),(localize "STR_AUTHOR_14")],
		[(localize "STR_QUOTE_15"),(localize "STR_AUTHOR_15")],
		[(localize "STR_QUOTE_16"),(localize "STR_AUTHOR_16")],
		[(localize "STR_QUOTE_17"),(localize "STR_AUTHOR_17")],
		[(localize "STR_QUOTE_18"),(localize "STR_AUTHOR_18")],
		[(localize "STR_QUOTE_19"),(localize "STR_AUTHOR_19")],
		[(localize "STR_QUOTE_20"),(localize "STR_AUTHOR_20")],
		[(localize "STR_QUOTE_21"),(localize "STR_AUTHOR_21")],
		[(localize "STR_QUOTE_22"),(localize "STR_AUTHOR_22")],
		[(localize "STR_QUOTE_23"),(localize "STR_AUTHOR_23")],
		[(localize "STR_QUOTE_24"),(localize "STR_AUTHOR_24")],
		[(localize "STR_QUOTE_25"),(localize "STR_AUTHOR_25")],
		[(localize "STR_QUOTE_26"),(localize "STR_AUTHOR_26")],
		[(localize "STR_QUOTE_27"),(localize "STR_AUTHOR_27")],
		[(localize "STR_QUOTE_28"),(localize "STR_AUTHOR_28")],
		[(localize "STR_QUOTE_29"),(localize "STR_AUTHOR_29")],
		[(localize "STR_QUOTE_30"),(localize "STR_AUTHOR_30")],
		[(localize "STR_QUOTE_31"),(localize "STR_AUTHOR_31")],
		[(localize "STR_QUOTE_32"),(localize "STR_AUTHOR_32")],
		[(localize "STR_QUOTE_33"),(localize "STR_AUTHOR_33")],
		[(localize "STR_QUOTE_34"),(localize "STR_AUTHOR_34")],
		[(localize "STR_QUOTE_35"),(localize "STR_AUTHOR_35")],
		[(localize "STR_QUOTE_36"),(localize "STR_AUTHOR_36")],
		[(localize "STR_QUOTE_37"),(localize "STR_AUTHOR_37")],
		[(localize "STR_QUOTE_38"),(localize "STR_AUTHOR_38")],
		[(localize "STR_QUOTE_39"),(localize "STR_AUTHOR_39")],
		[(localize "STR_QUOTE_40"),(localize "STR_AUTHOR_40")],
		[(localize "STR_QUOTE_41"),(localize "STR_AUTHOR_41")],
		[(localize "STR_QUOTE_42"),(localize "STR_AUTHOR_42")],
		[(localize "STR_QUOTE_LAST"),(localize "STR_AUTHOR_LAST")]
	];
_quote = _ais_killcam_quotes select (floor (random (count _ais_killcam_quotes)));

_author = SEL(_quote,1);
_quote = SEL(_quote,0);

_myText = format ["<t color='#ffffff'>%1</t><br/><br/><br/><t color='#ffffff'><t font='PuristaMedium'><t align='right'>%2</t></t></t>", _quote, _author];
_text = parseText  _myText;
	
_ligaZitat ctrlSetStructuredText _text;
_ligaZitat ctrlCommit 0;

waitUntil {
	_nearby = if(([independent,getPosATL player,800] call life_fnc_nearUnits)) then {"Ja"} else {"Nein"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];

	
	uisleep 1.5;
	(isNull (findDisplay 7300))
};