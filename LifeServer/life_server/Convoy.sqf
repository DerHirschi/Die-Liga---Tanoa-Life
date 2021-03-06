//	@file Version: 2
//	@file Name: mission_MiniConvoy.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo)
//	@file Created: 1/09/2013 14:19
//	@file Args: none
// Edit by Hirschi - Die Liga


if (!isServer) exitwith {};

#define sideMissionTimeout (45*60)
#define sideMissionDelayTime (15*25)

#define missionRadiusTrigger 99999
#define sideMissionColor "#4BC9B0"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"


private ["_missionMarkerName","_missionType","_fn_ran_sol","_fn_veh_set","_picture","_vehicleName","_hint","_waypoint","_routes","_convoyVeh","_veh1","_veh2","_veh3","_rn","_waypoints","_starts","_startdirs","_groupsm","_vehicles","_marker","_failed","_startTime","_numWaypoints","_ammobox","_createVehicle","_leader"];

_missionMarkerName = "MiniConvoy_Marker";
_missionType = "Truck Convoy";
diag_log format["WASTELAND SERVER - Side Mission Started: %1", _missionType];
diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1", _missionType];
//[sideMissionDelayTime] call createWaitCondition;
uiSleep 180;
diag_log format["WASTELAND SERVER - Side Mission Resumed: %1", _missionType];

//pick the vehicles for the convoy (veh2 is the 'convoyed' vehicle
_convoyVeh = 
[
	["B_Quadbike_01_F", "C_Van_01_box_F", "B_Quadbike_01_F"],
	["B_Quadbike_01_F", "C_Van_01_box_F", "B_Quadbike_01_F"],
	["I_G_Offroad_01_F", "I_Truck_02_transport_F", "I_G_Offroad_01_F"],
	["I_G_Offroad_01_F", "O_Truck_02_transport_F", "I_G_Offroad_01_F"]
]
call BIS_fnc_selectRandom;

_veh1 = _convoyVeh select 0;
_veh2 = _convoyVeh select 1;
_veh3 = _convoyVeh select 2;

// available routes to add a route. If you add more routes append ,4 to the array and so on
_routes = [1,2,3];

_fn_veh_set = {
	private ["_vehicle", "_toolkitFullRepair"];
	_vehicle = _this select 0;
	_toolkitFullRepair = [_this, 1, false, [false]] call BIS_fnc_param;

	_vehicle setVariable [call vChecksum, true];
	_vehicle disableTIEquipment true;

	// if (_toolkitFullRepair) then { _vehicle spawn vehicleRepair };

	clearMagazineCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
};


_fn_ran_sol = {
	// ******************************************************************************************
	// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
	// ******************************************************************************************
	//	@file Name: createRandomSoldier.sqf
	/*
	 * Creates a random civilian soldier.
	 *
	 * Arguments: [ position, group, init, skill, rank]: Array
	 *    position: Position - Location unit is created at.
	 *    group: Group - Existing group new unit will join.
	 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
	 *    skill: Number - (optional, default 0.5)
	 *    rank: String - (optional, default "PRIVATE")
	 */

	if (!isServer) exitWith {};

	private ["_fn_rifel_prim_weap","_fn_skill","_soldierTypes","_fn_admil","_uniformTypes", "_vestTypes", "_weaponTypes", "_group", "_position", "_rank", "_soldier"];

	_fn_rifel_prim_weap = {
	
		//	@file Version: 1.0
		//	@file Name: refillPrimaryAmmo.sqf
		//	@file Author: AgentRev
		//	@file Created: 21/10/2013 19:30
		//	@file Args:

		if (!isServer) exitWith {};

		private ["_unit", "_minMags", "_magType", "_magCount"];

		_unit = _this;
		_minMags = 3;

		if (local _unit && !isPlayer _unit) then
		{
			waitUntil
			{
				sleep 1;
				_magType = [primaryWeaponMagazine _unit, 0, "", [""]] call BIS_fnc_param;
				_magType != "" || !alive _unit
			};

			if (_magType != "") then
			{
				while {alive _unit} do
				{
					_magCount = {_x == _magType} count magazines _unit;
					
					if (_magCount < _minMags) then
					{
						_unit addMagazines [_magType, _minMags - _magCount];
					};
					
					sleep 3;
				};
			};
		};

	};

	_fn_admil = {
		//	@file Version: 1.0
		//	@file Name: addMilCap.sqf
		//	@file Author: AgentRev
		//	@file Created: 21/10/2013 18:40
		//	@file Args:

		if (!isServer) exitWith {};

		private ["_unit", "_time"];

		_unit = _this;
		_time = time;

		// BIS_randomSeed2 is generated by \Civil\scripts\randomize_civ1.sqf in characters_f.pbo
		waitUntil {sleep 1; _unit getVariable ["BIS_randomSeed2", 0] >= 2 || {headgear _unit != ""} || {time - _time >= 3}};

		if (leader _unit == _unit) then
		{
			_unit addHeadgear "H_MilCap_blue";
		}
		else
		{
			_unit addHeadgear "H_MilCap_mcamo";
		};

	};
	
	_fn_skill = {
		
		// ******************************************************************************************
		// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
		// ******************************************************************************************
		//	@file Version: 1.0
		//	@file Name: setMissionSkill.sqf
		//	@file Author: AgentRev
		//	@file Created: 21/10/2013 19:14
		//	@file Args:

		if (!isServer) exitWith {};

		private ["_unit", "_skill", "_accuracy"];
		_unit = _this;


		_skill = 0.5; // Default skill for ARMA3 is 0.5
		_accuracy = 1; // Relative multiplier; absolute default accuracy for ARMA3 is 0.25


		_unit allowFleeing 0;
		_unit setSkill _skill;
		_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];
		_unit setSkill ["courage", 1];

		// Available skills are explained here: http://community.bistudio.com/wiki/AI_Sub-skills
		// Skill values are between 0 and 1

	};
	
	
	_soldierTypes = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F"];
	_uniformTypes = ["U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam_tshirt" ,"U_B_CombatUniform_mcam"];
	_vestTypes = ["V_PlateCarrier1_rgr","V_PlateCarrier2_rgr"];
	_weaponTypes = ["arifle_TRG20_F","LMG_Mk200_F","arifle_MXM_F","arifle_MX_GL_F"];

	_group = _this select 0;
	_position = _this select 1;
	_rank = [_this, 2, "", [""]] call BIS_fnc_param;

	_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
	_soldier addRating 999999;
	_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
	_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
	[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;

	if (_rank != "") then
	{
		_soldier setRank _rank;
	};

	_soldier spawn _fn_rifel_prim_weap;
	_soldier spawn _fn_admil;
	_soldier call _fn_skill;

	//_soldier addEventHandler ["Killed", server_playerDied];

	_soldier
	
	
};





// pick one of the routes
_rn = _routes call BIS_fnc_selectRandom;

// set starts and waypoints depending on above (random) choice
switch (_rn) do 
{ 
	case 1: {
		// route 1
		// starting positions for this route
		_starts = 
		[
			[4684.3921, 13337.070],
			[4663.5249, 13305.790],
			[4643.0615, 13272.709]
		];
		// starting directions in which the vehicles are spawned on this route
		_startdirs = 
		[
			33,
			33,
			33
		];
		// the routes
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
		// end of route one
	}; 
	case 2: {
		// route 2
		// starting positions for this route
		_starts = 
		[
			[21825.268, 7122.4512],
			[21821.420, 7062.1821],
			[21812.445, 6990.3716]
		];
		// starting directions in which the vehicles are spawned on this route
		_startdirs = 
		[
			10,
			10,
			10
		];
		// the routes
		_waypoints = 
		[
			[21824.990, 7174.1509],
			[20485.871, 10990.865],
			[18257.242, 13530.432],
			[18311.520, 13544.588],
			[18335.752, 13940.664],
			[18278.490, 14655.104],
			[20768.957, 16632.809],
			[20332.428, 16846.414],
			[20469.039, 17205.830],
			[19996.465, 18402.379],
			[20927.098, 18642.852],
			[21651.148, 18949.061]
		];
		// end of route two
	}; 
	case 3: {
		// route 3
		// starting positions for this route
		_starts = 
		[
			[9540.4004, 8544.2471],
			[9523.5410, 8505.0156],
			[9502.9043, 8470.8223]
		];
		// starting directions in which the vehicles are spawned on this route
		_startdirs = 
		[
			35,
			35,
			35
		];
		// the routes
		_waypoints = 
		[
			[9573.9238, 8603.8203],
			[10779.979, 10752.867],
			[9883.0000, 12795.109],
			[9230.6670, 14191.858],
			[8190.9907, 15869.275],
			[6789.5913, 16126.018],
			[7139.0513, 16877.182],
			[6832.0098, 19443.926],
			[4384.6670, 21031.820]
		];
		// end of route three
	}; 
	default {
		// this shouldnt happen but just to be sure..
		diag_log format["WASTELAND SERVER - WARNING! %1 encountered an error selecting routes - defaulting to route 1", _missionType];
		// route 1
		// starting positions for this route
		_starts = 
		[
			[4684.3921, 13337.070],
			[4663.5249, 13305.790],
			[4643.0615, 13272.709]
		];
		// starting directions in which the vehicles are spawned on this route
		_startdirs = 
		[
			33,
			33,
			33
		];
		// the routes
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
		// end of route one
	}; 
}; 

_groupsm = createGroup east;

_createVehicle = {
    private ["_type","_position","_direction","_vehicle","_soldier"];
    
    _type = _this select 0;
    _position = _this select 1;
    _direction = _this select 2;
    _groupsm = _this select 3;
    
    _vehicle = _type createVehicle _position;
	[_vehicle] call _fn_veh_set;
    _vehicle setDir _direction;
    _groupsm addVehicle _vehicle;
    
    _soldier = [_groupsm, _position] call _fn_ran_sol; 
    _soldier moveInDriver _vehicle;
    _soldier = [_groupsm, _position] call _fn_ran_sol; 
    _soldier moveInCargo [_vehicle, 0];
    _vehicle setVehicleLock "LOCKED";  // prevents players from getting into the vehicle while the AI are still owning it
	_vehicle spawn cleanVehicleWreck;  // courtesy of AgentREV sets cleanup on the mission vehicles once wrecked :)
    _vehicle
};

_vehicles = [];
_vehicles set [0, [_veh1, (_starts select 0), (_startdirs select 0), _groupsm] call _createVehicle];
_vehicles set [1, [_veh2, (_starts select 1), (_startdirs select 1), _groupsm] call _createVehicle];
_vehicles set [2, [_veh3, (_starts select 2), (_startdirs select 2), _groupsm] call _createVehicle];

_leader = driver (_vehicles select 0);
_groupsm selectLeader _leader;
_leader setRank "LIEUTENANT";

_groupsm setCombatMode "YELLOW"; // units will defend themselves
_groupsm setBehaviour "COMBAT"; // units feel safe until they spot an enemy or get into contact
_groupsm setFormation "STAG COLUMN";
_groupsm setSpeedMode "LIMITED";

{
    _waypoint = _groupsm addWaypoint [_x, 0];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointCombatMode "YELLOW"; 
    _waypoint setWaypointBehaviour "COMBAT"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
    _waypoint setWaypointFormation "STAG COLUMN";
    _waypoint setWaypointSpeed "LIMITED";
} forEach _waypoints;

_marker = createMarker [_missionMarkerName, position leader _groupsm];
_marker setMarkerType "mil_destroy";
_marker setMarkerSize [1.25, 1.25];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Truck Convoy";

_picture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");
//_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Side Objective</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A <t color='%4'>%3</t> transporting weapon cargo is on route! Stop the convoy and capture the goods!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor];
//[_hint] call hintBroadcast;

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1", _missionType];

_failed = false;
_startTime = floor(time);
_numWaypoints = count waypoints _groupsm;
waitUntil
{
    private ["_unitsAlive"];
    
    sleep 10; 
    
    _marker setMarkerPos (position leader _groupsm);
    
    if ((floor time) - _startTime >= sideMissionTimeout) then { _failed = true };
    if (currentWaypoint _groupsm >= _numWaypoints) then { _failed = true }; // Convoy got successfully to the target location
    _unitsAlive = { alive _x } count units _groupsm;
    
    _unitsAlive == 0 || _failed
};

if(_failed) then
{
    // Mission failed
    if not(isNil "_vehicle") then {deleteVehicle _vehicle;};
	{if (vehicle _x != _x) then { deleteVehicle vehicle _x; }; deleteVehicle _x;}forEach units _groupsm;
	{deleteVehicle _x;}forEach units _groupsm;
	deleteGroup _groupsm; 
    //_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor];
   // [_hint] call hintBroadcast;
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	// Mission completed
	// unlock the vehicles incase the player cleared the mission without destroying them
	if (!isNil "_vehicles") then { 
		{
			_x setVehicleLock "UNLOCKED"; 
			_x setVariable ["R3F_LOG_disabled", false, true];
		}forEach _vehicles;
	};
	// give the rewards
	_ammobox = "Box_NATO_Wps_F" createVehicle getMarkerPos _marker;
  //  [_ammobox,"mission_USSpecial2"] call fn_refillbox;
	_ammobox allowDamage false;
	
	deleteGroup _groupsm; 
  //  _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Objective Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The convoy has been stopped, the ammo creates and vehicles are yours to take.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor];
   // [_hint] call hintBroadcast;
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
};

deleteMarker _marker;
