/*
	Tatto entfernen 
	Author: Hirschi
	LIGACL_fnc_antiTattoo
*/

_action = [
"Bist du dir sicher ?? Die Entfernung des Guerilla Tattoos kostet 2.500 $ !!",
	"Guerilla Tattoo entfernen",
	"JA",
	"NEIN"
] call BIS_fnc_guiMessage;
if(life_cash < 2500 )exitWith {hint "Du hast nicht genug Bargeld dabei ...";};
if(_action) then {
	life_cash = life_cash - 2500;
	lci_reb = false;
	[] call SOCK_fnc_updateRequest;
};