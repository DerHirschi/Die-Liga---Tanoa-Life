#include "..\..\Liga_script_macros.hpp"
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

life_drug = life_drug + 0.53;

_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

[_PS,_OBJ] remoteExecCall ["life_fnc_weedSmoke",RCLIENT];

titleText["Kiffen könnte durstig machen!","PLAIN"];

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

_count = 0;
while{life_drugged_weed == 1 && Alive player && player getVariable ["smoke_weed",false] && (time - _tStart) < life_drugged_weed_duration * 60} do 
{
	if(_count % 10 == 0) then 
	{
		if(getFatigue player < 0.5) then { player setFatigue 0.5; };
		if(damage player > 0) then { player setDamage (damage player - 0.01);};
	};
	
	if(_count % 20 == 0) then { life_thirst = life_thirst - 5; [] spawn life_fnc_hudUpdate;};
	
	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
	"chromAberration" ppEffectCommit 1;
	"radialBlur" ppEffectAdjust [random 0.02,random 0.02,0.15,0.15];
	"radialBlur" ppEffectCommit 1;
	addcamShake[random 3, 1, random 3];
	
	sleep 1;
	_count = _count + 1;
}; 

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