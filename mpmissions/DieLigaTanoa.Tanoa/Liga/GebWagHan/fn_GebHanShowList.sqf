#include "..\..\Liga_script_macros.hpp"

/*
	Author: Hirschi - Die Liga
*/
private["_inArr","_control","_vehicleInfo"];
_mode	= [_this,0,0 ,[0] ] call BIS_fnc_param;

disableSerialization;

switch (_mode) do {
	case 0: {
		if(dialog) exitWith { closeDialog 0;};
		if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};		
		ctrlSetText [2301,"Gebrauchtwagenhandel"];
		ctrlSetText [2330,""];
		_control = CONTROL(2300,2302);
		lbClear _control; //Flush the list.
		ctrlEnable 	[2304,false];
		ctrlEnable 	[2333,false];
		ctrlShow 	[2304,false];
		ctrlShow 	[2333,false];
		
		ctrlEnable 	[2309,false];
		ctrlShow 	[2309,false];
		
		[player] remoteExec ["TON_fnc_GebHanGetQ",RSERV];
	};
	case 1: {
		
		_inArr 	 = [_this,1,[],[[]]] call BIS_fnc_param;
		_control = CONTROL(2300,2302);

		{
			_id		 		= SEL(_x,0);
			_className 		= SEL(_x,1);
			_basePrice 		= SEL(_x,2);
			
			//ctrlSetText [2330,format["%1 $",[_basePrice] call life_fnc_numberText]];
			ctrlSetText [2330,""];
			_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
			_control lbAdd (SEL(_vehicleInfo,3) + ( format[" - $ %1",[_basePrice] call life_fnc_numberText ] )  );			
			//_control lbSetPicture [(lbSize _control)-1,SEL(_vehicleInfo,2)];
			_pic = SEL(_vehicleInfo,2);
			if!(_pic in ["pictureStaticObject","picturething"]) then {
				_control lbSetPicture [(lbSize _control)-1,_pic];
			};			
			_control lbSetData [(lbSize _control)-1,str _basePrice];
			_control lbSetValue [(lbSize _control)-1,_id];
			
		} foreach _inArr;		
		
	};	
	case 2: {
		if((lbCurSel 2302) isEqualTo -1) exitWith {};

		_data 	= lbData  [2302, (lbCurSel 2302)] ;
		_val 	= lbValue [2302, (lbCurSel 2302)] ;
		_data	= call compile format["%1",_data];
		_val	= call compile format["%1",_val];
		//ctrlSetText [2330,format["%1 $",[_data] call life_fnc_numberText]];
		
		[player,_val] remoteExec ["TON_fnc_GebHanGetDet",RSERV];
		
	};
	case 3: {
		
		_inArr 	 = [_this,1,[],[[]]] call BIS_fnc_param;
		if( EQUAL(count _inArr,0)	) exitWith {};
		_vehicleInfo = [SEL(_inArr,1)] call life_fnc_fetchVehInfo;
		_trunkSpace  = [SEL(_inArr,1)] call life_fnc_vehicleWeightCfg;
		ctrlSetText [2330,format["%1",SEL(_vehicleInfo,3) ]];
		
		(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
		
			("Kaufpreis: ")+ " <t color='#8cff9b'>$%1</t><br/>" +
			(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>" +
			(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>" +
			(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" +
			(localize "STR_Shop_Veh_UI_Trunk")+ " %5<br/>" +
			(localize "STR_Shop_Veh_UI_Fuel")+ " %6<br/>" +
			(localize "STR_Shop_Veh_UI_Armor")+ " %7<br/>" +
			"TÜV :"+ " %8<br/>" +
			"Reparaturen :"+ " %9",
			
			[SEL(_inArr,0)] call life_fnc_numberText,
			SEL(_vehicleInfo,8),
			SEL(_vehicleInfo,11),
			SEL(_vehicleInfo,10),
			if(EQUAL(_trunkSpace,-1)) then {"None"} else {_trunkSpace},
			SEL(_vehicleInfo,12),
			SEL(_vehicleInfo,9),
			SEL(_inArr,3),
			SEL(_inArr,4)
		];

		//buttonSetAction [2309,  " [player, ( call compile format['%1',( lbValue [2302, (lbCurSel 2302)] )] ) ] remoteExec ['TON_fnc_GebHanBuy',2];  "];
		ctrlEnable 	[2309,true];
		ctrlShow 	[2309,true];
	};
};