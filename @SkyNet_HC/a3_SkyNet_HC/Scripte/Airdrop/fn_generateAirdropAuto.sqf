/*
	@file Version: 1.0.0.0
	@file Author: RYN_Ryan
	@file edit: 20.01.2015
	Copyright � 2015 Ryan Torzynski, All rights reserved
	All servers are allowed to use this code, modify and publish it. Every modified release of this script must contain "Original by RTT"!
*/

sleep 10;

if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};

//_chance = floor(random 100);
//if (_chance>airdrop_chance) exitWith {};
_toWait = (random (airdrop_time_max - airdrop_time_min)) + airdrop_time_min;
sleep _toWait; // Wait abit for the airdrop
if (!airdrop_enable) exitWith {};
if (airdrop_goingon) exitWith {};
airdrop_goingon=true;
diag_log "╔═════════════════════════════╗";
diag_log "║ AIRDROP wurde automatisch gestartet !!";
diag_log "╚═════════════════════════════╝";
// AIRDROP STARTEN

[[1,""],"life_fnc_ligaNews",true,false] spawn SKY_fnc_MPall;
_poses = count airdrop_positions;
_inArr = floor(random _poses);
_dest = airdrop_positions select _inArr;

sleep 300;

_marker = createMarker ["Airdropmarker", _dest];
"Airdropmarker" setMarkerColor "ColorRed";
"Airdropmarker" setMarkerType "Empty";
"Airdropmarker" setMarkerShape "ELLIPSE";
"Airdropmarker" setMarkerSize [500,500];
_markerText = createMarker ["Airdropmarkertext", _dest];
"Airdropmarkertext" setMarkerColor "ColorBlack";
"Airdropmarkertext" setMarkerText "Airdrop-Mission";
"Airdropmarkertext" setMarkerType "mil_warning";

sleep 300;

[[3,""],"life_fnc_ligaNews",true,false] spawn SKY_fnc_MPall;
sleep 300;

heli1 = CreateVehicle [airdrop_helicopter_main, [100, 0, 570], [], 0, "FLY"];
heli2 = CreateVehicle [airdrop_helicopter_scnd, [0, 100, 650], [], 0, "FLY"];
heli3 = CreateVehicle [airdrop_helicopter_scnd, [100, 100, 720], [], 0, "FLY"];



heli1 allowDamage false;


_mygroup1 = [[0, 0, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup2 = [[0, 0, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
_mygroup3 = [[0, 0, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;

{_x allowDamage false;_x moveInDriver heli1;} forEach units _mygroup1;
{_x moveInDriver heli2; [_x] join _mygroup1;} forEach units _mygroup2;
{_x moveInDriver heli3; [_x] join _mygroup1;} forEach units _mygroup3;

uiSleep 1;

deleteGroup _mygroup2;
deleteGroup _mygroup3;	

heli1 setPos [0, 50, 550];
heli2 setPos [50, 0, 350];
heli3 setPos [0, 0, 750];

heli1 flyInHeight 20;
heli2 flyInHeight 20;
heli3 flyInHeight 20;

[_mygroup1, 0] setWaypointFormation "WEDGE";
//[_mygroup1, 0] setWaypointBehaviour "STEALTH";
_mygroup1 addWaypoint [_dest, 0];
_mygroup1 addWaypoint [[0,0,0], 0];



_markerText = createMarker ["airbox_marker", [14028.5,18719.7,0.0014267]];
"airbox_marker" setMarkerColor "ColorBlue";
"airbox_marker" setMarkerText " Airdrop-Box";
"airbox_marker" setMarkerType "mil_destroy";

_containerdummy = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_containerdummy attachTo [heli1,[0,0,-3.5]];
_containerdummy setDir 90;


heli1 lock 2;
heli2 lock 2;
heli3 lock 2;

while { _dest distance heli1 > 250 } do { "airbox_marker" setMarkerPos getPos heli1; sleep 1; };

[[4,""],"life_fnc_ligaNews",true,false] spawn SKY_fnc_MPall;
// Drop the container

deleteVehicle _containerdummy;
sleep 0.1;
_container = createVehicle ["Land_Cargo20_blue_F", [3450.7363, 16708.432, 90], [], 0, "CAN_COLLIDE"];
_para = createVehicle ["O_Parachute_02_F", [getPos heli1 select 0, getPos heli1 select 1, getPos heli1 select 2], [], 0, ""];
_para setPosATL (heli1 modelToWorld[0,0,100]);
_para attachTo [heli1,[0,0,-10]];
detach _para;
_container attachTo [_para,[0,0,-2]];
_container setDir 90;
//playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss", _container];
_smoke="SmokeShellGreen" createVehicle [getpos _container select 0, getpos _container select 1,0];
_smoke attachTo [_container,[0,0,0]];
_light = "Chemlight_green" createVehicle getPos _container;
_light attachTo [_container,[0,0,0]];
_flare = "F_40mm_Green" createVehicle getPos _container;
_flare attachTo [_container,[0,0,0]];
sleep 0.1;
{_x doMove [380.47,267.6,0]}forEach units _mygroup1; 
_mygroup1 setFormation "WEDGE";
while { (getPos _container select 2) > 30 } do { "airbox_marker" setMarkerPos getPos _container;sleep 1; };

sleep 13; 
detach _container;
_container setPos [getPos _container select 0, getPos _container select 1, (getPos _container select 2)+0.5];
//playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _container];
sleep 6;
"M_NLAW_AT_F" createVehicle [getPos _container select 0, getPos _container select 1, 0];
_pos_container = getPos _container;
deleteVehicle _container;
sleep 0.5;
_box = createVehicle ["CargoNet_01_box_F", _pos_container, [], 0, "CAN_COLLIDE"];
_box allowDamage false;
_smoke="SmokeShellGreen" createVehicle [getpos _box select 0,getpos _box select 1,0];
_flare = "F_40mm_Green" createVehicle getPos _container;
_light attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];

// Fill box

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;

sleep 0.1;
_var=floor(random 3);
if (_var == 1) then {_box addWeaponCargoGlobal ["arifle_AKM_F", 1];};
sleep 0.1;
if (_var == 0) then {_box addWeaponCargoGlobal ["FirstAidKit", 1];};
sleep 0.1;
if (_var == 1) then {_box addWeaponCargoGlobal ["hgun_Rook40_F", 1];};
sleep 0.1;
if (_var == 2) then {_box addWeaponCargoGlobal ["acc_flashlight", 5];};
sleep 0.1;
if (_var == 2) then {_box addWeaponCargoGlobal ["optic_Yorris", 1];};
sleep 0.1;
if (_var == 0) then {_box addWeaponCargoGlobal ["ItemWatch", 5];};
sleep 0.1;
if (_var == 2) then {_box addWeaponCargoGlobal ["hgun_PDW2000_F", 1];};
sleep 0.1;
if (_var == 1) then {_box addWeaponCargoGlobal ["arifle_TRG21_F", 1];};
sleep 0.1;
if (_var == 0) then {_box addWeaponCargoGlobal ["arifle_SDAR_F", 1];};
sleep 0.1;
if (_var == 1) then {_box addMagazineCargoGlobal ["ItemRadio", 5];};
sleep 0.1;
if (_var == 2) then {_box addMagazineCargoGlobal ["SmokeShellOrange", 2];};
sleep 0.1;
if (_var == 1) then {_box addMagazineCargoGlobal ["20Rnd_762x51_Mag", 3];};
sleep 0.1;
if (_var == 2) then {_box addMagazineCargoGlobal ["10Rnd_762x54_Mag", 4];};
sleep 0.1;
if (_var == 0) then {_box addMagazineCargoGlobal ["150Rnd_762x54_Box", 2];};
sleep 0.1;
if (_var == 0) then {_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 4];};
sleep 0.1;
if (_var == 1) then {_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 5];};
sleep 0.1;
if (_var == 2) then {_box addMagazineCargoGlobal ["SmokeShell", 4];};
sleep 0.1;
if (_var == 1) then {_box addItemCargoGlobal ["Binocular", 5];};
sleep 0.1;
if (_var == 2) then {_box addItemCargoGlobal ["optic_SOS", 1];};
sleep 0.1;
if (_var == 1) then {_box addItemCargoGlobal ["optic_Hamr", 1];};
sleep 0.1;
if (_var == 2) then {_box addItemCargoGlobal ["optic_MRCO", 1];};
sleep 0.1;
if (_var == 0) then {_box addItemCargoGlobal ["Rangefinder", 1];};
sleep 0.1;
if (_var == 0) then {_box addItemCargoGlobal ["optic_DMS", 1];};
sleep 0.1;
if (_var == 0) then {_box addItemCargoGlobal ["muzzle_snds_M", 1];};
sleep 0.1;
if (_var == 0) then {_box addItemCargoGlobal ["bipod_01_F_blk", 1];};
sleep 0.1;
if (_var == 1) then {_box addItemCargoGlobal ["muzzle_snds_H", 1];};
sleep 0.1;
if (_var == 2) then {_box addItemCargoGlobal ["muzzle_snds_H_MG", 1];};
sleep 0.1;
if (_var == 1) then {_box addItemCargoGlobal ["HandGrenade_Stone", 2];};
sleep 0.1;

// Fill box end

sleep 300;
{deleteVehicle _x}forEach crew heli1;
deleteVehicle heli1;
{deleteVehicle _x}forEach crew heli2;
deleteVehicle heli2;
{deleteVehicle _x}forEach crew heli3;
deleteVehicle heli3;
{deleteVehicle _x}forEach units _mygroup1;

deleteGroup _mygroup1;

sleep 600;
[[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>5 Minuten bis zur Selbstzerstoerung !!!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 240;
sleep 50;
[[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission</t></t><br/><br/><t size='1'>10 Sekunden bis zur Selbstzerstoerung !!!</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 10;
[[5,"<t size='1.2'><t color='#FF0000'>Airdrop-Mission beendet!</t></t><br/><br/><t size='1'>Die Airdrop Mission wurde soebend beendet .</t>"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
deleteVehicle _box; 
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-21,(getPos _box select 1)+21,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-1,(getPos _box select 1)+56,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+23,(getPos _box select 1)-75,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)-50,(getPos _box select 1)+1,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+87,(getPos _box select 1)-22,0];
sleep 1;
_bmb = "BO_GBU12_LGB" createVehicle [(getPos _box select 0)+0,(getPos _box select 1)-0,0];


"Airdropmarker" setMarkerAlpha 0;
"Airdropmarkertext" setMarkerAlpha 0;

deleteMarker "airbox_marker";
deleteMarker "Airdropmarker";
deleteMarker "Airdropmarkertext";

airdrop_goingon = false;