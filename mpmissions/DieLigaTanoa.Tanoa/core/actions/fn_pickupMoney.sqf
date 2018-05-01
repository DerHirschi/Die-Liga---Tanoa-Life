#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money
*/
/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money

if((time - life_action_delay) < 1.5) exitWith {
	hint "You can't rapidly use action keys!";
	if(!isNil {(SEL(_this,0)) GVAR "inUse"}) then {
		SEL(_this,0) SVAR["inUse",false,true];
	};
};
private["_obj","_val"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_val = (_obj GVAR "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj SVAR["inUse",false,true];};};
if((_obj GVAR["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
_obj SVAR["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;}; //VAL>20mil->100k
		case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_val] call life_fnc_numberText],"PLAIN"];
	ADD(CASH,_val);
	_log = [player, player, _val, 3, BANK, CASH];
	LOG_to_HC(0,_log);
	life_action_delay = time;
};
*/
private "_value";
if((time - life_action_delay) < 1.5) exitWith {hint localize "STR_NOTF_ActionDelay"; _this SVAR ["inUse",false,true];};
if(isNull _this OR {player distance _this > 3}) exitWith {_this SVAR ["inUse",false,true];};

_value = SEL((_this GVAR "item"),1);
if(!isNil "_value") exitWith {
	deleteVehicle _this;
	
	switch (true) do {
		case (_value > 20000000) : {_value = 100000;}; //VAL>20mil->100k
		case (_value > 5000000) : {_value = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playMove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_value] call life_fnc_numberText],"PLAIN"];
	ADD(CASH,_value);
	_log = [player, player, _value, 3, BANK, CASH];
	LOG_to_HC(0,_log);
	life_action_delay = time;
};