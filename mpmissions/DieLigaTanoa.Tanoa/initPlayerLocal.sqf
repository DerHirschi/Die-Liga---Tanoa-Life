/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/

life_adminlevel = nil;life_coplevel = nil;life_donator = nil;
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
player allowDamage 	false;
enableRadio 		false;
enableSentences 	false;
enableEnvironment 	false;
if(!hasInterface) exitWith {"BIS_fnc_MP_packet" addPublicVariableEventHandler {};};//This is a headless client, he doesn't need to do anything but keep being headless..
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
enableEnvironment 	true;
setTerrainGrid 50;
setViewDistance 1000;
setObjectViewDistance [800,50];
0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
0 fadeSound 0;
//0 fadeSound 0;
//onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
 
//[] execVM "SpyGlass\fn_initSpy.sqf";


// Sonnenbrillen Effekt 
//if (isNil {GAM_ppEffectsGoggles}) then {GAM_ppEffectsGoggles = compile preProcessFileLineNumbers 'scripts\GAM_ppEffectsGoggles.sqf'; GAM_ppEffectsGogglesInit = [false, true, 10] spawn GAM_ppEffectsGoggles};

life_blacklisted 	= 0;
liga_cop_on 		= false;
liga_lrk_on 		= false;

//pb_positionen = [[22949.8,17097.9,0],[22921.3,17073.7,0.02],[22901.9,17097.1,0.002],[22877.3,17082.8,0.00144],[22897.9,17068,0.00144],[22880,17018.7,0.00144],[22868.6,17013.6,0.00144],[22916,17036.6,0.00144],[22928.7,17023.9,0.0014],[22922.2,17063.7,0.00144],[22912.2,17089.6,0.0014]];
//joinmode = 0;

[] execVM "core\init.sqf";

