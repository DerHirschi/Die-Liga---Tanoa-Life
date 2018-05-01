#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tells the player that the gang is created and throws him into it.
*/
private["_group"];
life_action_gangInUse = nil;

if(BANK < (__GETC__(life_gangPrice))) exitWith {
	hint format[localize "STR_GNOTF_NotEnoughMoney",[((__GETC__(life_gangPrice))-life_atmcash)] call life_fnc_numberText];
	{
		//grpPlayer SVAR [_x,nil,true];
		SVARALL(grpPlayer,_x,nil);
	} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

SUB(BANK,(__GETC__(life_gangPrice)));

hint format[localize "STR_GNOTF_CreateSuccess",(group player) GVAR "gang_name",[(__GETC__(life_gangPrice))] call life_fnc_numberText];