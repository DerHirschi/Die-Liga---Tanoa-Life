#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_RepaintMenu.sqf
	Author: MooN-Gaming
	Edited: H1rsch1 - D1e L1ga
	Description: What could it do bro?!
*/
private["_display","_vehicles","_color","_pic","_text"];
createDialog "Life_vehicle_repaint";
disableSerialization;
if(!isNull (findDisplay 2300)) then {
	_display = findDisplay 2300;
	_vehicles = _display displayCtrl 2302;
	lbClear 2302;
	paint_objects = nearestObjects[position player,["Car","Air","Ship"],13];
		
	//List vehicles
	{            
		if(vehicle player != _x) then {
		_color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,(typeOf _x),"textures"),(_x GVAR "Life_VEH_color")),0);
		_pic = getText(configFile >> CONFIG_VEHICLES >> typeOf _x >> "picture");            
		_text = format["(%1)",_color];
		           
		if(EQUAL(_text,"()")) then
				{
				_text = "";
				};            
				_vehicles lbAdd format ["%1 || %2", getText(configFile >> CONFIG_VEHICLES >> typeOf _x >> "DisplayName"), _text];         
				if!(_pic in ["pictureStaticObject","picturething"]) then {
					_control lbSetPicture [(lbSize _control)-1,_pic];
				};				
				_vehicles lbSetData [(lbSize _vehicles)-1,str ([typeOf _x,_foreachindex])];
			};        
	} foreach  paint_objects;
};