#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_bankTransfer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out again.
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) isEqualTo -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

if (supp_atm) exitWith { 
	if(__GETC__(life_adminlevel) < 2) exitWith{supp_atm = false;}; 
	supp_atm = false;
	_flag = _unit GVAR["Sname",name _unit];
	_log = [profileName,getPlayerUID player,_val,"" ,getPlayerUID _unit, name _unit,_flag ,"ATM",profileNameSteam];
	LOG_to_HC(1,_log);
	[_val,profileName] remoteExecCall ["TON_fnc_clientWireTransfer",_unit];
	
	_var = [player, _unit, _val, 0, BANK, CASH];
	LOG_to_HC(0,_var);
};


if(_val > BANK) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = round(_val / 15);
if((_val + _tax) > BANK) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

BANK = BANK - (_val + _tax);
[_val,profileName] remoteExecCall ["TON_fnc_clientWireTransfer",_unit];

_var = [player, _unit, _val, 0, BANK, CASH];
LOG_to_HC(0,_var);

[] call life_fnc_atmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
[1] call SOCK_fnc_updatePartial;