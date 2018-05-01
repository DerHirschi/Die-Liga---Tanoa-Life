#include "..\Liga_script_macros.hpp"
/*
	File: fn_variableCheck.sqf
	Edit: Hirschi - Die Liga
	
	Description:
	Checks against harmful variables, disable this if client-performance is 
	to bad in the fn_initSpy.sqf, the menuCheck should be good enough!
*/
private["_BIS_Functions","_LIFE_Functions","_SERVER_Functions","_SOCK_Functions","_LIGACL_Functions","_SPY_Functions","_find","_var",
		"_IL_Variables","_LIGA_Variables","_FNC_Functions","_LIFE_Variables","_BIS_Variables","_DB_Functions","_LIGAFN_Functions","_LIGA_Functions","_IL_Functions","_KRON_Functions",
		"_allowedVariables","_not","_trig","_checkFunction","_BIS_UI_Functions","_allowedVariables_UI","_check","_profileCount"];

#define SKY_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "SkyNetFLT" >> SETTING)

	
_BIS_Functions 			= SKY_SETTINGS(getArray,"BIS_Functions");
_BIS_Variables 			= SKY_SETTINGS(getArray,"BIS_Variables");

_BIS_UI_Functions 		= SKY_SETTINGS(getArray,"BIS_UI_Functions");
_LIFE_Functions 		= SKY_SETTINGS(getArray,"LIFE_Functions");
_LIFE_Variables 		= SKY_SETTINGS(getArray,"LIFE_Variables");

_SERVER_Functions 		= SKY_SETTINGS(getArray,"SERVER_Functions");
_SOCK_Functions 		= SKY_SETTINGS(getArray,"SOCK_Functions");
_DB_Functions 			= SKY_SETTINGS(getArray,"DB_Functions");
_FNC_Functions 			= SKY_SETTINGS(getArray,"FNC_Functions");

_LIGAFN_Functions 		= SKY_SETTINGS(getArray,"LIGAFN_Functions");
_LIGACL_Functions 		= SKY_SETTINGS(getArray,"LIGACL_Functions");

_SPY_Functions 			= SKY_SETTINGS(getArray,"SPY_Functions");
_LIGA_Functions			= SKY_SETTINGS(getArray,"LIGA_Functions");
_LIGA_Variables			= SKY_SETTINGS(getArray,"LIGA_Variables");

_IL_Functions			= SKY_SETTINGS(getArray,"IL_Functions");
_IL_Variables			= SKY_SETTINGS(getArray,"IL_Variables");

_KRON_Functions			= SKY_SETTINGS(getArray,"KRON_Functions");

_allowedVariables 		= SKY_SETTINGS(getArray,"allowedVariables");
_allowedVariables_UI 	= SKY_SETTINGS(getArray,"allowedVariables_UI");
_profileCount 			= count allVariables profileNameSpace;

_check = [];
_not = [];
_trig = true;

/* Build Player Slots because we name them and they are counted as variables */
for "_i" from 1 to 125 do {
	if(_i < SKY_SETTINGS(getNumber,"civSlotNumber")) then {_allowedVariables pushBack [format["civ_%1",_i],"OBJECT"]};
	if(_i < SKY_SETTINGS(getNumber,"copSlotNumber")) then {_allowedVariables pushBack [format["cop_%1",_i],"OBJECT"]};
	if(_i < SKY_SETTINGS(getNumber,"medSlotNumber")) then {_allowedVariables pushBack [format["medic_%1",_i],"OBJECT"]};
	if(_i < SKY_SETTINGS(getNumber,"alacSlotNumber")) then {_allowedVariables pushBack [format["alac_%1",_i],"OBJECT"]};
};


/* First lets clear out the memory of potentially bad variables */


{	
	if((EQUAL(SEL(_x,1),"ARRAY")) || (EQUAL(SEL(_x,1),"CODE"))) then {
		
		_allowedVariables pushBack [toLower(SEL(_x,0)),SEL(_x,1)];
		
	}else{	
		
		_var = toLower(SEL(_x,0));
		if(!isNil _var) then {
			_varType = typeName(GVAR_MNS _var);
			_allowedVariables pushBack [_var,_varType]; 

		}else{
			_check pushBack _var;
		};
	};		
}forEach _this;
uiSleep 20;
	{
		if(!(_x in _LIFE_Functions)) then {
			
				if(!(_x in _BIS_Functions)) then {		
							
						if(!(_x in _SERVER_Functions)) then {
							if(!(_x in _SOCK_Functions)) then {
								if(!(_x in _DB_Functions)) then {
									if(!(_x in _FNC_Functions)) then {
																			
											if(!(_x in _LIGAFN_Functions)) then {
												if(!(_x in _LIGA_Functions)) then {
													if(!(_x in _IL_Functions)) then {
														
															if(!(_x in _KRON_Functions)) then {						
																if(!(_x in _LIGACL_Functions)) then {						
																	if(!(_x in _SPY_Functions)) then {													
																		if(!(_x in _BIS_UI_Functions)) then {
																			_varType = typeName (GVAR_UINS _x);
																			_find = (_allowedVariables + _IL_Variables + _LIFE_Variables + _LIGA_Variables + _not + _BIS_Variables) find [_x,_varType];
																			if(EQUAL(_find,-1)) then {
																				SVAR_UINS [_x,nil];
																			};
																		};
																	};
																};
															};
														
													};
												};	
											};
										
									};
								};	
							};
						};
					
				};
			
		};
	} foreach (allVariables uiNamespace);

	{
		if(!(_x in _LIFE_Functions)) then {			
			if(!(_x in _BIS_Functions)) then {							
				if(!(_x in _SERVER_Functions)) then {
					if(!(_x in _SOCK_Functions)) then {
						if(!(_x in _DB_Functions)) then {
							if(!(_x in _FNC_Functions)) then {																				
								if(!(_x in _LIGAFN_Functions)) then {
									if(!(_x in _LIGA_Functions)) then {
										if(!(_x in _IL_Functions)) then {														
											if(!(_x in _KRON_Functions)) then {						
												if(!(_x in _LIGACL_Functions)) then {						
													if(!(_x in _SPY_Functions)) then {													
														if(!(_x in _BIS_UI_Functions)) then {											
															_varType = typeName (GVAR_MNS _x);
															_find = (_allowedVariables + _IL_Variables + _LIFE_Variables + _not + _LIGA_Variables + _BIS_Variables) find [_x,_varType];
															if(EQUAL(_find,-1)) then {
											
																if(_x in _check) then {
																	_allowedVariables pushBack [_x,_varType];
																	_d = _check deleteAt (_check find _x);
																}else{					
																	if((["_antiantihack_rndvar",_x] call BIS_fnc_inString) && _trig ) then {_allowedVariables pushBack [_x,_varType]; _trig = false;}else{
																		[profileName,steamid,"unerlaube VAR im MNS !!!..",(format["Var-Name %1  TYPE %2 VAL %3",_x,_varType,(GVAR_MNS _x)]),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
																		SKYNET_END
																	};																	
																};																
															};
														};
													};
												};
											};
										};
									};
								};	
							};
						};
					};	
				};
			};
		};
	} foreach allVariables missionNamespace;	
	
	
/* Some people may be like WTF ALL DEM Checks... It was either this or lazy eval which could have a performance impact on the client. */
_checkFunction = {
	{
		if(!(_x in _LIFE_Functions)) then {			
			if(!(_x in _BIS_Functions)) then {							
				if(!(_x in _SERVER_Functions)) then {
					if(!(_x in _SOCK_Functions)) then {
						if(!(_x in _DB_Functions)) then {
							if(!(_x in _FNC_Functions)) then {																				
								if(!(_x in _LIGAFN_Functions)) then {
									if(!(_x in _LIGA_Functions)) then {
										if(!(_x in _IL_Functions)) then {														
											if(!(_x in _KRON_Functions)) then {						
												if(!(_x in _LIGACL_Functions)) then {						
													if(!(_x in _SPY_Functions)) then {													
														if(!(_x in _BIS_UI_Functions)) then {											
															_varType = typeName (GVAR_MNS _x);
															_find = (_allowedVariables + _IL_Variables + _LIFE_Variables + _not + _LIGA_Variables + _BIS_Variables) find [_x,_varType];
															if(EQUAL(_find,-1)) then {
																if(_x in _check) then {
																	_allowedVariables pushBack [_x,_varType];
																	_d = _check deleteAt (_check find _x);
																	[profileName,steamid,"INFO ... Variable hinzugefügt.. INFO",(format["Var-Name %1  TYPE %2 VAL %3",_x,_varType,(GVAR_MNS _x)])] remoteExec ["SPY_fnc_cookieJar",RSERV];
																}else{					
																	if((["_antiantihack_rndvar",_x] call BIS_fnc_inString) && _trig ) then {
																		_allowedVariables pushBack [_x,_varType]; _trig = false;
																	}else{
																		[profileName,steamid,"unerlaube VAR im MNS !!!..",(format["Var-Name %1  TYPE %2 VAL %3",_x,_varType,(GVAR_MNS _x)]),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
																		
																		SKYNET_END
																		_not pushBack [_x,_varType];
																	};
																};															
															};
														};
													};
												};
											};
										};
									};
								};	
							};
						};
					};	
				};
			};
		};
	} foreach allVariables missionNamespace;
};

_uiCheckFunction = {
	{
		if(!(_x in _LIFE_Functions)) then {
			
				if(!(_x in _BIS_Functions)) then {		
							
						if(!(_x in _SERVER_Functions)) then {
							if(!(_x in _SOCK_Functions)) then {
								if(!(_x in _DB_Functions)) then {
									if(!(_x in _FNC_Functions)) then {
																				
											if(!(_x in _LIGAFN_Functions)) then {
												if(!(_x in _LIGA_Functions)) then {
													if(!(_x in _IL_Functions)) then {
														
															if(!(_x in _KRON_Functions)) then {						
																if(!(_x in _LIGACL_Functions)) then {						
																	if(!(_x in _SPY_Functions)) then {													
																		if(!(_x in _BIS_UI_Functions)) then {											
																			_varType = typeName (GVAR_UINS _x);
																			_find = (_allowedVariables + _IL_Variables + _LIFE_Variables + _LIGA_Variables + _BIS_Variables) find [_x,_varType];
																			if(EQUAL(_find,-1)) then {
																				_not pushBack [_x,_varType];
																				[profileName,steamid,"unerlaube VAR im UINS !!!..",(format["Var-Name %1  TYPE %2 VAL %3",_x,_varType,(GVAR_MNS _x)]),player] remoteExec ["SPY_fnc_cookieJar",RSERV];
																				SKYNET_END											
																			};
																		};
																	};
																};
															};
															
													};
												};
											};	
										
									};
								};
							};	
						};
					
				};
			
		};
	} foreach allVariables uiNamespace;
};

_i = 1;
	while {true} do {		
		objNull call _checkFunction;
		uiSleep 10;		
		objNull call _uiCheckFunction;
		if(!(EQUAL((count allVariables profileNameSpace),_profileCount)) OR ((count allVariables parsingNamespace) > 0)) then 													
		{
			[profileName,steamid,"VAR COUNT profNS ...","neue Variable in prfNS erkannt"] remoteExec ["SPY_fnc_cookieJar",RSERV];
			SKYNET_END
		};
			if(liga_first) then {
				uiSleep (_i * 60);
			}else{
				uiSleep ((_i + 3) * 60); 
			};	
		_i = _i + 1;
	};
