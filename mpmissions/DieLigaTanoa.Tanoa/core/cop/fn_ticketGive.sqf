#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if (EQUAL(side player,west) || liga_cop_on) exitWith {
	if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
	if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
	_val = ctrlText 2652;
	if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
	if((parseNumber _val) > 200000) exitWith {hint localize "STR_Cop_TicketOver100"};
	[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit GVAR ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];

	closeDialog 0;
};

if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint "Keine Person gefunden der Rechnung gestellt werden kann.."};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "STR_Cop_TicketNum"};
if((parseNumber _val) > 200000) exitWith {hint "Du kannst keine Rechnungen ueber 200.000 $ stellen .."};

[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
