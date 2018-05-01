#include "..\Liga_script_macros.hpp"
/*
    File: clientValidator.sqf
    Author:
	Edit: Hirscih - Die Liga
	
	
    Description:
    Loops through a list of variables and checks whether
    or not they are defined, if they are defined then trigger
    spyglass and kick the client to the lobby.
*/
#define SKY_SETTINGS getArray(missionConfigFile >> "SkyNetFLT" >> "CLIENT_Vali")
{
    if (!isNil {(GVAR_MNS _x)}) exitWith {
		[profileName,steamid,"Variable bereits gesetzt",format["VariableSetBeforeInitialized_%1",_x]] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
		sleep 0.5;
        failMission "SpyGlass";
    };
} forEach SKY_SETTINGS;