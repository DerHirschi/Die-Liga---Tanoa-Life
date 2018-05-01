#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		tawvd_foot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;		
		SVAR_PRONS["liga_footv",tawvd_foot];			
	};
	
	case 1:
	{
		tawvd_car = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		SVAR_PRONS["liga_carv",tawvd_car];
	};
	
	case 2:
	{
		tawvd_air = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
		SVAR_PRONS["liga_airv",tawvd_air];
	};
	case 4: {
		player setDir (360 - _value);
	};	
};