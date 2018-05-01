/*
	Author: Hirschi - Die Liga
*/

_obj 	= [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _obj) exitWith {};
_obj addAction["<t color='#FF0000'>!!! Feuerwerk zünden !!!</t>",{	
	(_this select 0) setVariable ["FireWo",false,true];
	[(_this select 0),2,13] remoteExec ['TON_fnc_LadenFeuerwerk',2];
	(_this select 0) spawn {uiSleep 180; deleteVehicle _this;};
},"",0,false,false,"",'player distance _target < 3 && (player == player) && (_target getVariable ["FireWo",false])'];