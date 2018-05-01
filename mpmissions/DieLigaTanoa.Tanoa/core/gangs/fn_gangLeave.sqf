#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...

private["_grp","_grpMembers"];
if(steamid isEqualTo (grpPlayer GVAR "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer GVAR "gang_members";
_grpMembers = _grpMembers - [steamid];
//_grp setVariable["gang_members",_grpMembers,true];
SVARALL(_grp,"gang_members",_grpMembers);
[player] joinSilent (createGroup civilian);


[4,_grp] remoteExecCall ["TON_fnc_updateGang",RSERV];
closeDialog 0;

*/
private["_unitID ","_members"];
if(EQUAL(steamid,(grpPlayer GVAR "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_unitID = getPlayerUID player;
_members = grpPlayer GVAR "gang_members";
if(isNil "_members") exitWith {};
if(!(EQUAL(typeName _members,"ARRAY"))) exitWith {};

SUB(_members,[_unitID]);
grpPlayer SVAR ["gang_members",_members,true];

[player,grpPlayer] remoteExec ["TON_fnc_clientGangLeft",player];
[4,grpPlayer] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
closeDialog 0;
