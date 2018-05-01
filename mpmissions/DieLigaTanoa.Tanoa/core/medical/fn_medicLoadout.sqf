/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


sleep 0.5;
player forceAddUniform "U_Rangemaster";
player addBackpack "B_TacticalPack_blk";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player addItem "ToolKit";
player addItem "Medikit";
player addItem "Medikit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";



[] call life_fnc_saveGear;
