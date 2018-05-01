/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Starts the cop siren sound for other players
*/


private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_tone = [_this,1,"Yelp",[""]] call BIS_fnc_param;
if(isNull _veh ||_tone isEqualTo "") exitWith {};

if(!alive _veh) exitWith {};
_veh say3D _tone;