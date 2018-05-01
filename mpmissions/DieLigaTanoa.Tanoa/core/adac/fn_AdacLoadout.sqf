/*
	File: fn_AdacLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the Adac out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


player forceAddUniform "U_C_WorkerCoveralls";
player addVest "V_Rangemaster_belt";
player addBackpack "B_Bergen_mcamo";
player addItem "ToolKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";


[] call life_fnc_saveGear;