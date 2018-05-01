#include "\life_server\Liga_Macros.hpp"
/*
	Author: Hirschi
*/
private["_startpositions1"];
_house 			= [_this,0,objNull	,[objNull]	] call BIS_fnc_param;
_dur 			= [_this,1,5		,[1]		] call BIS_fnc_param;
_dur1 			= [_this,2,20		,[1]		] call BIS_fnc_param;
if(isNull _house) exitWith {};
if(!isClass (missionConfigFile >> "LigaLadenClass" >> (typeOf _house))) then {
	_startpositions1 = [getPos _house];
}else{
	
	_startpositions1 = [];
	{
		_startpositions1 pushBack (_house modelToWorld _x);
	}forEach M_CONFIG(getArray,"LigaLadenClass",(typeOf _house),"FireWPOS");	
	
};


uiSleep 4;
		
for "_a" from 0 to _dur do {
	for "_i" from 0 to _dur1 do {
			
		[ (_startpositions1 call BIS_fnc_selectRandom), 'random','random'] spawn TON_fnc_FireWork;
		sleep (0.6 max(random 3));
	};	
	sleep (5 max(random 25));
};