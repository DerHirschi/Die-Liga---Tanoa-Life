#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_inv","_val","_var","_robber"];
params [
	["_cop",objNull,[objNull]]
];
if(isNull _cop) exitWith {};

_inv = [];
_robber = false;

//Illegal items
{
	_var = [SEL(_x,0),0] call life_fnc_varHandle;
	_val = GVAR_MNS _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(SEL(_x,0)),_val] call life_fnc_handleInv;
	};
} foreach life_illegal_items;

if(!life_use_atm) then  {
	CASH = 0;
	_robber = true;
};

[player,_inv,_robber] remoteExec ["life_fnc_copSearch",_cop];
