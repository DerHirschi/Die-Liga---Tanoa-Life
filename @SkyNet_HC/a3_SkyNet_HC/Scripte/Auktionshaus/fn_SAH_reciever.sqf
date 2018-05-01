#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
_info = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _info)exitWith {};
private["_curOffer"];
diag_log format["SAH_offers:vor %1",SAH_offers];
_SAH_Ligaoffers = [];
_players = [];
{
	if (isPlayer _x) then {
		_players pushBack getPlayerUID _x;
	};
} forEach playableUnits;		
{	
	_curOffer = _x;
	{
		if (_x isEqualTo (SEL(_curOffer,0))) exitWith {	_SAH_Ligaoffers pushBack _curOffer;};
	} forEach _players;
	
} forEach SAH_offers;				
		
[2,_SAH_Ligaoffers] remoteExecCall ["life_fnc_CAH_reciever",_info];
	
diag_log format["SAH_offers:nach %1",SAH_offers];