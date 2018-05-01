/*
	File: vehicleEmpd.sqf
	Edit: Hirschi - Die Liga
	Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_vehicle"];
_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["nano_empd", false])) exitWith {};
_vehicle setVariable["nano_empd",true,true];


	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	_vehicle say3D "empwarn";
	sleep 3.35;
	if(local _vehicle) then {
	//	_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 1];
	//	sleep (3 * 60);
	//	_vehicle setHit [getText(configFile >> "cfgVehicles" >> typeOf _vehicle >> "HitPoints" >> "HitEngine" >> "name"), 0];
	hint "Sie wurden EMP t ....  Ihr Triebwerk wird in 50 Sekunden ausfallen !!!";


	
	
	_vehicle setfuel 0.5;
	sleep 5;
		_vehicle setfuel 0.45;
	sleep 5;
		_vehicle setfuel 0.4;
	sleep 5;
		_vehicle setfuel 0.35;
	sleep 5;
		_vehicle setfuel 0.3;
	sleep 5;
		_vehicle setfuel 0.25;
	sleep 5;
		_vehicle setfuel 0.2;
	sleep 5;
		_vehicle setfuel 0.15;
	sleep 5;
		_vehicle setfuel 0.1;
	sleep 5;
		_vehicle setfuel 0.05;
	sleep 5;
		_vehicle setfuel 0;

		
	
};

_vehicle setVariable["nano_empd",false,true];