#include "..\..\..\Liga_script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_cash < life_ticket_val) exitWith
{
	if(life_atmcash < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,"Du hast nicht genug Geld dabei, um die Rechnung bezahlen zu können.",true,[profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
		closeDialog 0;
	};
	hint format["Du hast die Rechnung von $%1 bezahlt",[life_ticket_val] call life_fnc_numberText];
	life_atmcash = life_atmcash - life_ticket_val;
	life_ticket_paid = true;	
	[1,"%1 hat die Rechnung bezahlt.",true,[profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];

	
	[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
	closeDialog 0;
};

life_cash = life_cash - life_ticket_val;
life_ticket_paid = true;


closeDialog 0;
hint "Danke fur die prompte Bezahlung.. Beehren sie uns bald wieder .. ";
[1,"%1 hat die Rechnung bezahlt.",true,[profileName]] remoteExec ["life_fnc_broadcast",life_ticket_cop];
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
