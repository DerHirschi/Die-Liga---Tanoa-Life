#include "..\..\Liga_script_macros.hpp"
/*
    File: fn_copLights.sqf
    Author: [GSN] Pager & [GSN] Paronity
    Website: GSNGaming.com
	Modified: Mr_Berac & Hirschi - Die Liga
    Date Created: 2.24.2015
    Date Modified: 3.3.2015 v1.3
*/



private ["_veh","_lightBlue","_lightRed","_lightWhite","_lightYellow","_lightsOn","_brightnessHigh","_brightnessLow","_attach","_leftLights","_rightLights","_type","_attenuation"];

_veh = (_this select 0);
_type = typeOf _veh;
_sun = (sunOrMoon < 1);

if (isNil "_veh" || isNull _veh || !(_veh GVAR "lights")) exitWith {};

_lightRed = [255, 0, 0];
_lightWhite = [255, 255, 255];
_lightYellow = [255, 255, 0];
_lightBlue = [0, 0, 255];

if (_sun) then
{
    _brightnessLow = 0;
    _brightnessHigh = 10;
    _attenuation = [0.001, 3000, 0, 125000];
} else {
    _brightnessLow = 0;
    _brightnessHigh = 60;
    _attenuation = [0.001, 3000, 0, 400000];
};

_flashes = 2;
_flashOn = 0.1;
_flashOff = 0.001;

_leftLights = [];
_rightLights = [];

_attach =
{
    _isLight = 	SEL(_this,0);
    _color = 	SEL(_this,1);
    _position = SEL(_this,2);	 
    _light = "#lightpoint" createVehicleLocal [0,0,0];
   // _light setPos (getPos _veh);
    _light setLightBrightness 0;
    _light setLightAmbient [0,0,0];
    _light setLightAttenuation _attenuation;
    _light setLightIntensity 1000;
    _light setLightFlareSize 1;
    _light setLightFlareMaxDistance 150;
    _light setLightUseFlare true;
    _light setLightDayLight true;

    switch (_color) do
    {
        case "red": { _light setLightColor _lightRed; };
        case "white": { _light setLightColor _lightWhite; };
        case "yellow": { _light setLightColor _lightYellow; };
		case "blue": { _light setLightColor _lightBlue; };
    };

    if (_isLight) then
    {
        _leftLights pushBack [_light, _position];
    } else {
        _rightLights pushBack [_light, _position];
    };

    _light lightAttachObject [_veh, _position];
};

switch (_type) do
{
	case "C_Offroad_01_F":
    {
        [false, "yellow", [-0.44, 0, 0.525]] call _attach;
        [true, "yellow", [0.345, 0, 0.525]] call _attach;
        [false, "yellow", [0.575, -2.95, -0.77]] call _attach;
        [true, "yellow", [-0.645, -2.95, -0.77]] call _attach;
        [false, "white", [0.61, 2.2825, -0.355]] call _attach;
        [true, "white", [-0.695, 2.2825, -0.355]] call _attach;
    };

    case "C_SUV_01_F":
    {
        [false, "yellow", [-0.39, 2.28, -0.52]] call _attach;
        [true, "yellow", [0.38, 2.28, -0.52]] call _attach;
        [false, "yellow", [-0.86, -2.75, -0.18]] call _attach;
        [true, "yellow", [0.86, -2.75, -0.18]] call _attach;
        [false, "white", [0.8, 1.95, -0.48]] call _attach;
        [true, "white", [-0.8, 1.95, -0.48]] call _attach;

    };

	case "B_Truck_01_mover_F":
    {
        [false, "yellow", [-0.77, 4.55, -0.18]] call _attach;
        [true, "yellow", [0.77, 4.55, -0.18]] call _attach;
        [true, "yellow", [-0.66, -1.35, -0.09]] call _attach;
        [false, "yellow", [0.66, -1.35, -0.09]] call _attach;
        [true, "white", [-0.95, 4.55, -0.18]] call _attach;
        [false, "white", [0.95, 4.55, -0.18]] call _attach;
    };


		case "B_Truck_01_fuel_F":
    {
        [false, "yellow", [-0.77, 4.85, -0.18]] call _attach;
        [true, "yellow", [0.77, 4.85, -0.18]] call _attach;
        [true, "yellow", [-0.99, -4.91, -0.16]] call _attach;
        [false, "yellow", [0.99, -4.91, -0.16]] call _attach;
        [true, "white", [-0.95, 4.85, -0.18]] call _attach;
        [false, "white", [0.95, 4.85, -0.18]] call _attach;
    };

	
			case "O_Truck_02_fuel_F":
    {
        [false, "yellow", [-0.8, -3.48, -1.247]] call _attach;
        [true, "yellow", [0.8, -3.48, -1.247]] call _attach;
        [false, "yellow", [-0.865, 3.84, -1.247]] call _attach;
        [true, "yellow", [0.815, 3.84, -1.247]] call _attach;
        [true, "white", [-0.85, 3.68, -0.88]] call _attach;
        [false, "white", [0.8, 3.68, -0.88]] call _attach;
    };

};

_lightsOn = true;
while {(alive _veh)} do
{
    if (!(_veh GVAR "lights")) exitWith {};
    if (_lightsOn) then
    {
        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (SEL(_x,0)) setLightBrightness _brightnessHigh; } forEach _leftLights;
            uiSleep _flashOn;
            { (SEL(_x,0))  setLightBrightness _brightnessLow; } forEach _leftLights;
            uiSleep _flashOff;
        };
        { (_x select 0) setLightBrightness 0; } forEach _leftLights;

        for [{_i=0}, {_i<_flashes}, {_i=_i+1}] do
        {
            { (SEL(_x,0))  setLightBrightness _brightnessHigh; } forEach _rightLights;
            uiSleep _flashOn;
            { (SEL(_x,0))  setLightBrightness _brightnessLow; } forEach _rightLights;
            uiSleep _flashOff;
        };
        { (SEL(_x,0)) setLightBrightness 0; } forEach _rightLights;
    };
	if(player distance2D _veh > 1900) then { waitUntil {sleep 9; (((player distance2D _veh) < 1500) || !(alive _veh) || !(_veh GVAR "lights") ) };};
};

{ deleteVehicle (SEL(_x,0))  } foreach _leftLights;
{ deleteVehicle (SEL(_x,0))  } foreach _rightLights;

_leftLights = [];
_rightLights = [];
 

//^^^Leave this blank space^^^