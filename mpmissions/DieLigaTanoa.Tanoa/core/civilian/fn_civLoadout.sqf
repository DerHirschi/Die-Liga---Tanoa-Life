/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle","_clothings"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
if(playerSide isEqualTo "independent") then {
	_clothings = ["U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_4_F"];
}else{
	_clothings = ["U_C_man_sport_1_F","U_C_man_sport_2_F","U_C_man_sport_3_F"];
};
player forceAddUniform (_clothings select (floor(random (count _clothings))));

/* ITEMS */

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;