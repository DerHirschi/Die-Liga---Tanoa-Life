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
║ File: fn_RestartClean.sqf
║ Author: Hirschi Liga-Life
║
║ Description:
║ Cleanup vor Restart 
╚══════════════════════════════════════════════════╝
*/
private["_dam_ar","_query","_repcount","_tuv"];



diag_log "╠═══════════════════════════════════════════════╣";
diag_log "║ Restart Cleanup gestartet !!!!!";
diag_log "║ Vehicle Dam - Restart Cleanup gestartet !!!!!";


{
	_veh = _x;
	_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");
	
	if(_vehicleClass in ["Car","Air","Ship"]) then
	{
		_dbInfo = _veh getVariable["dbInfo",[]];
		_repcount = _veh getVariable["tuv",[]];
		//_units = {(_x distance _veh < 3000)} count playableUnits;
		
					
		if(count _dbInfo > 0) then
		{	
			_dam_ar = [_x] call TON_fnc_getHit; 			
			if(count _repcount isEqualTo 0) then {_repcount = 0;_tuv = 0;}else{_tuv = _repcount select 0;_repcount = _repcount select 1;};
			//systemChat "Fixing...";
			_uid = _dbInfo select 0;
			_plate = _dbInfo select 1;
			//_query = format["UPDATE vehicles SET damage='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_dam_ar];
			_query = format["vehicleUpdateActivePlate:1:%1:%2:%3:%4:%5",_uid,_plate,_dam_ar,_repcount,_tuv];
	
			[_query,1] call DB_fnc_asyncCall;
		};		
	};
} foreach vehicles;

diag_log "║ Vehicle Dam - Restart Cleanup beendet !!!!!";
diag_log "╠═══════════════════════════════════════════════╣";
diag_log "║ Starte WH Save !!!!!";


	{
		diag_log format["║ WH Save- %1  gestartet !!!!!",_x];
	//	diag_log format["║ QUERRY : %1",(GVAR_MNS [_x,[]])];
		_query 			= format["WHset:%1:%2",_x,missionNamespace getVariable  _x];	
		_query 			= [_query,1] call DB_fnc_asyncCall;
			
	}forEach ["liga_wh_1","liga_wh_2","liga_wh_3","liga_wh_4"];
	diag_log "║ ";
	diag_log "║ WH Save - Restart Cleanup beendet !!!!!";

//diag_log "║ Leimtank Save- Restart Cleanup gestartet !!!!!";
		
//liga_leim_trig = true;
//_query = format["UPDATE ligaworld SET leim='%1' ",liga_leim_tank];
//_query = format["LeimSave:%1:%2:%3",liga_leim_tank,liga_staa_tank,liga_civ_tank];
/*

	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║---------  Leimtank  akt DB LOG    ----------";
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log format["║ Liga - Baustellen  Query: %1",_query];
	diag_log format["║ Liga - Baustellen _var: %1",liga_leim_tank];
	diag_log "╠══════════════════════════════════════════════════╣";
*/
//waitUntil{sleep (random 0.3); !DB_Async_Active};
//[_query,1] call DB_fnc_asyncCall;
//liga_leim_trig = false;

	
//diag_log "║ Leimtank Save- Restart Cleanup beendet !!!!!";

if!(	
	isNil "allgewinner" || 	
	isNil "gewinner3" || 	
	isNil "gewinner4" || 	
	isNil "gewinner5" ||
	!(LottoDay isEqualTo 3)
)then {
	diag_log "╠═══════════════════════════════════════════════╣";
	diag_log "║ Lotto Pod Save Start !!!!!";
	private ["_LottoPod"];
	_LottoPod	= ((["LottoGetPod",2] call DB_fnc_asyncCall) select 0);
	diag_log format["║ _LottoPod		: %1",_LottoPod];
	_potteiler3 = count gewinner3;
	_potteiler4 = count gewinner4;
	_potteiler5 = count gewinner5;
	
	
	for "_i" from 3 to 5 do {
		{
			if(_x in allgewinner) then {
				allgewinner deleteAT ( allgewinner find _x );
				_LottoPod = _LottoPod + ((missionNamespace getVariable (format["Pot%1",_i])));
			};
		}forEach (missionNamespace getVariable (format["gewinner%1",_i]));
	};
	diag_log format["║ _LottoPod SUM	: %1",_LottoPod];
	[(format["LottoSetPod:%1",_restPod]),1] call DB_fnc_asyncCall;
	
	
	diag_log "║ Lotto Pod Save Ende !!!!!";
	diag_log "╠═══════════════════════════════════════════════╣";
};

diag_log "║ Restart Cleanup beendet !!!!!";
diag_log "╚═══════════════════════════════════════════════╝";
