/*
Hirschi ---- Liga -- blah 
*/




private["_bot","_bot1","_bot2","_bot3","_heli","_waypoint","_targ"];
//LigaNPC1 = createGroup east;
//_bot1 = [[20870,(7282 + (80 * 1)),0], east, ["O_G_Soldier_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
//_bot1 = [[20870,(7282 + (80 * 1)),0], EAST, 1] call BIS_fnc_spawnGroup ;
/*
for [{_i=1},{_i<=40},{_i=_i+1}] do {
	_bot = [[20870,(7282 + (8 * _i)),0], east, ["O_G_Soldier_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	//_bot = [[21167,(7551 + (8 * _i)),0], 180, "O_G_Soldier_F", east] call bis_fnc_spawnvehicle;			
	//[_bot] join LigaNPC1;	
	{ [_x] join _bot1;} forEach units _bot;
};	
*/
_targ = objNull ;
_heli = CreateVehicle ["B_Heli_Light_01_armed_F", [20870,(7282 + (80 * 1)),50], [], 0, "FLY"];

_bot = [[20870,(7282 + (80 * 1)),0], east, 2] call BIS_fnc_spawnGroup;

{_x moveInAny _heli;} forEach units _bot;

_heli = CreateVehicle ["B_Heli_Light_01_armed_F", [20870,(7282 + (80 * 2)),50], [], 0, "FLY"];

_bot3 = [[20870,(7282 + (80 * 2)),0], east, 2] call BIS_fnc_spawnGroup;

{_x moveInAny _heli;[_x] join _bot;} forEach units _bot3;
//_bot = createGroup east;

/**
for [{_i=1},{_i<=3},{_i=_i+1}] do {
	//_heli = [[20870,(7282 + (80 * _i)),50], 180, "B_Heli_Light_01_armed_F", east] call bis_fnc_spawnvehicle;
	_heli = CreateVehicle ["B_Heli_Light_01_armed_F", [20870,(7282 + (80 * _i)),50], [], 0, "FLY"];
	//_bot2 = [[20870,(7282 + (80 * _i)),0], east, ["O_G_Soldier_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	_bot2 = [[20870,(7282 + (80 * _i)),0], EAST, 1] call BIS_fnc_spawnGroup;
	//_bot moveInDriver _heli;
	{_x moveInAny _heli; [_x] join _bot;} forEach units _bot2;
	
	uiSleep 0.2;
};	
deleteGroup _bot2;
*/
_heli = CreateVehicle ["B_Quadbike_01_F", [4684.3921, 13357.070], [], 0, "NONE"];
clearMagazineCargoGlobal _heli;
clearWeaponCargoGlobal _heli;
clearItemCargoGlobal _heli;
//_bot2 = [[20870,(7282 + (80 )),0], EAST, 8] call BIS_fnc_spawnGroup;
_bot2 = [[4684.3921, 13357.070], east, ["C_man_polo_1_F", "C_man_polo_2_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
	_x addUniform "U_B_CombatUniform_mcam_vest"; 
	_x addVest "V_PlateCarrier2_rgr"; 
	[_x, "arifle_MXM_F" , 10] call BIS_fnc_addWeapon;
	_x allowFleeing 0;
	_x setSkill 1;
	//_x addRating 9999999999999999999999999;
	_x moveInAny _heli;
} forEach units _bot2;

_heli = CreateVehicle ["C_Van_01_box_F", [4684.3921, 13337.070], [], 0, "NONE"];
clearMagazineCargoGlobal _heli;
clearWeaponCargoGlobal _heli;
clearItemCargoGlobal _heli;
_bot3 = [[4684.3921, 13337.070], east, ["C_man_polo_1_F", "C_man_polo_2_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
	_x moveInAny _heli;
	_x addUniform "U_B_CombatUniform_mcam_vest"; 
	_x addVest "V_PlateCarrier2_rgr"; 
	_x allowFleeing 0;
	_x setSkill 1;
	//_x addRating 9999999999999999999999999;
	[_x, "arifle_MXM_F" , 10] call BIS_fnc_addWeapon;
	[_x] join _bot2;
} forEach units _bot3;


_heli = CreateVehicle ["B_Quadbike_01_F", [4684.3921, 13307.070], [], 0, "NONE"];
clearMagazineCargoGlobal _heli;
clearWeaponCargoGlobal _heli;
clearItemCargoGlobal _heli;
_bot3 = [[4684.3921, 13307.070], east, ["C_man_polo_1_F", "C_man_polo_2_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{
	_x moveInAny _heli;
	_x addUniform "U_B_CombatUniform_mcam_vest"; 
	_x addVest "V_PlateCarrier2_rgr"; 
	_x allowFleeing 0;
	_x setSkill 1;
	//_x addRating 9999999999999999999999999;
	[_x, "arifle_MXM_F" , 10] call BIS_fnc_addWeapon;
	[_x] join _bot2;
} forEach units _bot3;



/*
_heli = CreateVehicle ["O_Truck_03_transport_F", [19975,(6537 + (40 )),0], [], 0, "NONE"];
_bot3 = [[20870,(7282 + (80 )),0], EAST, 8] call BIS_fnc_spawnGroup;
{_x moveInAny _heli;[_x] join _bot2;} forEach units _bot3;

_heli = CreateVehicle ["O_Truck_03_transport_F", [19975,(6537 + (50 )),0], [], 0, "NONE"];
_bot3 = [[20870,(7282 + (80 )),0], EAST, 8] call BIS_fnc_spawnGroup;
{_x moveInAny _heli;[_x] join _bot2;} forEach units _bot3;

for [{_i=1},{_i<=5},{_i=_i+1}] do {
	//_heli = [[20270,(7282 + (80 * _i)),50], 180, "B_Heli_Light_01_armed_F", east] call bis_fnc_spawnvehicle;
	_heli = CreateVehicle ["O_Truck_03_transport_F", [20870,(7282 + (10 * _i)),0], [], 0, "NONE"];
	//_bot = "O_G_Soldier_F" createUnit [[20870,(7282 + (80 * _i)),0], LigaNPC1 ];
	//_bot3 = [[20870,(7282 + (80 * _i)),0], east, ["O_G_Soldier_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	_bot3 = [[20870,(7282 + (10 * _i)),0], EAST, 8] call BIS_fnc_spawnGroup;
	//_bot moveInDriver _heli;
	{_x moveInAny _heli;[_x] join _bot2;} forEach units _bot3;
	uiSleep 0.2;
};	
*/
/*
	_heli = [[20970,7382,0], 180, "O_Quadbike_01_F", east] call bis_fnc_spawnvehicle;

	[_heli] join LigaNPC1;
	_heli = [[20670,7382,0], 180, "O_Truck_03_transport_F", east] call bis_fnc_spawnvehicle;

	[_heli] join LigaNPC1;
	{[_x] join _bot1;} forEach units LigaNPC1;
*/	
/*
{
	_x setSkill 1; 
	_x addRating 9999999;
	_x allowFleeing 0;
	if(_foreachIndex isEqualTo 0) then {
		LigaNPC1 selectLeader _x; 
		_x setRank "COLONEL";
	}else{
		_x setRank "PRIVATE";
	};
}forEach units LigaNPC1;
*/

//LigaNPC1 setBehaviour "COMBAT";
//LigaNPC1 setCombatMode "YELLOW";
//LigaNPC1 setFormation "WEDGE";


_bot2 setBehaviour "SAFE";
_bot2 setCombatMode "GREEN";
_bot2 setFormation "LINE";
//_bot2 setSpeedMode "LIMITED";

		_waypoints = 
		[			
			
			[4709.3672, 13381.538],
			[6614.5122, 15335.907],
			[8348.6055, 15781.597],
			[9703.3369, 16182.543],
			[11160.020, 17270.051],
			[12748.146, 18834.535],
			[12994.632, 19462.133],
			[11125.767, 20896.094],
			[11869.673, 22208.621]

		];
		
	
/*
{
    _waypoint = LigaNPC1 addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "YELLOW"; 
    _waypoint setWaypointBehaviour "COMBAT"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
    _waypoint setWaypointFormation "WEDGE";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;
*/
//leader _bot doFollow leader _bot2;
/*
{
    _waypoint = _bot addWaypoint [_x, 0];
    _waypoint setWaypointType "SENTRY";
    _waypoint setWaypointCompletionRadius 100;
    _waypoint setWaypointCombatMode "YELLOW"; 
    _waypoint setWaypointBehaviour "AWARE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
    _waypoint setWaypointFormation "WEDGE";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

{ // Fußtruppen
    _waypoint = _bot addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 30;
    _waypoint setWaypointCombatMode "GREEN"; 
    _waypoint setWaypointBehaviour "AWARE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
  //  _waypoint setWaypointFormation "WEDGE";
 //   _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;
*/
{	// Fahrzeuge
    _waypoint = _bot2 addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "GREEN"; 
    _waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
    _waypoint setWaypointFormation "LINE";
 //   _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker = createMarker ["MiniConvoy_Marker", position leader _bot2];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Truck Convoy";
//{leader LigaNPC1 Move _x; uiSleep 180;}forEach _waypoints;

while {true} do {
//	{diag_log format ["Unit: %1    Target: %2",_x,assignedTarget _x];}forEach units _bot1; 
//	{diag_log format ["PAWNEE -  Unit: %1    Target: %2",_x,assignedTarget _x];}forEach units _bot; 
	{diag_log format ["TEMPEST - Unit: %1    Target: %2",_x,assignedTarget _x]; if!(isNull assignedTarget _x) then{ _x doFire assignedTarget _x; _targ = assignedTarget _x}else{_x doTarget _targ; };}forEach units _bot2; 
	_marker setMarkerPos (position leader _bot2);
	_bot move position leader _bot2;
	
	uiSleep 5;
};