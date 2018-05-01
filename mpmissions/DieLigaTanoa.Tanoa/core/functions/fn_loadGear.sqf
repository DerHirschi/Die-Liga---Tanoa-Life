#include "..\..\Liga_script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Hirschi - Die Liga	
	
    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_cfg","_vest","_item","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle"];
_itemArray = life_gear;
waitUntil {!(isNull (findDisplay 46))};

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(EQUAL(count _itemArray,0)) exitWith {
    switch(side player) do {
        case west: {
            [] call life_fnc_copLoadout;
        };
        
        case civilian: {
            [] call life_fnc_civLoadout;
        };

        case independent: {
            [] call life_fnc_medicLoadout;
        };
		case east: {
			[] call life_fnc_ADACLoadout;
        };		
    };
};

_itemArray params [
	"_uniform",
	"_vest",
	"_backpack",
	"_goggles",
	"_headgear",
	["_items",[]],
	"_prim",
	"_seco",
	["_uItems",[]],
	["_uMags",[]],
	["_bItems",[]],
	["_bMags",[]],
	["_vItems",[]],
	["_vMags",[]],
	["_pItems",[]],
	["_hItems",[]],
	["_yItems",[]]
];

if(!(EQUAL(_goggles,""))) then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_headgear,""))) then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_uniform,""))) then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_vest,""))) then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_backpack,""))) then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

/* Hotfix for losing virtual items on login */
if(!isNil {SEL(_this,0)}) then {
	ADD(life_maxWeight,(round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(backpack player),"maximumload") / 4)));
};
if(!isClass (missionConfigFile >> CONFIG_KLAMOTTEN >> (backpack player) )) then {
	_cfg = getNumber(configFile >> CONFIG_VEHICLES >> (backpack player) >> "maximumload");	
	_cfg = round(_cfg/4);
}else{
	_cfg = M_CONFIG(getNumber,CONFIG_KLAMOTTEN,(backpack player),"LigaInv");
	_cfg = round(_cfg * 2);
};
ADD(life_maxWeight,_cfg);

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;

{player addItemToUniform _x;} foreach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uMags);
{player addItemToVest _x;} foreach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vMags);
{player addItemToBackpack _x;} foreach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_bMags);
life_maxWeight = 100;
{
    _item = [_x,1] call life_fnc_varHandle;
    [true,_item,1] call life_fnc_handleInv;
} foreach (_yItems);

life_maxWeight = 24;

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(!(EQUAL(_prim,""))) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_seco,""))) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (!(EQUAL(_x,""))) then {
        player addPrimaryWeaponItem _x;
    };
} foreach (_pItems);
{
    if (!(EQUAL(_x,""))) then {
        player addHandgunItem _x;
    };
} foreach (_hItems);

[] call life_fnc_ligaSetClothText; 
