#include "\life_server\Liga_Macros.hpp"
/*
	Hirschi - Bla

	[_qResult] remoteExec ["LIGACL_fnc_lottoUbDialog",_player];
*/
private ["_qResult","_queryResult"];
_player 	= [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _player) exitWith {};



_qResult = [(format["LottoPlayerInfo:%1",(getPlayerUID _player)]),2,true] call DB_fnc_asyncCall;



_queryResult = ["LottoInit",2,true] call DB_fnc_asyncCall;


_queryResult = count _queryResult;
diag_log format["║ _queryResult		: %1",_queryResult];


_aktPod 	= 20000 * _queryResult;
diag_log format["║ _aktPod		: %1",_aktPod];
diag_log format["║ LottoPod		: %1",LottoPod];
_LottoPod	= LottoPod + _aktPod;
diag_log format["║ LottoPod SUM	: %1",LottoPod];
_LottoPod	= _LottoPod max 500000;
diag_log format["║ _LottoPod SUM min: %1",_LottoPod];


[_qResult,_LottoPod] remoteExec ["LIGACL_fnc_lottoUbDialog",_player];


