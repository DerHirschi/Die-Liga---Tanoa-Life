#include "..\..\Liga_script_macros.hpp"
/*
    File: scanVehicles.sqf
	Quelle: Tutorial - Altis Life RPG 
	Edit: Hirsch - Die Liga
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_display","_list","_objects"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
    _display = findDisplay 3494;
    _list = _display displayCtrl 2902;
    lbClear _list;
    nn_last_vehicles = [];
    _objects = nearestObjects [player, ["Air","Car","Ship"], 150];
    {
        if(vehicle player != _x) then {
			_color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,(typeOf _x),"textures"),(_x GVAR "Life_VEH_color")),0);
            _text = format["(%1)",_color];
            _list lbAdd format ["%1 - %2 (%3)", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text, round(player distance _x)];
            nn_last_vehicles set [count nn_last_vehicles, _x];
        };
    } foreach _objects;
};