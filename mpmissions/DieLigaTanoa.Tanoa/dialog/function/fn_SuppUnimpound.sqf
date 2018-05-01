#include "..\..\Liga_script_macros.hpp"
#define TEXTHINT "Fahrzeug wurde wieder zurueckgestellt.... Das hast du gut gemacht..."
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
if(__GETC__(life_adminlevel) < 3) exitWith{}; 
private["_vehicle","_vid","_pid"];

disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};

_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];


if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(__GETC__(life_adminlevel) < 3) exitWith{}; 
[_vid,ad_targ_uni,player,getPlayerUID ad_targ_uni] remoteExec ["TON_fnc_SuppVehBack",RSERV];

_flag = ad_targ_uni getVariable["Sname",name ad_targ_uni];
_log = [profileName,getPlayerUID player,_vehicle,_vid ,getPlayerUID ad_targ_uni, name ad_targ_uni,_flag ,"Fahrzeug",profileNameSteam];
LOG_to_HC(1,_log);

hint TEXTHINT;
