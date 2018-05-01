#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the invite process?
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit isEqualTo player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if(!isNil {(group _unit) GVAR "gang_name"}) exitWith {hint "This player is already in a gang"}; //Added

if(count(grpPlayer GVAR ["gang_members",8]) isEqualTo (grpPlayer GVAR ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit GVAR ["realname",name _unit]],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	
	[profileName,grpPlayer] remoteExec ["life_fnc_gangInvite",_unit];
	_members = grpPlayer GVAR "gang_members";
	_members pushBack getPlayerUID _unit;
	//grpPlayer setVariable["gang_members",_members,true];
	SVARALL(grpPlayer,"gang_members",_members);
	hint format[localize "STR_GNOTF_InviteSent",_unit GVAR["realname",name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};