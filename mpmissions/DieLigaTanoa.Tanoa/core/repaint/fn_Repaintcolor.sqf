#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_Repaintcolor.sqf
	Author: MooN-Gaming
	Edited: H1rsch - Die L1ga
	Description: Opens the display to recolor the vehicle
*/
private["_index","_veh","_c_arr","_id","_text"];
disableSerialization;
if(!isNull (findDisplay 2300)) then {
	_pos = [1105.66,592.062,0.00131476];
	if(position player isEqualTo _pos)exitWith{};
	_index = lbCurSel 2302;
	lbClear 2304;
	
	
	_veh = lbData[2302,_index];
	_veh = call compile format["%1",_veh];
	_veh = SEL(_veh,0);
	ctrlShow[2302,false];
	
	_c_arr = M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_veh,"textures");
	
	// ::: NEW SHOP CAM ::: //
	if((!isNil "life_CarPreview") AND (!isNull life_CarPreview)) then{
		deleteVehicle life_CarPreview;
	};
	uiSleep 0.3;
	
	_oldDir = getDir player;
	_oldPos = visiblePositionASL player;
	_light = "#lightpoint" createVehicleLocal _pos;   
	_light setLightBrightness 1;  
	_light setLightAmbient [1.0, 1.0, 1.0];
	player allowDamage false;
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
	uiSleep 0.3;
	if((!isNil "life_CarPreview") AND (!isNull life_CarPreview)) then{
		deleteVehicle life_CarPreview;
	};
	life_CarPreview = _veh createVehicleLocal (getPosATL player);

	life_CarPreview setPos (player modelToWorld [3,9,0]);
	life_CarPreview setDir ([life_CarPreview,player] call BIS_fnc_dirTo);
	life_CarPreview enableSimulation false;
	[life_CarPreview] spawn life_fnc_vehicleRotate;
	life_CarCAMPreview = "CAMERA" camCreate getPos player;
	showCinemaBorder false;
	life_CarCAMPreview cameraEffect ["Internal","Back"];
	life_CarCAMPreview camSetTarget (life_CarPreview modelToWorld [3,0,0]);
	life_CarCAMPreview camSetPos (player modelToWorld [1,0,5]);
	life_CarCAMPreview camSetFovRange [0.1,0.7];
	life_CarCAMPreview camSetFocus [50,0];
	life_CarCAMPreview camCommit 0;
	

	

	//_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};
	_id = switch(side player) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};
	
	for "_i" from 0 to (count _c_arr)-1 do
	{
		if((_c_arr select _i) select 1 isEqualTo _id) then
					{
		//_text = SEL(SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_veh,"textures"),_i),0);
		_color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_veh,"textures"),_i),0);
		if(isNil "_color") then {_color = ""};
		_text = format["(%1)",_color];
		if(_text isEqualTo "()") then {
			_text = "";
		};
		lbAdd[2304,format["%1",_text]];
		lbSetValue [2304,(lbSize 2304)-1,_i];
	
		};
	};
	lbSetCurSel [2304,0];
	if((lbSize 2304)-1 != -1) then
	{
		ctrlShow[2304,true];
	}
	else
	{
		ctrlShow[2304,false];
	};
	
	waitUntil {isNull (findDisplay 2300)};
	{if(_x != player) then {_x hideObject false;};} foreach playableUnits;
	player setPosASL _oldPos;
	player setDir _oldDir;
	player allowDamage true;
	{deleteVehicle _x;} foreach [_light];
	life_CarCAMPreview cameraEffect ["TERMINATE","BACK"];
	camDestroy life_CarCAMPreview; 
	if((!isNil "life_CarPreview") && (!isNull life_CarPreview)) then{
		deleteVehicle life_CarPreview;
	};
};
