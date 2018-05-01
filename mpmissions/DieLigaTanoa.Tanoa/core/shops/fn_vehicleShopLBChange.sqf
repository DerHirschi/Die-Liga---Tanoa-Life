#include "..\..\Liga_script_macros.hpp"

/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Hirschi - Die Liga
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_vehicleInfo","_colorArray","_ctrl"];
_control = SEL(_this,0);
_index 	 = SEL(_this,1);

//Fetch some information.
_className = _control lbData _index;
_classNameLife = _className;
_vIndex = _control lbValue _index;

_vehicleList = M_CONFIG(getArray,"LigaKarrenLaden",SEL(life_veh_shop,0),"vehicles");
_basePrice = SEL(SEL(_vehicleList,_vIndex),1);

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_Rental")+ " <t color='#8cff9b'>$%1</t><br/>" +
	(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>$%2</t><br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>" +
	(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel")+ " %7<br/>" +
	(localize "STR_Shop_Veh_UI_Armor")+ " %8",
	[round(_basePrice * 0.66)] call life_fnc_numberText,
	[_basePrice] call life_fnc_numberText,
	SEL(_vehicleInfo,8),
	SEL(_vehicleInfo,11),
	SEL(_vehicleInfo,10),
	if(EQUAL(_trunkSpace,-1)) then {"None"} else {_trunkSpace},
	SEL(_vehicleInfo,12),
	SEL(_vehicleInfo,9)
];

if((!isNil "life_CarPreview") AND (!isNull life_CarPreview)) then{
	deleteVehicle life_CarPreview;
};
life_CarPreview = _className createVehicleLocal (getPosATL player);
life_CarPreview setPos (player modelToWorld [3,9,0]);
life_CarPreview setDir ([life_CarPreview,player] call BIS_fnc_dirTo);
life_CarPreview enableSimulation false;
[life_CarPreview] spawn life_fnc_vehicleRotate;
life_CarCAMPreview = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_CarCAMPreview cameraEffect ["Internal","Back"];
life_CarCAMPreview camSetTarget (life_CarPreview modelToWorld [3,0,0]);
life_CarCAMPreview camSetPos (player modelToWorld [1,0,5]);
life_CarCAMPreview camSetFovRange [0.1,0.7];
life_CarCAMPreview camSetFocus [50,0];
life_CarCAMPreview camCommit 0;


_ctrl = CONTROL(2300,2304);
lbClear _ctrl;

if(!isClass (missionConfigFile >> CONFIG_LIGA_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};
//////////////////////TEXTUARR

_colorArray = [];
for [{_i=0},{_i<=(FETCH_CONST(life_donator))},{_i=_i+1}] do {
	ADD(_colorArray,M_CONFIG(getArray,CONFIG_LIGA_VEHICLES,_classNameLife,SEL(TEXTUARR,_i)));
};

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	if(EQUAL(SEL(life_veh_shop,2),_flag)) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	};
} foreach _colorArray;

if(_className in (LIGA_SETTINGS(getArray,"vehicleShop_rentalOnly"))) then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;