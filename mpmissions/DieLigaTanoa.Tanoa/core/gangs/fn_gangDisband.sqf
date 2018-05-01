#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the user about disbanding the gang and if the user accepts the gang will be
	disbanded and removed from the database.
*/
private["_action"];

_action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	_groupID = grpPlayer GVAR ["gang_id",-1];
	if(EQUAL(_groupID,-1))exitWith{hint "Fehler ...  Bitte neu einloggen..";};
	hint localize "STR_GNOTF_DisbandGangPro";
	[grpPlayer,_groupID] remoteExec ["TON_fnc_removeGang",RSERV];
	
} else {
	hint localize "STR_GNOTF_DisbandGangCanc";
};