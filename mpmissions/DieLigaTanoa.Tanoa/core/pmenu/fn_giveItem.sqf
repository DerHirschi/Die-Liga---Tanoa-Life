#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_giveItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected item & amount to the selected player and
	removes the item & amount of it from the players virtual
	inventory.
*/
private["_unit","_val"];
_val = ctrlText 2010;
ctrlShow[2002,false];
if((lbCurSel 2023) isEqualTo -1) exitWith {hint "Du hast nichts ausgewaehlt.";ctrlShow[2002,true];};
_unit = lbData [2023,lbCurSel 2023];
_unit = call compile format["%1",_unit];
if((lbCurSel 2005) isEqualTo -1) exitWith {hint "Du hast kein Gegenstand ausgewaehlt.";ctrlShow[2002,true];};
_item = lbData [2005,(lbCurSel 2005)];
if(isNil "_unit") exitWith {ctrlShow[2002,true];};
if(EQUAL(_unit,player)) exitWith {ctrlShow[2002,true];};
if(isNull _unit) exitWith {ctrlShow[2002,true];};

//A series of checks *ugh*
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "Du hast keine korrekte Zahl eingegeben !!";ctrlShow[2002,true];};
if(parseNumber(_val) <= 0) exitWith {hint "Du musst eine Zahl eingeben!!";ctrlShow[2002,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Die ausgewaehlte Person ist nicht in deiner naehe.";};
if(!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {hint "Du kannst nicht so viel weggeben. Vielleicht hast du nicht so viel ?";ctrlShow[2002,true];};

[_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];
_type = [_item,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hint format["Du hast %1 %2 %3 gegeben..",_unit GVAR["realname",name _unit],_val,_type];
[] call life_fnc_p_updateMenu;

ctrlShow[2002,true];