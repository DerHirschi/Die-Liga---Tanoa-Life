private["_zelt","_obj","_mode"];
_zeug = [["RoadBarrier_F","mauer"],["Land_PortableLight_double_F","strahler"],["RoadCone_L_F","kegel"],["Land_TentA_F","17"],["CamoNet_BLUFOR_F","14"],["Land_CampingChair_V1_f","b22"],["Land_CampingChair_V2_f","b23"],["Land_WaterBarrel_F","16"]];
//   0 = Mauer
//   1 = Strahler
//   2 = Kegel
//   3 = Zelt
//   4 = Tarnnetz
//   5 = Campingstuhl 1
//   6 = Campingstuhl 2
//   7 = Maischefass
/*
    File: fn_packupZelt.sqf  
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz
    Edited by: Hirschi - Die Liga

    Description:
    Packs up a deployed wall.
*/
_mode = _this select 0;
_obj = (_zeug select _mode) select 0;
_inv = (_zeug select _mode) select 1;
_zelt = nearestObjects[getPos player,[_obj],3] select 0;
if(isNil "_zelt") exitWith {};

if(([true,_inv,1] call life_fnc_handleInv)) then
{
    titleText["Du hast das Teil abgebaut ","PLAIN"]; 
    deleteVehicle _zelt;
};