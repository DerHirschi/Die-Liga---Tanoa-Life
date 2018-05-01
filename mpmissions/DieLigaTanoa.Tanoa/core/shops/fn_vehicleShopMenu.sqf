#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: H1rsch1 - D1e L1ga
	
	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopFlag","_disableBuy","_pic"];
(SEL(_this,3)) params [
	["_shop","",[""]],
	["_sideCheck",sideUnknown,[civilian]],
	["_spawnPoints","",["",[]]],
	["_shopFlag","",[""]],
	["_shopTitle","",[""]],
	["_disableBuy",false,[true]]
];

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(EQUAL(_shop,"")) exitWith {};
if(_sideCheck != sideUnknown && {side player != _sideCheck}) exitWith {hint localize "STR_Shop_Veh_NotAllowed"};
if(!lci_civspawn && !lci_uhrspawn) then {_shop = "start_car"; hint "Solange du noch nicht eingebuergert wurdest, hast du nur eine begreznte Auswahl an Fahrzeugen ... "; uiSleep 2;};

if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};
player allowDamage false;
uiSleep 0.2;
life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];

if(_disableBuy) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
};
if(EQUAL(_shop,"flusi_car")) then {
	//Disable the buy button.
	ctrlEnable [2309,false];
	ctrlShow [2309,false];
};
//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,CONFIG_LIGA_VEHSHOP,_shop,"vehicles");

_control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow 	[2330,false];
ctrlShow 	[2304,false];
ctrlEnable 	[2333,true];
ctrlShow 	[2333,true];

// ::: NEW SHOP CAM ::: //
_pos = [1132.37,634.781,0.000989914];
_oldDir = getDir player;
_oldPos = visiblePositionASL player;
_light = "#lightpoint" createVehicleLocal [24262,18053,0];   
_light setLightBrightness 1;  
_light setLightAmbient [1.0, 1.0, 1.0];

player setPosASL _pos;
player setDir 90;
{if(_x != player) then {_x hideObject true;};} foreach playableUnits;
player switchMove "";
life_CarPreview = "Sign_Arrow_Yellow_F" createVehicleLocal (getPosATL player);
life_CarPreview setPos (player modelToWorld [3,9,0]);
life_CarPreview setDir ([life_CarPreview,player] call BIS_fnc_dirTo);
life_CarPreview enableSimulation false;
life_CarCAMPreview = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_CarCAMPreview cameraEffect ["Internal","Back"];
life_CarCAMPreview camSetTarget (life_CarPreview modelToWorld [3,0,0]);
life_CarCAMPreview camSetPos (player modelToWorld [1,0,5]);
life_CarCAMPreview camSetFovRange [0.1,0.7];
life_CarCAMPreview camSetFocus [50,0];
life_CarCAMPreview camCommit 0;


//Loop through
{
	_className 		= SEL(_x,0);
	_basePrice 		= SEL(_x,1);
	_levelAssert 	= SEL(_x,3);
	_levelName 		= SEL(_levelAssert,0);
	_levelType 		= SEL(_levelAssert,1);
	_levelValue 	= SEL(_levelAssert,2);
	_showall 		= true;

	if(!(EQUAL(_levelValue,-1))) then {
		_level = GVAR_MNS _levelName;
		if(typeName _level == typeName {}) then {_level = FETCH_CONST(_level);};

		_showall = switch(_levelType) do {
			case "SCALAR": {_level >= _levelValue};
			case "BOOL": {_level};
			case "EQUAL": {EQUAL(_level,_levelValue)};
			default {false};
		};
	};

	if(_showall) then {
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd SEL(_vehicleInfo,3);			
		//_control lbSetPicture [(lbSize _control)-1,SEL(_vehicleInfo,2)];
		_pic = SEL(_vehicleInfo,2);
		if!(_pic in ["pictureStaticObject","picturething"]) then {
			_control lbSetPicture [(lbSize _control)-1,_pic];
		};			
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} foreach _vehicleList;

waitUntil {isNull (findDisplay 2300)};
 {if(_x != player) then {_x hideObject false;};} foreach playableUnits;
player setPosASL _oldPos;
player setDir _oldDir;

{deleteVehicle _x;} foreach [_light];
life_CarCAMPreview cameraEffect ["TERMINATE","BACK"];
camDestroy life_CarCAMPreview; 
if((!isNil "life_CarPreview") && (!isNull life_CarPreview)) then{
	deleteVehicle life_CarPreview;
};
[]spawn {
	uiSleep 5;
	player allowDamage true;
};
