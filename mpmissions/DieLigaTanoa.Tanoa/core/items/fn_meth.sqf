// Author: Unknow
// Edit: Hirschi@Liga-Life
#include "..\..\Liga_script_macros.hpp"


[] call life_fnc_hudUpdate;		

life_drug = life_drug + 0.93;		
		
/*
File: fn_weed.sqf
Author: Kuchiha
2´nd Author: not sure ...... ->  Mario
Edit: Hirschi@Liga-Life

Description:
Marijuana effects.
*/

private["_OBJ","_PS","_tStart","_count","_smoke_action"];

life_drugged_weed = 1;
player SVAR ["smoke_weed", true, true];
player SVAR ["drug_weed", true, true];
_tStart = time;

life_drug = life_drug + 0.34;

_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

[_PS,_OBJ] remoteExecCall ["life_fnc_weedSmoke",RCLIENT];

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

for "_i" from 0 to 480 do

		{
		

		"colorCorrections" ppEffectEnable true;
		"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0.1,0,0.5], [random 2 - random 3,random 4 - random 5,random 2 - random 5,random 1], [random 1 - random 2,random 5 - random 3,random 1 - random 5, random 1]];
		"colorCorrections" ppEffectCommit 1;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.01,0.01,true];
		"chromAberration" ppEffectCommit 1;
		
		player setDamage (0.001 + (damage player));
		
		sleep 0.1;

		};
		
"colorInversion" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [0.5,0.5,0.5,0], [0.5,0.5,0.5,0]];
"colorCorrections" ppEffectCommit 10;
waitUntil {ppEffectCommitted "colorCorrections"};
"colorCorrections" ppEffectEnable false;
"chromAberration" ppEffectEnable false;


player setVariable ["smoke_weed", false, true];
life_drugged_weed = 0;

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

if(life_drugged_cocaine == 0 && (time - _tStart) > life_drugged_weed_duration * 50) then { life_drugged_cocaine = -1; };

deleteVehicle _PS;


_tStart = time;
waitUntil{sleep 5; (!Alive player || (time - _tStart) > 300 || player getVariable ["smoke_weed",false])};

if(!(player getVariable ["smoke_weed",false]) || !Alive player) then { player setVariable ["drug_weed", false, true]; life_drugged_weed = -1; };

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake; 