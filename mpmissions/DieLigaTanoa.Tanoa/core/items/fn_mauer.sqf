private["_position","_mauer","_mode"];
_zeug = ["RoadBarrier_F","Land_PortableLight_double_F","RoadCone_L_F","Land_TentA_F","CamoNet_BLUFOR_F","Land_CampingChair_V1_f","Land_CampingChair_V2_f","Land_Ammobox_rounds_F"];
//   0 = Mauer
//   1 = Strahler
//   2 = Kegel
//   3 = Zelt
//   4 = Tarnnetz
//   5 = Campingstuhl 1
//   6 = Campingstuhl 2
//   7 = Feuerwerk
/*
    File: fn_mauer.sqf
    Author: OLLI aka Hauklotz
	Edit by Hirschi - Die Liga
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
closeDialog 0;
_mode = _this select 0;
_obj = _zeug select _mode;
_mauer = _obj createVehicle [0,0,0];
_mauer attachTo[player,[0,5.5,0.2]];
_mauer allowDamage true;
_mauer setDir 90;



life_action_mauerDeploy = player addAction["<t color='#00FF00'>Aufstellen</t>",{if(!isNull life_mauer) then {detach life_mauer; life_mauer = ObjNull;}; player removeAction life_action_mauerDeploy; life_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull life_mauer'];
life_mauer = _mauer;
waitUntil {isNull life_mauer};
if(!isNil "life_action_mauerDeploy") then {player removeAction life_action_mauerDeploy;};
if(isNull _mauer) exitWith {life_mauer = ObjNull;};
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
if(_mode in [0]) then {
	_mauer allowDamage false;
};
if(_mode isEqualTo 7) then {
	_mauer setVariable ["FireWo",true,true];
	[_mauer] remoteExec ["LIGACL_fnc_addFWaction",-2];	
}else{
	_mauer setVariable["item","mauerDeployed",true];
};