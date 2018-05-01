/*Edit: Hirschi - Die Liga*/
disableSerialization;
_t = _this select 0;
_m = 0;
_s = CLAY_PausenTimer + 1;

If (_s >= 180) Then
{
	_s = 0; _m = _m + 3;
};
If (_s >= 120) Then
{
	_s = 0; _m = _m + 2;
};
If (_s >= 60) Then
{
	_s = 0; _m = _m + 1;
};

sleep 1;
CLAY_RadioEndTimer = false;

scopeName "Main";
for [{_c = 0}, {_c < _t}, {_c = _c + 1}] do
{
	scopeName "Loop";
	If (CLAY_RadioEndTimer) Then
	{
		breakOut "Loop";
	};
	If (_s >= 60) Then
	{
		_s = 0; _m = _m + 1;
	};
	If (_s < 10) Then
	{
		ctrlSetText [606, format ["%1:0%2", _m, _s]];
	}
	Else
	{
		ctrlSetText [606, format ["%1:%2", _m, _s]];
	};
	sleep 1;
	_s = _s + 1;
	CLAY_PausenTimer = CLAY_PausenTimer + 1;
};

ctrlSetText [606, "0:00"];
If (!CLAY_RadioEndTimer) Then
{
	
	["next", 0] execVM "scripts\CLAY_CarRadio\scripts\controls.sqf";
};
