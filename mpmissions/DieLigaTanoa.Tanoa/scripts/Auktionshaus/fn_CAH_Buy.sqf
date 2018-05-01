#include "..\..\Liga_script_macros.hpp"
/*
	Author	: RyanTT
	Quelle	: native-network.net
	Edit	: Hirschi - Die Liga
*/

disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
_selectedOffer = call compileFinal (_myListbox lbData (lbCurSel _myListbox));
if (life_atmcash < parseNumber (SEL(_selectedOffer,2))) exitWith {hint "Du hast nicht genug Geld dabei!";};
_seller = [_selectedOffer select 0] call life_fnc_CAH_getPlayerObj;
_selectedOffer = [SEL(_selectedOffer,0),SEL(_selectedOffer,1),parseNumber (SEL(_selectedOffer,2))];

[player,_seller,_selectedOffer]remoteExecCall ["LIGA_fnc_SAH_Transaction",HC_id];

//systemChat format ["%1",_selectedOffer];