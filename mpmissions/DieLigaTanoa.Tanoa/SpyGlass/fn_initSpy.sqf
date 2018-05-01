#include "..\Liga_script_macros.hpp"
/*
	File: fn_initSpy.sqf
	Edit: Hirschi - Die Liga

	Description:
	Does some things that I made over-complicated / un-needed but blah.
	Will eventually include server-side checks but it's blah at this point.

	Will also become a standalone system which is why it's setup like this.
*/
private["_binConfigPatches","_cfgPatches","_endM"];
if(isServer && !hasInterface) exitWith {}; //Server doesn't need to know.
//if(!hasInterface) exitWith {}; //Server doesn't need to know.

#define SKY_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "SkyNetFLT" >> SETTING)
//if(steamid in SKY_SETTINGS(getArray,"WL") ) exitWith {}; //Server doesn't need to know.


//CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
//CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
//CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
//CONST(E_X_T_A_S_Y_Pro_RE,"false");
//CONST(E_X_T_A_S_Y_Car_RE,"false");
//CONST(DO_NUKE,"false");
//CONST(JxMxE_spunkveh,"false");
//CONST(JxMxE_spunkveh2,"false");
//CONST(JxMxE_spunkair,"false");
//CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
//CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
//CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
//CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

uiSleep 20;
_patchList = SKY_SETTINGS(getArray,"PATCH_List");

//uiNamespace setVariable["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
//uiNamespace setVariable["RscDisplayMultiplayer",displayNull];

_binConfigPatches = configFile >> "CfgPatches";
for "_i" from 0 to count (_binConfigPatches)-1 do {
	_patchEntry = _binConfigPatches select _i;
	if(isClass _patchEntry) then {
		if(!((configName _patchEntry) in _patchList)) exitWith {
			[profileName,steamid,"unbekannter Addon Patch",(configName _patchEntry)] remoteExec ["SPY_fnc_cookieJar",RSERV];
		
			//SKYNET_END
			uiSleep 1;
		};
	};
};

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
	"Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
	"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
	"Version","TraffLight","Feedback","MessageBox"
];

{
	if(!((configName _x) in _allowedChildren)) exitWith {
		[profileName,steamid,"Modified_MPInterrupt",(format["Devcon like executor detected %1",_x]),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
		SKYNET_END
	};
} forEach _children;

/*
	Display Validator
	Loops through and makes sure none of the displays were modified..

	TODO: Run check every x minutes and validate all displays.
*/
{
	_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
	_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
	if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
		[profileName,steamid,"Modified Display Method %1 (Memory Edit)",(str (_x select 0)),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
		SKYNET_END		
	};
}
forEach (SKY_SETTINGS(getArray,"DISPL_Vali"));

/* Forgot to include this but this is also also a popular method for "unreleased" stuff */
if(getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
	[profileName,steamid,"Modified_Functions_Init",(getText(configFile >> "CfgFunctions" >> "init")),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
	SKYNET_END			
};



//_this execVM "SpyGlass\fn_variableCheck.sqf";
//if(liga_first) then {[] execVM "SpyGlass\fn_menuCheck.sqf";};
