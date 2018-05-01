#include "..\..\Liga_script_macros.hpp"
/*
	Author	: RyanTT
	Quelle	: native-network.net
	Edit	: Hirschi - Die Liga
*/
AH_loaded = false;
[player]remoteExecCall ["LIGA_fnc_SAH_reciever",HC_id];
waitUntil {AH_loaded};
waitUntil {createDialog "AH_buy";};
disableSerialization;
_dialog = findDisplay 15100;

/* THIS FUNCTION HAS BEEN CREATED BY KILLZONEKID */
_fnc_intToString = {
    _s = "";
    while {_this >= 10} do {
        _this = _this / 10;
        _s = format ["%1%2", round ((_this % floor _this) * 10), _s];
        _this = floor _this;
    };
    format ["%1%2", _this, _s];
};
/* THIS FUNCTION HAS BEEN CREATED BY KILLZONEKID */

_myListbox = _dialog displayCtrl 15101;
{
	_curOffer = _x;
	_pid = SEL(_curOffer,0);
	_item = SEL(_curOffer,1);
	_price = SEL(_curOffer,2);
	_seller = [_pid] call life_fnc_CAH_getPlayerObj;
	if(!isNull _seller) then {
		_myListbox lbAdd format ["%3 für %2€ von %1",name _seller,_price call _fnc_intToString,([_item] call life_fnc_fetchCfgDetails) select 1];
		_myListbox lbSetPicture [(lbSize _myListbox)-1, ([_item] call life_fnc_fetchCfgDetails select 2)];
		_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
		_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_pid,_item,_price call _fnc_intToString]]];
	};
} forEach AH_offers;
hint "Angebote erfolgreich geladen";
