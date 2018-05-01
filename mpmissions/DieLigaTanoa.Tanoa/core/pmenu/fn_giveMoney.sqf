#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];

if(liga_lock)exitWith {};

_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) isEqualTo -1) exitWith {hint "Du hast keine Person ausgewaehlt";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit isEqualTo player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "Du bist dabei die Bank auszurauben. Du kanns jetzt kein ATM benutzen !";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Du hast keine Zahl eingegeben!!";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "Du musst einen Betrag eingeben!";ctrlShow[2001,true];};
if(parseNumber(_amount) > CASH) exitWith {hint "Du hast nicht so viel Geld !!!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "Die ausgewaehlte Person ist nicht in der naehe !!";};
liga_lock = true;
hint format["Du hast %2 $%1 gegeben",[(parseNumber(_amount))] call life_fnc_numberText,_unit GVAR["realname",name _unit]];
CASH = CASH - (parseNumber(_amount));
[]spawn 
{
	uiSleep 3;
	liga_lock = false;
};
[0] call SOCK_fnc_updatePartial;
[_unit,_amount,player] remoteExecCall ["life_fnc_receiveMoney",_unit];
_log = [player, _unit, _amount, 1, BANK, CASH];
LOG_to_HC(0,_log);
[] call life_fnc_p_updateMenu;
ctrlShow[2001,true];