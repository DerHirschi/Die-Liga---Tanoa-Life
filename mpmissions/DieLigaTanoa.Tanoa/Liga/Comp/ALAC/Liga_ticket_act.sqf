/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {hint "Fehlerbeim erstellen des Dialoges"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
ctrlSetText[2651,format["schreibe Rechnung an: %1",(_unit getVariable["realname",name _unit])]];
ctrlSetText[2653,"stelle Rechnung"];
life_ticket_unit = _unit;