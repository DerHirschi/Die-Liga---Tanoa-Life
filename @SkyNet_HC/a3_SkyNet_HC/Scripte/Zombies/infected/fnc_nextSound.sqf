/*
private ["_zombie", "_type"];

if (isNil "counterSoundIdle") then {
	counterSoundIdle = 1;
	counterSoundPunch = 1;
	counterSoundHurt = 1;
};
_zombie = _this select 0;
_type = _this select 1;
*/

[_this select 0, _this select 1] remoteExecCall ["fncNextSoundCl",-2];
/*


if (_type == "idle") then {
	[_zombie,player] say3D ("idle" + str(counterSoundIdle));
	if (counterSoundIdle == 5) then {
		counterSoundIdle = 1;
	} else {
		counterSoundIdle = counterSoundIdle + 1;
	};
};
if (_type == "hurt") then {
	[_zombie,player] say3D ("hurt" + str(counterSoundHurt));
	if (counterSoundHurt == 3) then {
		counterSoundHurt = 1;
	} else {
		counterSoundHurt = counterSoundHurt + 1;
	};
};
if (_type == "punch") then {
	[_zombie,player] say3D ("punch" + str(counterSoundPunch));
	if (counterSoundPunch == 4) then {
		counterSoundPunch = 1;
	} else {
		counterSoundPunch = counterSoundPunch + 1;
	};
};
*/