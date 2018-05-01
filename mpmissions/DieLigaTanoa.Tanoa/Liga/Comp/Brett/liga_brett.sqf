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
║ File: 
║ Author: Hirschi Liga-Life
║ Vorlage:  Silex
╚══════════════════════════════════════════════════╝
*/
if(isDedicated) exitWith {};

liga_fn_brett =
compileFinal "

	if!(SKY_HC_aktiv_1)exitWith{closeDialog 0; hint 'Das Liga-Brett wird aufgrund hoher Beanspruchung ueberholt.. Versuche es spaeter nocheinmal ..';};

	_type = [_this  ,0,0	,[0]			] call BIS_fnc_param;
	_data = [_this  ,1,[]	,[[]]			] call BIS_fnc_param;

	disableSerialization				  	 ;
	waitUntil {!isNull  findDisplay 88888}	 ;
	_display = 			findDisplay 88888 	 ;

	if(_type isEqualTo 1) exitWith
		{
						
			_msg 	 =  _data select 2;
			_rowData = [_data select 0, _data select 1, _data select 2];
			
			_cMessageList 		= _display displayCtrl 88882;
			_cMessageHeader 	= _display displayCtrl 88886;
			_cMessageHeader ctrlSetText format['Von:                 Mitteilung:'];
	

			_cMessageList lnbAddRow [_rowData select 0,format['        %1 ...',(_rowData select 1)]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		};
	if(_type isEqualTo 2) exitWith
		{			
			_index = [_this,1,0] call BIS_fnc_param;

			_cMessageList 		= _display displayCtrl 88882;	
			_cMessageShow 		= _display displayCtrl 88887;
			_cMessageHeader		= _display displayCtrl 88890;

			_data = call compile (_cMessageList lnbData[_index,0]);

			_cMessageHeader ctrlSetText format['%1 schreibt:',_data select 0];
			_cMessageShow 	ctrlSetText format['%1'			 ,_data select 2];
		};
	
	if(_type isEqualTo 3) exitWith
		{
			lbClear _cMessageList;
			[[1,2]] remoteExecCall ['SKY_fnc_clrem',HC_id];
		};

";

/*
	Senden
*/	
	
liga_fn_BrettPit =
compileFinal "	
	
	disableSerialization;

	if!(SKY_HC_aktiv_1)				exitWith {hint 'Sorry... Die Kreide ist alle.. Versuchs spaeter nocheinmal. '  ;};

	_head = [_this,0,'',['']] call BIS_fnc_param;
	_msg  = [_this,1,'',['']] call BIS_fnc_param;

	ctrlShow[88885,false];
	if(_head isEqualTo '') 			exitWith {hint 'Du musst ein Betreff eingeben.'	 		  ;ctrlShow[88885,true];};
	if(_msg  isEqualTo '') 			exitWith {hint 'Du musst eine Nachricht eingeben.'		  ;ctrlShow[88885,true];};
	if((count(toArray _head))> 35  )exitWith {hint 'Der Betreff hat mehr als 35 Zeichen..'	  ;ctrlShow[88885,true];};
	if((count(toArray  _msg))> 200 )exitWith {hint 'Die Nachricht hat mehr als 200 Zeichen..' ;ctrlShow[88885,true];};
		
	
	[[1,0,player,_head,_msg]] remoteExecCall ['SKY_fnc_clrem',HC_id];

	
	hint format['Du hast folgende Nachricht am Liga Brett hinterlassen: %1',_head];	
			
	ctrlShow	[88885,true];
	closeDialog  88883;
";
