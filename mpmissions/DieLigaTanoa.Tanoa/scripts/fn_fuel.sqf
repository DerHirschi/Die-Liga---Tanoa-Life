#include "..\Liga_script_macros.hpp"
/*
	File: fuel.sqf
	Author: Paradox
	Codeparts by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
	
	most edited by H1rsch1 & Hyper - D1e L1ga
	
	Setze den Verbrauch
*/
private ["_rauch","_vehicle", "_rate", "_oldFuel", "_newFuel", "_difFuel","_F","_classNameLife","_ver","_velocityOfVehicle"];
	if(fuelsave)exitWith {};
	fuelsave = true;
	UISL(1);
	_vehicle = vehicle player;	
	_oldFuel = fuel _vehicle;	
	_classNameLife = typeOf _vehicle;
	if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _classNameLife)) then {
		_classNameLife = "Default"; //Use Default class if it doesn't exist
		diag_log format["%1: LifeCfgVehicles class doesn't exist",_classNameLife];
	};	
	_rate = M_CONFIG(getNumber,CONFIG_LIGA_VEHICLES,_classNameLife,"LigaVerbr");
	_rate = _rate ;
	
	waitUntil{(isEngineOn _vehicle) || (isNull objectParent player); };
	if(_vehicle GVAR ["Mani",false]) then {_F = 40;}else{_F = 1;};
	while{!(isNull objectParent player) && (driver _vehicle isEqualTo player)} do {
		


		if(fuel vehicle player < 0.02) then {_vehicle SVAR ["Mani",false,true];};
		
		if(!isNil "_rauch") then {if(isNull _rauch)then{ _rauch = nil ;};};
		//_rate = _rate * 6;		
		if(_vehicle isKindOf "Car" && isNil "_rauch") then {
			if((_vehicle getHitPointDamage "HitLFWheel") > 0.8 || (_vehicle getHitPointDamage "HitLF2Wheel") > 0.8 || (_vehicle getHitPointDamage "HitRFWheel") > 0.8 || (_vehicle getHitPointDamage "HitRF2Wheel") > 0.8 || (_vehicle getHitPointDamage "HitEngine") > 0.25 ) then 
			{
				_rauch="SmokeShell" createVehicle [0,0,0];
				_rauch attachTo [_vehicle,[0, 0, -0.8]];			
			};			
		};
		uiSleep 2;	
		if(isNull objectParent player)exitWith{};
		_fuel = fuel _vehicle;
		_difFuel = _oldFuel - _fuel;		
		if (_difFuel > 0) then {
			_velocityOfVehicle = sqrt(((velocity _vehicle select 0)^2)+((velocity _vehicle select 1)^2));
			_ver = _rate + _velocityOfVehicle/40000;
			if(_ver > 0.2) then
			{
				_ver = 0.2;
			};
			_newFuel = _fuel - (_difFuel + _ver * _F );			
			//_vehicle setFuel _newFuel;
			[_vehicle,_newFuel] remoteExecCall ["life_fnc_setFuel",_vehicle];
			//hint format["Old Fuel: %1 : New Fuel: %2 : Rate: %3 : CNF RATE %4 : DIFFUEL %5 : TestFac %6",_oldFuel, _newFuel, _ver, _rate, _difFuel];
		};
		_oldFuel = fuel _vehicle;		
		uiSleep 3;		
	};
	fuelsave = false;
