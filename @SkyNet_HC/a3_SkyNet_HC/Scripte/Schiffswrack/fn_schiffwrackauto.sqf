#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/
SYSLOG(SKYID,"SCRIPT STATUS","Schiffswrack gestartet",COUNT_SQF,diag_fps);

//schiffsw_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw_F"];

//########################## CONFIGURATION ##########################

//schiffsw_chance = 100;
//_schiffsw_positions = [[4462.89,6515.78,-2.19486],[5391.75,25136.2,-1.98308],[25323.2,27886.6,-2.15125],[27923.2,08086.6,-2.15125],[02623.2,02686.6,-2.15125],[03423.2,28486.6,-2.15125],[18423.2,28686.6,-2.15125],[29423.2,30086.6,-2.15125],[13523.2,10886.6,-2.15125]];
_schiffsw_positions = [[20953.89,7365.78,0]];
_schiffsw_time_interval = [1,1]; //Time given in hours, this is the interval in which the shipwreck should take spawn
_schiffsw_loot_array = [["gl",18],["gl",40],["gl",47],["gl",58],["gl",58],["gl",77],["gl",78],["gl",100],["gl",125],["gl",125],["gl",142],["gl",182]];
_schiffsw_loot_amount = 1;

//######################## CONFIGURATION END ########################

// Do not modify the following code

_schiffsw_time_min = _schiffsw_time_interval select 0;
_schiffsw_time_max = _schiffsw_time_interval select 1;
_schiffsw_time_min = _schiffsw_time_min*15;
_schiffsw_time_max = _schiffsw_time_max*25;

if (_schiffsw_time_min>=_schiffsw_time_max OR count _schiffsw_loot_array < _schiffsw_loot_amount) exitWith {/*schiffsw_enable=false;*/};
//schiffsw_enable=true;

uiSleep 60 ;

//if (!schiffsw_enable) exitWith {};

//_chance = floor(random 100);
//if (_chance>schiffsw_chance) exitWith {};
_toWait = (random (_schiffsw_time_max - _schiffsw_time_min)) + _schiffsw_time_min;
//sleep _toWait;

// schiffsw STARTEN
//[[0,""],"life_fnc_ligaNews",true,false] call SKY_fnc_MPall;
[0,""] remoteExec ["life_fnc_ligaNews",RCLIENT];
_poses = count _schiffsw_positions;
_inArr = floor(random _poses);
_dest = SEL(_schiffsw_positions,_inArr);

sleep 5;
deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";
_marker = createMarker ["schiffswmarker", _dest];
"schiffswmarker" setMarkerColor "ColorGreen";
"schiffswmarker" setMarkerType "Empty";
"schiffswmarker" setMarkerShape "ELLIPSE";
"schiffswmarker" setMarkerSize [500,500];
_markerText = createMarker ["schiffswmarkertext", _dest];
"schiffswmarkertext" setMarkerColor "ColorBlack";
"schiffswmarkertext" setMarkerText "Schiffswrack";
"schiffswmarkertext" setMarkerType "mil_warning";

"schiffswmarker" setMarkerAlpha 0.3;

// DAS WRACK SPAWNEN

//_type = "";
//_chance = floor(random 2);
//if (_chance==1) then {_type = "Land_Wreck_Traw_F"} else {_type = "Land_Wreck_Traw_F"};
_type = "Land_Wreck_Traw_F";

_xPOS = floor(random 350);
_yPOS = floor(random 400);

_dasWrack = createVehicle [_type, [(_dest select 0)+_xPOS,(_dest select 1)+_yPOS,0], [], 0, "CAN_COLLIDE"];
_dasWrack allowDamage false;
//_dasWrack enableSimulation false;
//_dasWrack SVAR ["trunk_in_use",false,true];
//_dasWrack SVAR ["opened",false,true];
SVARALL(_dasWrack,"trunk_in_use",false);
SVARALL(_dasWrack,"opened",false);

schiffwoffen = false;

waitUntil {sleep 5.3; schiffwoffen}; // Warten, bis es geöffnet wird

//_dasWrack SVAR ["opened",true,true];
SVARALL(_dasWrack,"opened",true);

// RANDOM LOOT EINFÜHREN

_lootAmount = _schiffsw_loot_amount;
_lootArray = _schiffsw_loot_array;
_lootTempToAdd = [];
_lootArrayFinal = [];

while {_lootAmount>0} do {
	SUB(_lootAmount,1);
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = SEL(_lootArray,_inArr);
	ADD(_lootArrayFinal,[_lootTempToAdd]);
	sleep 0.2;
};

//_dasWrack SVAR ["Trunk",[_lootArrayFinal,500],true];
/*
SVARALL(_dasWrack,"Trunk",[_lootArrayFinal,500]);
if(local _dasWrack) then {
	_dasWrack setVariable ["Trunk",[_lootArrayFinal,500],true];
}else{	
*/
[_dasWrack,"Trunk",[_lootArrayFinal,500],true] remoteExecCall ["TON_fnc_setObjVar",RSERV];
//};

sleep 5400;

"schiffswmarker" setMarkerAlpha 0;
"schiffswmarkertext" setMarkerAlpha 0;

deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";
deleteVehicle _dasWrack;

sleep 320 ;
[]spawn LIGA_fnc_schiffwrackauto;
