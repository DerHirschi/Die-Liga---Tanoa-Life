//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	IgiLoad v0.9.10_RC_e_(Arma3_1.32)																		//
//	Version info: This is not official version of IgiLoad it is only WIP (RC)								//
//	Author: Igi_PL		
// Edited: H1rsch1 - D1e L1ga																					//
//	Web: http://www.igipl.net/																				//
//	Version date: 2014.10.16																				//
//																											//
//	USE:																									//
//	1. In mission "init.sqf" add line: "0 = execVM "IgiLoad\IgiLoadInit.sqf";".								//
//	2. In vehicles "INITIALIZATION" field type: "0 = [this] execVM "IgiLoad\IgiLoad.sqf";"					//
//	3. Unload from script or trigger:																		//
//		a) Unloading cargo from script. Force unload: "0 = [Car, true, "L"] spawn IL_Do_Unload;"			//
//		b) Unloading cargo from script. Force unload: "0 = [Car, true] spawn IL_Do_Unload;"					//
//		c) Unloading cargo from script. Force unload: "0 = [Car] spawn IL_Do_Unload;"						//
//	4. Loading cargo from script. Force load: "0 = [Car, [typeOf Box], "B", true, Box] spawn IL_Do_Load;"	//
//																											//
//	Ways from points 1 and 2 can not be used simultaneously!!!												//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
 private ["_null"];
 { 
	if !(_x in vehicles) then 	
	{							
		IL_Veh_Array = IL_Veh_Array - [_x]; 
	}; 
	
} forEach (IL_Veh_Array),
			

{
	if (((typeOf _x) in (IL_Supported_Vehicles_All)) && !(_x in IL_Veh_Array)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] execVM "scripts\IgiLoad\IgiLoad.sqf";
		waitUntil {scriptDone _null};
		};
} forEach (vehicles);	
