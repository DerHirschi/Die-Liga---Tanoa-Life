/*
╔══════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠══════════════════════════════════════════════════╝
║ File: fn_NotMarker.sqf
║ Author: Hirschi - Die Liga
║ 
║ Vorlage: Bryan "Tonic" Boardwine
╚══════════════════════════════════════════════════╝
*/

private["_markers","_units"];

if (side player isEqualTo civilian) exitWith {};

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

_markers = [];


sleep 0.25;
waituntil {visibleMap};
	
_marker = createMarkerLocal [format["%1_not_marker",_unit],visiblePosition _unit];
	
if (side player isEqualTo east) then {
	_marker setMarkerColorLocal "ColorYellow";
	_marker setMarkerTypeLocal "o_maint";
};

if (side player isEqualTo west) then {
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "n_motor_inf";
};

if (side player isEqualTo independent) then {
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "loc_Hospital";
};

_marker setMarkerSizeLocal [1.3,1.3];	
_markers pushBack _marker;

_marker = createMarkerLocal [format["%1_dead_marker1",_unit],visiblePosition _unit];
_marker setMarkerColorLocal "ColorOrange";
_marker setMarkerTypeLocal "Empty";		
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerSizeLocal [130,130];
_markers pushBack _marker;
		

if (side player isEqualTo east) then {
	while {visibleMap} do 
	{
		sleep 1.5;		
		_marker setMarkerColorLocal "ColorYellow";			
		sleep 1.5;			
		_marker setMarkerColorLocal "ColorRed";				
	};
};

if (side player isEqualTo west) then {
	while {visibleMap} do 
	{
		sleep 1.5;		
		_marker setMarkerColorLocal "ColorBlue";			
		sleep 1.5;			
		_marker setMarkerColorLocal "ColorRed";				
	};
};

if (side player isEqualTo independent) then {
	while {visibleMap} do 
	{
		sleep 1.5;		
		_marker setMarkerColorLocal "ColorGreen";			
		sleep 1.5;			
		_marker setMarkerColorLocal "ColorRed";				
	};
};	
	
sleep 180;
{deleteMarkerLocal _x;} foreach _markers;
