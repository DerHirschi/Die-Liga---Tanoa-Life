#include "..\..\Liga_script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga

	Description:
	Tells clients to either turn the lights on for that house
	or off.
*/
private["_house","_mode","_lightSource","_pos"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,false,[true]] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(!isClass (missionConfigFile >> "LigaHousingClass" >> (typeOf _house))) exitWith {};

if(_mode) then {
	{
		_lightSource = "#lightpoint" createVehicleLocal [0,0,0];
		_lightSource lightAttachObject [_house,_x];	
		_lightSource setLightColor [250,150,50];
		_lightSource setLightAmbient [1,1,0.2];
		_lightSource setLightAttenuation [1,0,0,0];
		_lightSource setLightIntensity 10;
		_lightSource setLightUseFlare true;
		_lightSource setLightFlareSize 0.2;
		_lightSource setLightFlareMaxDistance 50;
		_house SVAR[(format ["lightSource_%1",_foreachIndex]),_lightSource];
	} forEach (M_CONFIG(getArray,"LigaHousingClass",(typeOf _house),"LightPOS"));
} else {	
	{
		if(isNull (_house GVAR[(format ["lightSource_%1",_foreachIndex]),ObjNull])) exitWith {};
		deleteVehicle (_house GVAR[(format ["lightSource_%1",_foreachIndex]),ObjNull]);
	}forEach (M_CONFIG(getArray,"LigaHousingClass",(typeOf _house),"LightPOS"));	
};