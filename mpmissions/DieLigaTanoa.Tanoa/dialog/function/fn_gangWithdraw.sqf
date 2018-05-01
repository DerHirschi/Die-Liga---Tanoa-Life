#include "..\..\Liga_script_macros.hpp"
#define TEXTGANG "Sie haben $%1 von Ihrem Gangkonto abgehoben"
/*
	Author: Backer
	
	Description:
	Geld vom Gangkonto abheben
*/
private["_value"];
_value = parseNumber(ctrlText 2702);
_gFund = grpPlayer GVAR ["gang_bank",0];

if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > _gFund) exitWith {hint "Sie haben nicht genug Geld am Gang Konto!"};
if(_value < 100 && _gFund > 20000000) exitWith {hint "Sie koennen nicht weniger als $100 abheben"};


ADD(BANK,_value);
SUB(_gFund,_value);

//grpPlayer SVAR ["gang_bank",_gFund,true];
SVARALL(grpPlayer,"gang_bank",_gFund);

_log = [player, player, -_gFund, 7, BANK, CASH];
LOG_to_HC(0,_log);
hint format[TEXTGANG,[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[1,grpPlayer] remoteExecCall ["TON_fnc_updateGang",RSERV];
