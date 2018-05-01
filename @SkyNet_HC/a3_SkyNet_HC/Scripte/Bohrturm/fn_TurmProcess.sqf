#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*
	╔═════════════════════════════════════════════════════╗
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
	║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
	║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
	║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
	║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
	║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
	╠═════════════════════════════════════════════════════╝
	║ File: fn_TurmProcess.sqf
	║ Author: Hirschi - Die Liga
	╚═════════════════════════════════════════════════════╝
				   Procc,Gas
	SteuerArray [false,false,0]
	
				   Procc,Gas	,Gasrate,Ölrate
	SteuerArray [false,false,0,0]
*/
private ["_slot","_strData","_objArray","_workObArr","_n","_itemval","_itemval2",
		 "_item2","_item","_weight","_itemWeight","_sum","_val"];


for "_i" from 1 to 5 do {
	_slot 		= format ["LigaBohrturm_%1",_i];	
	_strData 	= profileNamespace GVAR [(_slot + "_steu"),""];
	_objArray	= profileNamespace GVAR [(_slot + "_ObjArr"),""];
	_workObArr	= [];
	_n			= 1;

	diag_log "Start";
	diag_log str _slot;
	diag_log str _strData;
	diag_log str _objArray;
	if!(EQUAL(_strData,"") || EQUAL(_objArray,"")) then {
		{	// Objekte Tanks usw in Array  
			if( EQUAL(typeOf _x,"Land_Research_house_V1_F")	) then { 
				_workObArr set[0,_x]; 
			};				
			if( EQUAL(typeOf _x,"Land_Tank_rust_F")	) then {
				_workObArr set[_n,_x]; 
				_n = 2;
			};				
		}forEach _objArray;
		

		if(EQUAL(count _workObArr,3)) then {
			if(SEL(_strData,0)  ) then {	//Processing

				/*	Öl & Gas dazu */			
				_item 			= "oilu";
				//_itemval 		= 10;
				_itemval 		= SEL(_strData,3);
				_item2 			= "rig";
				//_itemval2 		= 6;
				_itemval2 		= SEL(_strData,2);
				
				for "_z" from 1 to 2 do {
					private["_space","_vInv","_items","_itemIndex"];
					if((SEL(_workObArr,_z) GVAR ["trunk_in_use",false])) exitWith {};
					SEL(_workObArr,_z)  SVAR ["trunk_in_use",true,true]; 
					_vInv 			= SEL(_workObArr,_z) GVAR ["Trunk",[[],0]];						
					_items 			= SEL(_vInv,0);
					_space 			= SEL(_vInv,1);
					_itemIndex 		= [_item,_items] call TON_fnc_index;				
				
					diag_log str _space;
					_weight 		= [SEL(_workObArr,_z)] call life_fnc_vehicleWeight;
					_sum 			= [_item,_itemval,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
					_itemWeight		= 0;
					if!(_sum < 1) then{				
						_itemWeight = ([_item] call life_fnc_itemWeight) * _itemval;
						if(EQUAL(_itemIndex,-1)) then {
							_items pushBack [_item,_itemval];
						} else {
							_val 	= _items select _itemIndex select 1;
							_items set[_itemIndex,[_item,_val + _itemval]];
						};		
						
						_space 		= _space + _itemWeight;
						diag_log str _itemWeight;
						diag_log str _space;
					};
					_itemIndex 		= [_item2,_items] call TON_fnc_index;				
					_sum 			= [_item2,_itemval2,_weight select 1,_weight select 0] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight.. 
					if!(_sum < 1) then {					
						_itemWeight = ([_item2] call life_fnc_itemWeight) * _itemval2;
						diag_log str _itemWeight;
						diag_log str _space;
						if(EQUAL(_itemIndex,-1)) then {
							_items pushBack [_item2,_itemval2];
						} else {
							_val 	= _items select _itemIndex select 1;
							_items set[_itemIndex,[_item2,_val + _itemval2]];
						};		
						_space 		= _space + _itemWeight;
					};
					uiSleep 0.5;
					//diag_log str _itemWeight;
					//diag_log str _space;
					SEL(_workObArr,_z) SVAR["Trunk",[_items,_space],true];					
					SEL(_workObArr,_z) SVAR ["trunk_in_use",false,true]; 
				};			
			};	
			if(SEL(_strData,1)) then {	//Gas abfackeln
				_item 		= "rig";

				for "_g" from 1 to 2 do {
					private["_space","_vInv","_items","_itemIndex"];
					if((SEL(_workObArr,_g) GVAR ["trunk_in_use",false])) exitWith {};
					SEL(_workObArr,_g)  SVAR ["trunk_in_use",true,true]; 
					_vInv 		= SEL(_workObArr,_g) GVAR ["Trunk",[[],0]];
					_itemIndex 	= [_item,SEL(_vInv,0)] call TON_fnc_index;
					if(EQUAL(_vInv,[]) || EQUAL(_itemIndex,-1) ) exitWith {
						SEL(_workObArr,_g)  SVAR ["trunk_in_use",false,true];
						[SEL(_workObArr,_g),false]call LIGA_fnc_burnTurm;
					};		
			
					_items 		= SEL(_vInv,0);
					_space 		= SEL(_vInv,1);
					
					_val 		= _items select _itemIndex select 1;
					_itemval 	= _val;
					if(_val <= 2) exitWith {SEL(_workObArr,_g) SVAR ["trunk_in_use",false,true]; };			
					_weight 	= [SEL(_workObArr,_g)] call life_fnc_vehicleWeight;
					_itemWeight = ([_item] call life_fnc_itemWeight) * _itemval;			
					_items set[_itemIndex,[_item,_val - _itemval]];		
					SEL(_workObArr,_g) SVAR["Trunk",[_items,_space - _itemWeight],true];				
					SEL(_workObArr,_g) SVAR ["trunk_in_use",false,true];	
					diag_log str _itemWeight;
					diag_log str _space;
				};
			};			
		[SEL(_workObArr,0)]call LIGA_fnc_updateTurm;
		};		
	};	
	uiSleep 1;
};
