#include "\life_server\Liga_Macros.hpp"
/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright © 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

//schiffsw_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw_F"];

//########################## CONFIGURATION ##########################

//schiffsw_chance = 100;
_schiffsw_positions = [
	[14191.2,13336.2,-45.1112],
	[3338.97,10468.2,-28.5891],
	[3306.31,4659.17,-27.5763],
	[6927.49,2743.1,-37.1526],
	[13928.7,4283.59,-30.455],
	[6529.62,14262.3,-36.0364]
];
_schiffsw_time_interval = [1,1]; //Time given in hours, this is the interval in which the shipwreck should take spawn
_schiffsw_loot_array = [["c2",18],["c1",40],["c2",47],["c1",58],["gsm",58],["gl",77],["c1",78],["c2",100],["c1",125],["c2",125],["gsm",142],["c1",182]];
_schiffsw_loot_amount = 1;

//######################## CONFIGURATION END ########################

// Do not modify the following code

_schiffsw_time_min = _schiffsw_time_interval select 0;
_schiffsw_time_max = _schiffsw_time_interval select 1;
_schiffsw_time_min = _schiffsw_time_min*1500;
_schiffsw_time_max = _schiffsw_time_max*2500;

if (_schiffsw_time_min>=_schiffsw_time_max OR count _schiffsw_loot_array < _schiffsw_loot_amount) exitWith {/*schiffsw_enable=false;*/};
//schiffsw_enable=true;

sleep 1;

//if (!schiffsw_enable) exitWith {};

//_chance = floor(random 100);
//if (_chance>schiffsw_chance) exitWith {};
_toWait = (random (_schiffsw_time_max - _schiffsw_time_min)) + _schiffsw_time_min;
sleep _toWait;

// schiffsw STARTEN

[0,""] remoteExec ["life_fnc_ligaNews",RCLIENT];

_poses = count _schiffsw_positions;
_inArr = floor(random _poses);
_dest = SEL(_schiffsw_positions,_inArr);

sleep 5;

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

_xPOS = floor(random 400);
_yPOS = floor(random 400);

_dasWrack = createVehicle [_type, [(_dest select 0)+_xPOS,(_dest select 1)+_yPOS,0], [], 0, "CAN_COLLIDE"];
_dasWrack allowDamage false;
_dasWrack enableSimulation false;
_dasWrack SVAR ["trunk_in_use",false,true];
_dasWrack SVAR ["opened",false,true];
schiffwoffen = false;

waitUntil {sleep 5.3; schiffwoffen}; // Warten, bis es geöffnet wird

_dasWrack SVAR ["opened",true,true];

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
	sleep 0.1;
};

_dasWrack SVAR ["Trunk",[_lootArrayFinal,500],true];

sleep 5400;

"schiffswmarker" setMarkerAlpha 0;
"schiffswmarkertext" setMarkerAlpha 0;

deleteMarker "schiffswmarker";
deleteMarker "schiffswmarkertext";
deleteVehicle _dasWrack;

sleep 20 ;
[] execVM "\life_server\Functions\Schiffswrack\fn_generateschiffwrackAuto.sqf";
