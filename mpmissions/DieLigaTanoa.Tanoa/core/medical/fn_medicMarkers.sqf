#include "..\..\Liga_script_macros.hpp"
/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_markersl","_units","_lrk"];
_markers = [];
_markersl = [];
_units = [];
_lrk = [];

sleep 0.25;
if(visibleMap) then {
    {if(side _x == independent) then {_lrk set[count _lrk,_x];}} foreach playableUnits; //Fetch list of cops / blufor
    //Create markers
    {
        _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorRed";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format["%1", name _x];
        _markersl set[count _markers,[_marker,_x]];
    } foreach _lrk;	
	{
		_name = _x GVAR "name";
		_down = _x GVAR ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_units pushBack _x;
		};
	} foreach allDeadMen; 
	
	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerSizeLocal [1.2,1.2];
		_marker setMarkerTextLocal format["%1",(_x GVAR["name","Unknown Player"])];
		_markers pushBack _marker;
		
		_marker = createMarkerLocal [format["%1_dead_marker1",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorOrange";
		_marker setMarkerTypeLocal "Empty";		
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerSizeLocal [120,120];
		_markers pushBack _marker;
		
	} foreach _units;
	
	while {visibleMap} do 
	{
		sleep 1.5;
		{
			_x setMarkerColorLocal "ColorGreen";			
		}foreach _markers;
		sleep 1.5;		
		{
			_x setMarkerColorLocal "ColorRed";			
		}foreach _markers;		
		
	};
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
	{deleteMarkerLocal (SEL(_x,0));} foreach _markersl;
    _markersl = [];
    _lrk = [];
};