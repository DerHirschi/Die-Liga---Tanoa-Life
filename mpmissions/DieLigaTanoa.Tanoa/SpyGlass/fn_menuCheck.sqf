#include "..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks for known cheat menus and closes them then reports them to the server.
*/
private["_displays","_dispVal","_detection","_display","_timeStamp"];
disableSerialization;
#define SKY_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "SkyNetFLT" >> SETTING)

_dispVal = SKY_SETTINGS(getArray,"DISPL_Vali");
_displays = SKY_SETTINGS(getArray,"DISPL_BL");

_detection = false;
_timeStamp = time;
while {true} do {
	{
		_targetDisplay = _x select 0;
		_targetName = _x select 1;
		switch(typeName _targetDisplay) do {
			case ("STRING"): {if(!isNull (GVAR_UINS [_targetDisplay,displayNull])) exitWith {_detection = true;};};
			default {if(!isNull (findDisplay _targetDisplay)) exitWith {_detection = true;};};
		};

		if(_detection) exitWith {
			[profileName,steamid,"Menu Hack",(format["%1     MenuBasedHack_%1",_targetName])] remoteExec ["SPY_fnc_cookieJar",RSERV];
			
			SKYNET_END
		};
	} foreach _displays;

	if(_detection) exitWith {};

	/* A very old menu that can cause false-positives so we close it */
	if(!isNull (findDisplay 129)) then {
		closeDialog 0;
	};

	/* Check to see if RscDisplayInventory has more controls then it should */
	_display = findDisplay 602;
	if(!isNull _display && {count (allControls _display) > 87}) then {
		_count = count allControls _display;
		[profileName,steamid,"Menu Hack RscDisplayInventory_Controls_",str _count,player] remoteExec ["SPY_fnc_cookieJar",RSERV];
		
		closeDialog 0;
		SKYNET_END
	};

	if(!isNull (findDisplay 148)) then {
		sleep 0.5;
		if((lbSize 104)-1 > 3) exitWith {
			[profileName,steamid,"Menu Hack MenuBasedHack_RscDisplayConfigureControllers",""] remoteExec ["SPY_fnc_cookieJar",RSERV];
			
			closeDialog 0;
			SKYNET_END
		};
	};

	_display = findDisplay 54;
	if(!isNull _display) then {
		{
			if (_x && !isNull _display) exitWith {
				[profileName,steamid,"Menu Hack MenuBasedHack_RscDisplayInsertMarker",_display] remoteExec ["SPY_fnc_cookieJar",RSERV];
				
				closeDialog 0;
				SKYNET_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1001) != toLower localize "STR_A3_RscDisplayInsertMarker_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};

	_display = findDisplay 131;
	if(!isNull _display) then {
		//These shouldn't be here...
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 102) ctrlRemoveAllEventHandlers "LBSelChanged";

		{
			if (_x && !isNull _display) exitWith {
				[profileName,steamid,"Menu Hack MenuBasedHack_RscDisplayConfigureAction",str _x] remoteExec ["SPY_fnc_cookieJar",RSERV];

				closeDialog 0;
				SKYNET_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_A3_RscDisplayConfigureAction_Title"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,104,105,106,107,108,109]
		];
	};

	_display = findDisplay 163;
	if(!isNull _display) then {
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBDblClick";
		(_display displayCtrl 101) ctrlRemoveAllEventHandlers "LBSelChanged";

		{
			if (_x && !isNull _display) exitWith {
				[profileName,steamid,"Menu Hack MenuBasedHack_RscDisplayControlSchemes",str _x] remoteExec ["SPY_fnc_cookieJar",RSERV];

				closeDialog 0;
				SKYNET_END
			};
		} forEach [
			(toLower ctrlText (_display displayCtrl 1000) != toLower localize "STR_DISP_OPTIONS_SCHEME"),
			{if (buttonAction (_display displayCtrl _x) != "") exitWith {true}; false} forEach [1,2]
		];
	};

	_display = findDisplay 316000;

	if(!(isNull _display )) exitWith {
		[profileName,steamid,"Menu Hack MenuBasedHack_RscDisplayDebugPublic",str _display] remoteExec ["SPY_fnc_cookieJar",RSERV];
		closeDialog 0;
		SKYNET_END
	};


	/*
		Display Validator
		Loops through and makes sure none of the displays were modified..

		Checks every 5 minutes.
	*/
	if((time - _timeStamp) > 300) then {
		_timeStamp = time;
		{
			_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
			_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
			if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
				[profileName,steamid,"Modified Display Method (Memory Edit)",(format["%1",_x select 0]),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
				SKYNET_END
			};
		}
		foreach _dispVal;
	};
	uiSleep 1.5;
};
