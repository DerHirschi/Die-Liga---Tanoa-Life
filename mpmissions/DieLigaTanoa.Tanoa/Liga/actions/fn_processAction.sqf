#include "..\..\Liga_script_macros.hpp"
/*
	╔══════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░║
	║░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░║
	║░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠══════════════════════════════════════════════════╝
	║ File: fn_processAction.sqf
	║ Author: Hirschi Liga-Life
	║ Progress Bar by Bryan "Tonic" Boardwine
	║
	║ Description:
	║ CRAFT CRAFT CRAFT and Proccesig   .. Fun with Arrays .... 
	╚══════════════════════════════════════════════════╝

	Da muss ich wohl noch mal ran ... Das geht noch besser
	
*/
private ["_vendor","_type","_single","_itweight","_sleepp","_itweight_ar","_zu_item","_cost","_hasLicense","_var","_craf_box",
			 "_multipli","_I_Inv_Type","_item_ar_weg","_item_ar_zu","_stk_ar_weg","_stk_ar_zu","_exitItem","_count_Stk","_anz_ar","_tank_trig",
			 "_count_item","_I_Inv","_Inv_amoun_ar","_ent"];

_exitItem = false;
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 	//by Tonic
_type = [_this,3,"",[""]] call BIS_fnc_param;							//by Tonic

if!(_type in ["moon","methy","kafmasch"]) then {
	if(isNull _vendor OR _type isEqualTo "" OR (player distance _vendor > 10)) exitWith {};	//by Tonic
	if(vehicle player != player) exitWith {hint "Steig aus du fauler Sack !!!";};
};	

if!(GVAR_MNS "lci_reb")then {
	_ent = switch(playerSide) do {
		case civilian 		: {"CIVpro"};
		case independent 	: {"UHRpro"};
	};
}else{
	_ent = "REBpro";
};
	_rezept 		= M_CONFIG(getArray,"LigaProcess",_ent,_type);
	
	_item_ar_weg 	= SEL(_rezept,0);	
	_stk_ar_weg 	= SEL(_rezept,1);	
	_item_ar_zu 	= SEL(_rezept,2);	
	_stk_ar_zu		= SEL(_rezept,3);	
	_I_Inv 			= SEL(_rezept,4);	
	_cost 			= SEL(_rezept,5);	
	_upp 			= SEL(_rezept,6);	
	_single		 	= SEL(_rezept,7);	
	_sleep_diff 	= SEL(_rezept,8);	
	_zu_item 		= SEL(_rezept,9);	
	_lic_check 		= SEL(_rezept,10);	
	
	_itweight_ar 	= [];
	_Inv_amoun_ar 	= [];
	_I_Inv_Type 	= [];
	_anz_ar 		= [];
	_multipli 		= 100;	
	_tank_trig 		= false;
	
	_sleepp 		= 0.3;						// Standart Zeit
		
		////// Zusatz Items  ///////
	if(EQUAL(_zu_item,"")) then {_var = 0;}else{
		_var = GVAR_MNS ([_zu_item,0] call life_fnc_varHandle);	
		if!(EQUAL(_var,0)) then {
			switch (_zu_item) do
			{
				case "ghy": { _stk_ar_zu = [1,3,1];	};
				case "a5": 	{ _item_ar_weg = ["a5"];	_stk_ar_weg = [5]; _stk_ar_zu = [2,1]; };
				case "a1": 	{ _item_ar_weg = ["a1","a3"];	_stk_ar_weg = [1,1]; _stk_ar_zu = [2]; };
			
				default {};
			};
		};
	};	
	////// Zusatz Items ENDE ///////	
	if(EQUAL(_type,"diamond1")) then {
		if(EQUAL((round random 1),1)) then {
			_stk_ar_zu 	= [1,1];
			_item_ar_zu = ["diamond","gsn"];
		};
	};
	/////// Lizens Vars holen wenn Check an ///////
	if(EQUAL(_lic_check,1)) then {
		/*
		if(_vendor in [mari_processor,coke_processor,heroin_processor]) then 	{	_hasLicense = true;} 				//by Tonic
		else {_hasLicense = GVAR_MNS (([_type,0] call life_fnc_licenseType) select 0);};		//by Tonic
		*/
		_hasLicense = GVAR_MNS (([_type,0] call life_fnc_licenseType) select 0);
	}else{_hasLicense = true;};
	/////// Lizens Vars holen wenn Check an ENDE ///////
		
	////////// I Inventar Typen Array erstellen //////////	
	if(EQUAL(_I_Inv,1)) then{	
	_i = 0;
		{
		private ["_I_type","_x"];		
			_I_type = switch (_x) do
			{
				// 0 = addItemCargoGlobal
				// 1 = addMagazineCargoGlobal
				// 2 = addWeaponCargoGlobal
				// 3 = addBackpackCargo
				// 9 = Error ausgabe nicht klassifiziert
				case "arifle_MX_SW_Black_F":{2;};
				case "arifle_MX_F":{2;};
				case "srifle_DMR_01_F":{2;};
				case "srifle_EBR_F":{2;};
				case "arifle_Katiba_GL_F":{2;};
				case "LMG_Mk200_F":{2;};
				case "LMG_Zafir_F":{2;};
				case "arifle_TRG21_F":{2;};
				case "srifle_DMR_03_F":{2;};
				
				case "200Rnd_65x39_cased_Box":{1;};
				case "100Rnd_65x39_caseless_mag":{1;};
				case "20Rnd_762x51_Mag":{1;};
				case "10Rnd_762x54_Mag":{1;};
				case "150Rnd_762x54_Box":{1;};
				case "30Rnd_556x45_Stanag":{1;};
				case "30Rnd_65x39_caseless_mag_Tracer":{1;};
				case "SmokeShell":{1;};				
				case "optic_LRPS":{0;};
				case "optic_SOS":{0;};
				case "optic_Hamr":{0;};
				case "optic_MRCO":{0;};
				case "Rangefinder":{0;};
				case "optic_DMS":{0;};
				case "muzzle_snds_M":{0;};
				case "bipod_01_F_blk":{0;};
				case "muzzle_snds_H":{0;};
				case "muzzle_snds_H_MG":{0;};
				case "HandGrenade_Stone":{0;};
		
				default {9;};
			};		
		if(EQUAL(_I_type,9)) exitWith{	
			hint "Es ist ein Fehler aufgetreten.. Bitte den Admin melden, was Du herstellen wolltest... Danke Dir... ";
			_exitItem = true;
	
		};
		_I_Inv_Type set [_i,_I_type];	
		_i = _i +1;	
		}	foreach _item_ar_zu;
	if(_exitItem) exitWith {};
	};
if(_exitItem) exitWith {};	
	////////// I Inventar Typen Array erstellen ENDE //////////		

////////////////////////////////////////  EXIT CHECKS ////////////////////////////////
	
	/////// Array Checks ( Config Check) and Counts
	_count_item = count _item_ar_weg;
	_count_Stk = count _stk_ar_weg;
	
	if(EQUAL(_count_item,0)) then {_exitItem = true;};  
	if(EQUAL(_count_Stk,0)) then {_exitItem = true;};  	
	
	_count_item = _count_item - _count_Stk;
	
	if!(EQUAL(_count_item,0)) then {_exitItem = true;};                  

if(_exitItem) exitWith { hint "Das Rezept hat ein Fehler .. bitte beim Admin melden .. Danke !!!";}; 	
	/////// Array Checks ( Config Check) and Counts ENDE
	
	/////// Genug dabei Check	
		_i = 0;		
	private ["_x","_ValChk","_Val","_multi"];																									// Index = 0
	{	
			
		if(EQUAL(_x,"a3")) then{ _Val = liga_leim_tank; _tank_trig = true;} else {	
			_Val = GVAR_MNS ([_x,0] call life_fnc_varHandle);		// Menge aus Inventar auslesen
		};
		_ValChk = SEL(_stk_ar_weg,_i);																	// Menge aus Rezept Array auslesen
		_itweight = ([_x] call life_fnc_itemWeight);
		_itweight = _itweight * _Val;
		_itweight_ar set [_i,_itweight];
		if(_x isEqualTo "a3") then{	_itweight_ar set [_i,0];};
		_Inv_amoun_ar set [_i,_Val];																			// Dann noch Inventar Mengen Array erstellen .. 
		_multi = _Val / _ValChk;																					// Multiplikator errechnen für jedes Item
		_multi = _multi - 0.5;																					// -0.49 um sicher zu gehen das auf nächste Ganzzahl abgerundet wird
		_multi = round _multi;																						// Runden
		if(_multi <= _multipli)	then {_multipli = _multi ;};											// den kleinsten Wert im Array ermitteln
		if !(_Val >= _ValChk) exitWith { _exitItem = true;};        								// und vergleichen ... Genug dabei ?
		if (EQUAL(_multi,0)) exitWith { _exitItem = true;};  													// Multiplikator = 0 dann raus ... 
		_i = _i + 1;																										// Index + 1
	} foreach _item_ar_weg;																						// Das ganze für jedes Item im Rezept Array	
	
if(_tank_trig && _exitItem) exitWith { hint "Der Leimtank ist leer oder Du hast nicht genug Material dabei ... Du musst  erst wieder neuen liefern !!!";}; 	
if(_exitItem) exitWith { hint "Du hast nicht genug Zeug dabei !!!";}; 	
	/////// Genug dabei Check	ENDE

	////// Verarbeitungs Zeit ausrechnen je nach mitgeführte Menge ///////
	_itweight = 0;											
	{
		_itweight = _itweight + _x;		
	}	foreach _itweight_ar;
	
	_slpVar = life_maxWeight / _itweight;
	_slpVar = 1 / _slpVar;
	_sleepp = _sleepp + _sleep_diff;
	_sleepp = _sleepp * _slpVar;
	////// Verarbeitungs Zeit ausrechnen je nach mitgeführte Menge ENDE ///////	
	
	////// Lizens gedööns /////////
	if !(_hasLicense) then {
		private ["_val"];
		_val = 0;
		_sleepp = _sleepp * 2.5;
		{ _val = _val + _x; } foreach _stk_ar_zu;
		_cost = _cost * _val;
		if(life_cash < _cost) exitWith { _exitItem = true; };
		life_cash = life_cash - _cost;
	};
if(_exitItem) exitWith { hint format["Du brauchst $%1, um ohne eine Lizenz verarbeiten zu können!",[_cost] call life_fnc_numberText];};  
	////// Lizens gedööns ENDE /////////
	
if(EQUAL(_single,1)) then { _multipli = 1;};			// Einzelverarbeitung

if!(EQUAL(_i,_count_Stk )) exitWith { hint"Fehler!! ... Bitte beim Admin melden... Danke fur deine Hilfe ...";};	 
////////////////////////////////////////  EXIT CHECKS ENDE ////////////////////////////////

//////////////////// Dann fang mal an zu Bauen .... WARTEN ///////////////
	/// Warten EXIT CHECKS ///
	
	//Setup our progress bar.             //Progress Bar by Bryan "Tonic" Boardwine
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = GVAR_UINS "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	
	life_is_processing = true;
	
		while{true} do
		{
			sleep _sleepp;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			_cP = _cP + 0.01;
			if(_cP >= 1) exitWith {};
			if!(_type in ["moon","methy","kafmasch"]) then {
				if(player distance _vendor > 10) exitWith {_exitItem = true; life_is_processing = false;	};
			};	
		};
	if (_exitItem) exitWith{life_is_processing = false; hint "Du musst in der naehe bleiben: 10m."; 5 cutText ["","PLAIN"];  };	
	life_is_processing = false;	
	if!(_type in ["moon","methy","kafmasch"]) then {
		if(player distance _vendor > 10) exitWith {hint "Du musst in der naehe bleiben: 10m."; 5 cutText ["","PLAIN"]; };
	};
	5 cutText ["","PLAIN"];	 
	
	/// Warten EXIT CHECKS ENDE ///
//////////////////// Dann fang mal an zu Bauen .... WARTEN ENDE ///////////////

///////////////////// Inventar abziehen ////////////////
		_i_1 = 0;
{		private ["_oldVal","_x","_oldVal_t"];		
		
		_oldVal = SEL(_stk_ar_weg,_i_1);
		_oldVal = _oldVal * _multipli;
		if!(EQUAL(_x,"a3")) then { 		
				if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {_exitItem = true;};
			}
			else
			{
				liga_leim_tank = liga_leim_tank - _oldVal; 	
				_oldVal_t = 0 - _oldVal;					
				[_oldVal_t] remoteExec ["TON_fnc_LeimWE",RSERV];	
			};
		if(_exitItem) exitWith {};
		_i_1 = _i_1 + 1;		
}	foreach _item_ar_weg;

	// Gewichts Check failed
if(_exitItem) exitWith { hint "Irgendwas laeuft mit den Gewichten deines Inventars schief !!!"; 5 cutText ["","PLAIN"];};
///////////////////// Inventar abziehen  ENDE ////////////////

///////////////////// Inventar dazu ////////////////
	// Z - Inventar //
if(EQUAL(_I_Inv,0)) then{	
	_i_2 = 0;
	{	private ["_newVal","_oldVal","_oldItem","_x"];		
		_newVal = _stk_ar_zu select _i_2;
		_newVal = _newVal * _multipli;
		if(!([true,_x,_newVal] call life_fnc_handleInv)) exitWith { 
			_oldItem = _item_ar_weg select _i_2;
			_oldVal = _stk_ar_weg select _i_2;
			_oldVal = _oldVal * _multipli;
			[true,_oldItem,_oldVal] call life_fnc_handleInv;		
			life_is_processing = false;
			_exitItem = true;
		};
		_i_2 = _i_2 +1;	
	}	foreach _item_ar_zu;	
	_i = 0;
	 {
		 _anz = [([_x,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		 _anz_ar set [_i,_anz]; 
		 _i = _i + 1; 
		 } foreach _item_ar_zu;
	
	if !(_hasLicense) then {	
		titleText[format["Du hast %1 für $%2 hergestellt..",_anz_ar,[_cost] call life_fnc_numberText],"PLAIN"]; 
	}else{
		titleText[format["Du hast %1 hergestellt...",_anz_ar],"PLAIN"];
	};	
}
	// Z - Inventar ENDE //
else
	// I - Inventar //
{	
	_craf_box = nearestObjects[getPos player,["land_metalcase_01_large_f"],8] select 0;
	sleep 0.2;
	_flare = "F_40mm_Green" createVehicle [0,0,0];
	_light = "Chemlight_green" createVehicle [0,0,0];
	_light attachTo [_craf_box,[0,0,0]];
	_flare attachTo [_craf_box,[0,0,0]];
	sleep 0.5;
	_i = 0;
	{	
		private ["_switch","_val_i"];
		_switch = _I_Inv_Type select _i;
		_val_i = _stk_ar_zu select _i;
		_val_i = _val_i * _multipli;
		
			switch(_switch) do 
			{
				// 0 = addItemCargoGlobal
				// 1 = addMagazineCargoGlobal
				// 2 = addWeaponCargoGlobal
				// 3 = addBackpackCargo
				// 9 = Error ausgabe nicht klassifiziert
				case 0:{_craf_box addItemCargoGlobal [_x, _val_i];};
				case 1:{_craf_box addMagazineCargoGlobal [_x, _val_i];};
				case 2:{_craf_box addWeaponCargoGlobal [_x, _val_i];};
				case 3:{_craf_box addBackpackCargo [_x, _val_i];};										// Backpacks mit Items füllen ... Später ..... 
				case 9:{			
					hint "Es ist ein Fehler aufgetreten.. Bitte den Admin melden, was Du herstellen wolltest... Danke Dir... ";
					_exitItem = true;

				};
				default {			
					hint "Es ist ein Fehler aufgetreten.. Bitte den Admin melden, was Du herstellen wolltest... Danke Dir... ";
					_exitItem = true;

				};
			};	
		if(_exitItem) exitWith {};		
		_i = _i + 1;	
		sleep 0.1;
	} foreach _item_ar_zu;	
if(_exitItem) exitWith {};			
};
	// I - Inventar ENDE //	

///////////////////// Inventar dazu Ende ////////////////
life_is_processing = false;

/*
╔═══════════════════════════════════════════════════════════════════════╗
║ Mach mit, mach nach, mach besser ...... Hirschi Die Liga - Liga-Life
╚═══════════════════════════════════════════════════════════════════════╝
*/