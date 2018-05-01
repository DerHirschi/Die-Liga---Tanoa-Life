/*
Hirschi ---- Liga -- blah 
*/




private["_bot","_heli","_waypoint"];
LigaNPC1 = createGroup east;

for [{_i=1},{_i<=10},{_i=_i+1}] do {				
	_bot = [[20870,(7282 + (8 * _i)),0], 180, "O_G_Soldier_F", east] call bis_fnc_spawnvehicle;			
	[_bot] join LigaNPC1;		
};	

for [{_i=1},{_i<=3},{_i=_i+1}] do {
	_heli = [[20870,(7282 + (80 * _i)),50], 180, "B_Heli_Light_01_armed_F", east] call bis_fnc_spawnvehicle;

	[_heli] join LigaNPC1;	
};	
	_heli = [[20970,7382,0], 180, "O_Quadbike_01_F", east] call bis_fnc_spawnvehicle;

	[_heli] join LigaNPC1;
	_heli = [[20670,7382,0], 180, "O_Truck_03_transport_F", east] call bis_fnc_spawnvehicle;

	[_heli] join LigaNPC1;
	
	
{
	_x setSkill 1; 
	_x addRating 9999999;
	_x allowFleeing 0;
	if(_foreachIndex isEqualTo 0) then {
		LigaNPC123 selectLeader _x; 
		_x setRank "COLONEL";
	}else{
		_x setRank "PRIVATE";
	};
}forEach units LigaNPC1;


LigaNPC1 setBehaviour "COMBAT";
LigaNPC1 setCombatMode "YELLOW";
LigaNPC1 setFormation "WEDGE";
LigaNPC1 setSpeedMode "LIMITED";

		_waypoints = 
		[			
			[21062.1,7136.12],
			[21168.1,7546.19],
			[20784.7,7234.97],
			[21030.9,7306.47],
			[21168.1,7546.94]
		];
		
		{leader LigaNPC1 doMove _x; uiSleep 180;}forEach _waypoints;
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