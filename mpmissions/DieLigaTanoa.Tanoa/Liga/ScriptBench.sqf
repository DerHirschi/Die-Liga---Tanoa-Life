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
║	File: ScriptBench.sqf
║	Author: Hirschi Liga-Life.de
║
║ Beschreibung: Client - FPS Log
╚══════════════════════════════════════════════════╝	
*/	

		private ["_timeStamp","_timeStampAll","_n","_n1","_ara","_fps","_fps16","_minfps16","_sqf"];
		closeDialog 0;
		
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║ Liga Client - FPS Log gestartet !!";
		diag_log "╠══════════════════════════════════════════════════╣";
		diag_log "║ Sek. -  N -   FPS  - FPS/16 - minFPS16- aSQF";
		_timeStamp = diag_tickTime;
		_timeStampAll = diag_tickTime;
		_ara = [];
		_n1 = 0;
		while {true} do {			
			_sqf = count diag_activeSQFScripts;
			_ara set [_n1,[(_n1 +1),diag_frameNo,diag_fps,diag_fpsMin,_sqf]];
			_n1 = _n1 + 1;
			diag_log format [" %1 - %2 -  %3 - %5 - %6 - %4 - %7",(diag_tickTime) - _timeStamp,_n1,diag_frameNo,_sqf,diag_fps,diag_fpsMin,(count playableUnits)];
			_timeStamp = diag_tickTime;			
			if ((diag_tickTime - _timeStampAll) >= 500) exitWith {};
			sleep 0.5;		
		};
		_n = 0;
		{
			if (_n == 0) then {
					_fps =  _x select 0;
					_fps16 = _x select 1;
					_minfps16 = _x select 2;
					_sqf = _x select 3;
				};
				_fps =  _fps + (_x select 0);
				_fps16 = _fps16 + (_x select 1);
				_minfps16 = _minfps16 + (_x select 2);
				_sqf = _sqf +(_x select 3);			
			_n = _n +1;
		} foreach _ara;
		
		_n = count _ara;		
		_fpsschn = _fps / _n;
		_fpsschn16 = _fps16 /_n;
		_minfpsschn16 = _minfps16 / _n;
		_sqfschn = _sqf / _n;
		
	hint format ["Client FPS Log beendet ! N %1   FPS Schnitt %2   FPS16 Schnitt %4  minFPS16 %5  Activ SQF Schnitt %3",_n1,_fpsschn,_sqfschn,_fpsschn16,_minfpsschn16];
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log format ["║ Client FPS Log beendet ! N %1  - FPS Schnitt %2  - FPS16 Schnitt %4 - minFPS16 %5  - Activ SQF Schnitt %3",_n1,_fpsschn,_sqfschn,_fpsschn16,_minfpsschn16];
	diag_log format ["║ _Array: %1",_ara];
	diag_log format ["║ aSQF: %1",diag_activeSQFScripts];
	diag_log "╠══════════════════════════════════════════════════╣";
