/*
File : fn_copShowLicense.sqf
Create : Black Lagoon
Edit : Noldy and CYNX
Edit: Hirschi - Die Liga
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/509-Turorial-Polizeimarke-zeigen/
Beschreibung : Fuegt einen 'Polizeiausweis' hinzu, den man ueber scrollen Zivilisten zeigen kann
*/
private["_msg"];
_player = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_msg = _this select 1;

hintSilent parseText _msg;

if(isNull _player) exitWith{};
if(_player in liga_tag) exitWith{};

liga_tag pushBack _player;

{
	if(isNull _x) then {
		liga_tag deleteAt _forEachIndex;
	};
}foreach liga_tag;