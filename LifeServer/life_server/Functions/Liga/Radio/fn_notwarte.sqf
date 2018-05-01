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
║ File: fn_notwarte.sqf
║ Author: Hirschi - Die Liga
║ 
║ Description:
║ Notruf Voice System .... Warteschleife usw.
╚══════════════════════════════════════════════════╝	
*/

private ["_unit","_bool","_count"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
_count = count Not_warteschl;

//Not_CivUnit

if (_bool) then 
{
	/*if (_count == 0) exitWith {
			[_unit,true,8]spawn TON_fnc_radio;  //In Channel
			Not_CivUnit = _unit;
			[["",_count,7],"life_fnc_clientMessage",west,false] spawn life_fnc_MP;
			[["",_count,7],"life_fnc_clientMessage",east,false] spawn life_fnc_MP;
			[["",_count,7],"life_fnc_clientMessage",independent,false] spawn life_fnc_MP;		
		};
	*/
	_w = Not_warteschl find _unit;
	if(_w == -1 ) then { Not_warteschl set [_count ,_unit];
	};
	[["","VN",7,_unit,_count],"life_fnc_clientMessage",liga_cop_group,false] spawn life_fnc_MP;
	[["","VN",7,_unit,_count],"life_fnc_clientMessage",east,false] spawn life_fnc_MP;
	[["","VN",7,_unit,_count],"life_fnc_clientMessage",liga_lrk_group,false] spawn life_fnc_MP;
}else{
	if (_count == 0) exitWith {	[_unit,false,8]spawn TON_fnc_radio; Not_CivUnit = ObjNull;};
	_i = Not_warteschl find _unit; 
	if (_i != -1) then {Not_warteschl deleteAt _i;};
	[_unit,false,8]spawn TON_fnc_radio;  // Aus Channel
	Not_CivUnit = ObjNull;
};
