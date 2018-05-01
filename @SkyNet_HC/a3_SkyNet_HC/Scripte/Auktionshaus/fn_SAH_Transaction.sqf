_caller			= [_this,0,objNull] call BIS_FNC_PARAM;
_offer 			= [_this,2,[]] call BIS_FNC_PARAM;
_sellerObj		= [_this,1,objNull] call BIS_FNC_PARAM;

if!(_offer in SAH_offers) exitWith {[3] remoteExecCall ["life_fnc_CAH_reciever",_caller];};
diag_log format["transoffer:vorher %1",SAH_offers];
_offer call LIGA_fnc_SAH_removeOffer;
diag_log format["transoffer:nachher %1",SAH_offers];
[0,[_offer select 1,_offer select 2,_sellerObj]] remoteExecCall ["life_fnc_CAH_reciever",_caller];

[1,[_caller,_offer select 2,_offer]]remoteExecCall ["life_fnc_CAH_reciever",_sellerObj];
