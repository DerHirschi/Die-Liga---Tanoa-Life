TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;	
	{	if(_x in _valid) then{}	else{	_return = false;	};	} foreach _array;
	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	[life_atmcash,life_cash,life_id,player] remoteExec ['life_fnc_admininfo',_ret];
";

publicVariable "TON_fnc_player_query";
// SitDown Script by Hirschi Liga-Life

life_fnc_sitDown =
compileFinal "
private [""_chair"",""_mode""];
_mode = _this select 0;
_chair = _this select 1;
_exit = nearestObjects [player, [""Man""], 0.7];
_exit = count _exit;
if (_mode == 10) exitWith { [player, """"] remoteExecCall [""life_fnc_switchMove"",-2]; liga_sit = false; };
if (isNull _chair) exitWith { [player, """"] remoteExecCall [""life_fnc_switchMove"",-2]; liga_sit = false; };

[player, ""Crew""] remoteExecCall [""life_fnc_switchMove"",-2];
player setPos (getPos _chair); 
player setDir ((getDir _chair) - 180); 	
	switch (_mode) do {
		case 0: {player setPos [getpos _chair select 0, getpos _chair select 1,((getpos _chair select 2) - 0.42)]; sleep 0.7; player setPos [getpos _chair select 0, getpos _chair select 1,((getpos _chair select 2) - 0.42)];  };
		case 1: {player setPos [((getpos _chair select 0) + 0.2), ((getpos _chair select 1) + 0.01),((getpos _chair select 2) - 0.38)]; sleep 0.7; player setPos [((getpos _chair select 0) + 0.2), ((getpos _chair select 1) + 0.01),((getpos _chair select 2) - 0.38)]; };
		case 2: {player setPos [((getpos _chair select 0) + 0.2), ((getpos _chair select 1) + 0.01),((getpos _chair select 2) - 0.48)]; sleep 0.7; player setPos [((getpos _chair select 0) + 0.2), ((getpos _chair select 1) + 0.01),((getpos _chair select 2) - 0.48)]; };
		case 3: {player setPos [getpos _chair select 0, getpos _chair select 1,getpos _chair select 2]; sleep 0.7; player setPos [getpos _chair select 0, getpos _chair select 1,getpos _chair select 2];  };
		case 4: {player setPos [((getpos _chair select 0) + 0.06), ((getpos _chair select 1) + 0),((getpos _chair select 2) - 0.48)]; sleep 0.7; player setPos [((getpos _chair select 0) + 0.06), ((getpos _chair select 1) + 0),((getpos _chair select 2) - 0.48)];  };
		
		default { if (ad_debugHint) then {hint ""Stuhl nicht klassifiziert"";};};
	};
liga_sit = true ;
";
publicVariable "life_fnc_sitDown";

Liga_fnc_player_init =
compileFinal "
waitUntil {!isNil 'Liga_t'};
uiSleep 15;
{	if!(_x isKindOf 'Campfire_burning_f' || _x isKindOf 'Campfire_burning_f' || _x isKindOf 'Ship' || _x isKindOf 'Car' || _x isKindOf 'MetalBarrel_burning_F' ) then {_x enableSimulation false; }; }forEach Liga_t;
Liga_t = nil;

";
publicVariable "Liga_fnc_player_init";

LIGACL_fnc_HeliTaxen1 = compileFinal "
	private['_dest','_pos'];

	switch (_this select 1) do {
		case 0 : {_dest = [ligatax_pad_1_4,'ligatax_pad_1_4'];};
		case 1 : {_dest = [ligatax_pad_4_1,'ligatax_pad_4_1'];};
		case 2 : {_dest = [ligatax_pad_3_1,'ligatax_pad_3_1'];};
		case 3 : {_dest = [ligatax_pad_2_1,'ligatax_pad_2_1'];};
		case 4 : {_dest = [ligatax_pad_5_1,'ligatax_pad_5_1'];};
		case 5 : {_dest = [citypad_1,'citypad_1'];};
	};
	_tax = _this select 0;
	_pos = getPos _tax;
	if((_tax distance2D (_dest select 0)) < 300) exitWith {};
	_tax remoteExec ['LIGACL_fnc_removeHeliAc',-2];
	_tax  setFuel 1;
	_tax move (getPos (_dest select 0));
	waitUntil{sleep 1; _tax  distance2D (_dest select 0) < 185};
	_tax land (_dest select 1);
	waitUntil{!(isEngineOn _tax )};
	sleep 60;
	_tax move _pos;
	waitUntil{sleep 1; (_tax distance2D _pos) < 185};
	_tax land 'LAND';	
	waitUntil{!(isEngineOn _tax)};
	sleep 2;
	_tax remoteExec ['LIGACL_fnc_HeliTaxen',-2];
";	
publicVariable "LIGACL_fnc_HeliTaxen1";



LIGA_INTRO = compileFinal " 
 
private['_mode','_cp','_BlackFish','_mygroup1']; 
 
if(lock_first) exitWith {}; 
disableSerialization; 
 
0 cutText['Lade Intro ..... ','BLACK OUT',0.01]; 
99 cutRsc['Liga_logo','PLAIN',0];  
 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0;  
 
introended = false; 
loopdone = false;  
lock_first = true; 
liga_handy_kl = false; 
2 cutText ['', 'PLAIN']; 
 
[0,player] remoteExec ['TON_fnc_IntroControll',2]; 
 
setObjectViewDistance [2000,50]; 
setTerrainGrid 45; 
 
setViewDistance 2000; 
0.1 fadeSound 0;  
uiSleep 1; 
preloadSound 'intro_wait'; 
preloadSound 'introMu'; 
 
 
preloadTitleRsc ['life_progress', 'PLAIN']; 
 
  
 
_null = (getPos cam_temp_1)nearObjects ['All', 1200]; 
_null1= (getPos cam4)nearObjects ['All', 1200]; 
_null2= (getPos camso_2)nearObjects ['All', 1300]; 
_null3= (getPos aircam_4)nearObjects ['All', 1550]; 
_null4= (getPos hafencam_targ)nearObjects ['All',2000 ]; 
 
if(daytime < 6.75 || daytime > 18.2) then { 
 _mode = 'nightvision'; 
}else{ 
 _mode = 'none'; 
}; 
0 fadeMusic 0;  
0 setOvercast 0; 
0 setFog 0; 
99999 setFog 0; 
forceWeatherChange; 
_txt_1 = ['',1,'center','5','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
 
uiSleep 2; 
 
preloadCamera markerPos 'cam_temp_3'; 
preloadCamera markerPos 'cam_temp_2'; 
preloadCamera markerPos 'camso_1'; 
preloadCamera markerPos 'camso_2'; 
preloadCamera markerPos 'aircam_1'; 
preloadCamera markerPos 'aircam_2'; 
preloadCamera markerPos 'cam1'; 
preloadCamera markerPos 'cam2_1'; 
preloadCamera markerPos 'hafencam_1'; 
preloadCamera markerPos 'hafencam_3'; 
preloadCamera markerPos 'hafencam_targ'; 
 
0 cutText['','BLACK OUT',0.01]; 
5 fadeSound 0.85;  
playsound 'intro_wait'; 
 
_sound = ASLToAGL [0,0,0] nearestObject '#soundonvehicle'; 
 
5 cutRsc ['life_progress','PLAIN']; 
_ui = uiNameSpace getVariable 'life_progress'; 
_progress = _ui displayCtrl 38201; 
 
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38201) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.1), safeZoneY +   (safeZoneH * 0.5), safeZoneW *  0.8,safeZoneH *  0.02 ];   
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38201) ctrlCommit 0; 
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38203) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.1), safeZoneY +   (safeZoneH * 0.5), safeZoneW *  0.8,safeZoneH *  0.02 ];   
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38203) ctrlCommit 0; 
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38202) ctrlSetPosition [0.386 * safezoneW + safezoneX, safeZoneY +   (safeZoneH * 0.6), 0.65,(1 / 25) ];   
((uiNamespace getVariable  ['life_progress',displayNull]) displayCtrl 38202) ctrlCommit 0; 
_pgText = _ui displayCtrl 38202; 
_pgText ctrlSetText 'Warte auf freien Slot .. Bitte warten ...'; 
   
_progress progressSetPosition 0.02;  
_fail = false; 
 
3 cutRsc ['SplashNoise','PLAIN']; 
 
waitUntil{!isNil 'Intro_Go'};  
_pgText ctrlSetText '    Warte auf freien Intro-Slot .. Bitte warten ....'; 
3 cutRsc ['SplashNoise','PLAIN']; 
_progress progressSetPosition 0.07; 
_cp = 0.07; 
 
if!(Intro_Go) then { 
 for [{_i=0},{_i<=55 && !Intro_Go},{_i=_i+1}] do { 
  uiSleep 1; 
  3 cutRsc ['SplashNoise','PLAIN']; 
  _cp = _cp + 0.018; 
  _progress progressSetPosition _cp + 0.018; 
  if(_i > 54 && !Intro_Go) then {_fail = true;}; 
  if(Intro_Go)exitWith {_fail = false;};
 };   
}; 
Intro_Go = nil;
 
if(_fail) exitWith { 
 _pgText ctrlSetText 'Leider sind derzeit alle Intro-Slots belegt.. SRY ..'; 
 _progress progressSetPosition 0; 
 uiSleep 2;  
 player allowDamage  false; 
 [3,player] remoteExec ['TON_fnc_IntroControll',2]; 
 5 cutText ['','PLAIN']; 
 3 cutText ['','PLAIN']; 
 uiSleep 1; 
  
 player setPos [6956.07,7199.62,0.2]; 
 
 loopdone = true; 
 introended = true; 
   
 uiSleep 3; 
 lock_first = false; 
 
 _camera = 'camera' camCreate (getpos player); 
 _camera cameraeffect ['terminate', 'back']; 
 camDestroy _camera; 
 setObjectViewDistance [800,50]; 
 setViewDistance 1000; 
 setTerrainGrid 50; 
 camUseNVG false; false setCamUseTi 0;   
 _effect_screen = ppEffectCreate ['ColorCorrections', 5000];       
 _effect_screen ppEffectEnable true;   
 _effect_screen ppEffectAdjust [1, 1.2, 0, [1, 1, 1, 0], [1, 1, 1, 1.1], [1, 1, 1, 1.0]];   
 _effect_screen ppEffectCommit 0; 
 cutText [' ', 'BLACK IN', 1.5]; 
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
  
 []spawn { 
  uiSleep 5; 
  if(liga_first) then { 
   [] call life_fnc_hudSetup;  
   []spawn {uiSleep 10;[]execVM 'scripts\not_uhr.sqf';    }; 
  }; 
  if(liga_handy_kl)then{liga_handy_kl = false ; 2 cutText ['', 'PLAIN'];} else {liga_handy_kl = true; [] call life_fnc_hudUpdate; }; 
  uiSleep 9; 
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.4), safeZoneY +   (safeZoneH * 0.77), safeZoneW *  0.2,safeZoneH *  0.368159 ];  
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0; 
 
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
 }; 
 uiSleep 5; 
 player allowDamage  true;  
}; 
 
_pgText ctrlSetText '                Bereit ...'; 
_progress progressSetPosition 1; 
uiSleep 1; 
5 cutText ['','PLAIN']; 
3 cutText ['','PLAIN']; 
uiSleep 2; 
 
 
preloadTitleRsc ['Liga_logo', 'PLAIN']; 
4.3 fadeSound 0;  
 
uiSleep 4.5; 
deleteVehicle _sound; 
1 fadeSound 0.85;  
 
 
99 cutRsc['Liga_logo','PLAIN',0];  
 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetTextColor [1, 1, 1, 1]; 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.1), safeZoneY +   (safeZoneH * 0.19), safeZoneW *  0.8,safeZoneH *  0.8 ];   
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0;  
 
 
playsound 'introMu'; 
uiSleep 0.35; 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 9;  
 
 
uiSleep 3.05; 
 
_txt_2 = ['präsentiert:',5,'center_bottom','1','#FFFFFF'] execVM 'scripts\AL_movie\txt_display.sqf'; 
uiSleep 11.2; 
 
_firstshot1 = [cam_temp_3, cam_temp_4, cam_temp_targ_1, 9.5, 1.8, 0.7, false, 0, 0, 0,_mode,'blacknone',5,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 2.6; 
 
uiSleep 4.6; 
 
 
cutText ['', 'BLACK OUT', 2]; 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetTextColor [0.95, 0.95, 0.95, 0.4]; 
 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.4), safeZoneY +   (safeZoneH * -0.12), safeZoneW *  0.2,safeZoneH *  0.368159 ];  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0;   
 
  
uiSleep 2.5; 
 
 
_firstshot1 = [cam_temp_1, cam_temp_2, cam_temp_targ, 15.5, 1, 0.7, false, 0, -12, -1,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
uiSleep 1.05; 
cutText ['', 'BLACK in', 2]; 
 
 
uiSleep 6.95; 
cutText ['', 'BLACK OUT', 3]; 
uiSleep 4.3; 
  
_txt_1 = ['Tanoa Life',7,'center_top','5','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
 
uiSleep 3.2; 
 
_BlackFish = createVehicle ['B_T_VTOL_01_infantry_blue_F', [7636.64,1086.43,680], [], 0, 'FLY']; 
 
private['_unit']; 
   
_BlackFish allowDamage false; 
_BlackFish flyInHeight 120; 
 
_mygroup1 = [[7636.64,1086.43,700], CIVILIAN, ['O_G_Soldier_SL_F'],[],[],[],[],[],180] call BIS_fnc_spawnGroup; 
_mygroup2 = [[7636.64,1086.43,630], CIVILIAN, ['O_G_Soldier_SL_F'],[],[],[],[],[],180] call BIS_fnc_spawnGroup; 
 
{_x moveInDriver   _BlackFish; _x allowDamage false; _unit = _x} forEach units _mygroup1; 
{_x moveInTurret [   _BlackFish,[0]]; _x allowDamage false;} forEach units _mygroup2; 
units _mygroup2 join _mygroup1; 
deleteGroup _mygroup2; 
 
 [_BlackFish,_mygroup1]spawn{ 
  _BlackFish = _this select 0; 
  _mygroup1 = _this select 1; 
  [1,player,_BlackFish,_mygroup1] remoteExec ['TON_fnc_IntroControll',2]; 
 
  [_mygroup1,_BlackFish] spawn{ 
   _BlackFish = _this select 1; 
   _mygroup1 = _this select 0; 
   private['_i']; 
   for [{_i=0},{_i<=135 && ((speed _BlackFish) > 10) && ((getPos _BlackFish )select 2) > 10 },{_i=_i+1}] do { 
    uiSleep 1; 
   }; 
    
   uiSleep 30; 
   if!(introended) then { 
    player allowDamage  false; 
    _BlackFish lock false; 
    uiSleep 1; 
    doGetOut player; 
    player setPos [6956.07,7199.62,0.2]; 
 
    loopdone = true; 
    introended = true;   
       
    _BlackFish engineOn true; 
    _BlackFish land 'NONE'; 
    _BlackFish flyInHeight 4000; 
    _BlackFish forceSpeed  0; 
    _BlackFish move [50,50,5000]; 
    uiSleep 3; 
    player allowDamage  true; 
	[2,player] remoteExec ['TON_fnc_IntroControll',2]; 
    [_this,_BlackFish] spawn {  
     private['_i']; 
     for '_i' from 0 to 120 do { 
      uiSleep 1; 
      if(((getPos (_this select 1)  )select 2) > 3000) exitWith { };     
     }; 
	
     {if!(_x isEqualTo player) then {deleteVehicle _x};}forEach units (_this select 0) ; 
     
     deleteVehicle (_this select 1); 
    }; 
    lock_first = false; 
 
    _camera = 'camera' camCreate (getpos player); 
    _camera cameraeffect ['terminate', 'back']; 
    camDestroy _camera; 
    setObjectViewDistance [800,50]; 
    setViewDistance 1000; 
    setTerrainGrid 50; 

    cutText [' ', 'BLACK IN', 1.5]; 
    ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
    ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
     
    []spawn { 
     uiSleep 5; 
     if(liga_first) then { 
      [] call life_fnc_hudSetup; 
        
     }; 
     if(liga_handy_kl)then{liga_handy_kl = false ; 2 cutText ['', 'PLAIN'];} else {liga_handy_kl = true; [] call life_fnc_hudUpdate; }; 
     uiSleep 9; 
     ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.4), safeZoneY +   (safeZoneH * 0.77), safeZoneW *  0.2,safeZoneH *  0.368159 ];  
     ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0; 
 
     ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
     ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
    }; 
    uiSleep 5; 
    player allowDamage  true; 
   }; 
  }; 
 
 
   
  player allowDamage  false; 
   
  _BlackFish lock true; 
  if!(isCollisionLightOn _BlackFish) then { 
   _BlackFish setCollisionLight true; 
   _BlackFish setPilotLight true; 
  }; 
 
  _mygroup1 addWaypoint [[7878.35,4036.28,77], 100]; 
   
  _BlackFish forceSpeed  54; 
  waitUntil {uiSleep 0.2;(_BlackFish distance2D [7878.35,4036.28,0]) < 110 }; 
  _mygroup1 addWaypoint [[6956.7,7235.47,100], 70]; 
   
  _mygroup1 move [6956.7,7235.47,100]; 
  
  _BlackFish forceSpeed  140; 
  _BlackFish flyInHeight 40; 
  waitUntil {uiSleep 0.3;(_BlackFish distance2D [6956.7,7235.47,0.00143886]) < 2600 }; 
   
  _BlackFish forceSpeed  28; 
  [2,player] remoteExec ['TON_fnc_IntroControll',2]; 
  waitUntil {uiSleep 0.3;(_BlackFish distance2D [6956.7,7235.47,0.00143886]) < 900 }; 
  
   
   
  _BlackFish forceSpeed  15; 
  waitUntil {uiSleep 0.2;(_BlackFish distance2D [6956.7,7235.47,0.00143886]) < 450 }; 
   
   
  _BlackFish land 'LAND'; 
  _BlackFish forceSpeed  0; 
   
  waitUntil{((getPos _BlackFish )select 2) < 1}; 
   
   
  2 fadeSound 0.14; 
  uiSleep 0.5;   
  _BlackFish lock false; 
  doGetOut player; 
   
  waitUntil {(count crew _BlackFish) isEqualTo 2}; 
   
  _BlackFish lock true; 
   
  _BlackFish engineOn true; 
  _BlackFish land 'NONE'; 
  _BlackFish flyInHeight 4000; 
  _BlackFish move [50,50,5000]; 
  uiSleep 3; 
  player allowDamage  true; 
  waitUntil{sleep 1;(((getPos _BlackFish )select 2) > 3500)}; 
 
  {if!(_x isEqualTo player) then {deleteVehicle _x};}forEach units _mygroup1; 
  deleteVehicle _BlackFish;   
  [2,player] remoteExec ['TON_fnc_IntroControll',2]; 
  lock_first = false; 
 }; 
 
 
 
waitUntil{!isNil '_BlackFish'}; 
uiSleep 0.25; 
 
_firstshot1 = [camso_1, camso_3, camso_2,25 , 0.1, 1.8, false, 0, -7, -10,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
 
cutText ['', 'BLACK in', 2]; 
 
 
uiSleep 2; 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 6; 
 
uiSleep 6; 
preloadCamera getPos _BlackFish; 
waitUntil{_BlackFish distance2D [7878.35,4036.28,77] < 1500}; 
player moveInCargo _BlackFish; 
 
 
_firstshot = [_BlackFish, cam1, cam2, 7.79, 1, 0.55, false, 2, -17, 3,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
uiSleep 3; 
_txt_1 = ['Gladi',4.5,'center_bottom','3','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
uiSleep 1; 
_txt_2 = ['Mapping:',4,'left_top','1','#FFFFFF'] execVM 'scripts\AL_movie\txt_display.sqf'; 
 
waitUntil {scriptdone _firstshot}; 
 
_firstshot = [cam2_1, cam2, _BlackFish, 20.1, 0.04, 1, false, -10, -10, 0,_mode,'noneblack',1,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
uiSleep 2; 
_txt_1 = ['Zoran und Hirschi',5,'center_bottom','3','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
uiSleep 1; 
_txt_2 = ['Scripting:',5,'left_top','1','#FFFFFF'] execVM 'scripts\AL_movie\txt_display.sqf'; 
 
waitUntil {scriptdone _firstshot}; 
 
_firstshot1 = [_BlackFish, _BlackFish, cam4, 9, 1, 0.07, true, 0, -12, -1,_mode,'blacknone',0.5,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
 
uiSleep 7; 
 
cutText ['', 'BLACK OUT', 2]; 
uiSleep 2; 
 
 
 
_firstshot2 = [hafencam_1, hafencam_3, hafencam_targ, 45, 1, 1.5, false, 0, 0, 0,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
cutText ['', 'BLACK IN', 3]; 
uiSleep 8; 
_txt_1 = ['Baskid und John Manny',4,'center_bottom','3','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
uiSleep 1; 
_txt_2 = ['Grafik und Design:',4,'left_top','1','#FFFFFF'] execVM 'scripts\AL_movie\txt_display.sqf'; 
 
 
 
waitUntil{_BlackFish distance2D aircam_2 < 900 || scriptdone _firstshot2}; 
if(scriptdone _firstshot2) exitWith { 
 cutText ['', 'BLACK OUT', 3]; 
 uiSleep 3; 
 player allowDamage  false; 
 _BlackFish lock false; 
 uiSleep 1; 
 doGetOut player; 
 player setPos [6956.07,7199.62,0.2]; 
 loopdone = true; 
 introended = true;   
    
 _BlackFish engineOn true; 
 _BlackFish land 'NONE'; 
 _BlackFish flyInHeight 4000; 
 _BlackFish forceSpeed 0; 
 _BlackFish move [50,50,5000]; 
  
 uiSleep 3; 
 player allowDamage  true; 
 [_mygroup1,_BlackFish] spawn {  
  private['_i']; 
  for '_i' from 0 to 120 do { 
   uiSleep 1; 
   if(((getPos (_this select 1)  )select 2) > 3000) exitWith { };     
  }; 
  {if!(_x isEqualTo player) then {deleteVehicle _x};}forEach units (_this select 0) ; 
  deleteVehicle (_this select 1) ; 
  [2,player] remoteExec ['TON_fnc_IntroControll',2]; 
 }; 
 lock_first = false; 
 _camera = 'camera' camCreate (getpos player); 
 _camera cameraeffect ['terminate', 'back']; 
 camDestroy _camera; 
 setObjectViewDistance [800,50]; 
 setViewDistance 1000; 
 setTerrainGrid 50; 
 
 cutText [' ', 'BLACK IN', 1.5]; 
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
  
 []spawn { 
  uiSleep 5; 
  if(liga_first) then { 
   [] call life_fnc_hudSetup; 
   []spawn {uiSleep 10;[]execVM 'scripts\not_uhr.sqf';    }; 
  }; 
  if(liga_handy_kl)then{liga_handy_kl = false ; 2 cutText ['', 'PLAIN'];} else {liga_handy_kl = true; [] call life_fnc_hudUpdate; }; 
  uiSleep 9; 
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.4), safeZoneY +   (safeZoneH * 0.77), safeZoneW *  0.2,safeZoneH *  0.368159 ];  
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0; 
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
  ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
 }; 
 uiSleep 5; 
 player allowDamage  true; 
};  
  
 
cutText ['', 'BLACK OUT', 3]; 
uiSleep 3; 
 
_firstshot = [aircam_1, aircam_2, _BlackFish, 20, 1.2, 0.7, false, 0, 0, 0,_mode,'blacknone',1,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
 
 
waitUntil {scriptdone _firstshot}; 
 
_firstshot = [aircam_2, aircam_3, _BlackFish, 15, 0.7, 0.5, false, 0, 0, 0,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
uiSleep 1; 
_txt_1 = ['Baskid, Hirschi, Zoran',4,'center_bottom','3','#FFF000'] execVM 'scripts\AL_movie\txt_display.sqf'; 
uiSleep 1; 
_txt_2 = ['Serverleitung:',4,'left_top','1','#FFFFFF'] execVM 'scripts\AL_movie\txt_display.sqf'; 
waitUntil {scriptdone _firstshot}; 
_firstshot1 = [aircam_3, aircam_4, _BlackFish, 15, 0.5, 0.3, false, 0, 0, 0,_mode,'none',0,'none'] execVM 'scripts\AL_movie\camera_work.sqf'; 
waitUntil{vehicle player isEqualTo player}; 
 
cutText [' ', 'BLACK OUT', 3]; 
uiSleep 3; 
waitUntil {scriptdone _firstshot}; 
 
loopdone = true; 
introended = true; 
 
_camera = 'camera' camCreate (getpos player); 
_camera cameraeffect ['terminate', 'back']; 
camDestroy _camera; 
setObjectViewDistance [800,50]; 
setViewDistance 1000; 
setTerrainGrid 50; 

cutText [' ', 'BLACK IN', 1.5]; 
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 1;  
((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
 
[]spawn { 
 uiSleep 5; 
 if(liga_first) then { 
  [] call life_fnc_hudSetup;  
  []spawn {uiSleep 10;[]execVM 'scripts\not_uhr.sqf';    }; 
 }; 
 if(liga_handy_kl)then{liga_handy_kl = false ; 2 cutText ['', 'PLAIN'];} else {liga_handy_kl = true; [] call life_fnc_hudUpdate; }; 
 uiSleep 9; 
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetPosition [safeZoneX +  (safeZoneW * 0.4), safeZoneY +   (safeZoneH * 0.77), safeZoneW *  0.2,safeZoneH *  0.368159 ];  
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 0; 
 
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlSetFade 0;  
 ((uiNamespace getVariable  ['Liga_logo',displayNull]) displayCtrl 88885) ctrlCommit 14;  
}; 
"; 
publicVariable "LIGA_INTRO";
/*
TON_fnc_setObjVar = 
compileFinal "
	private['_obj','_varValue','_global','_varName'];
	_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_varName = [_this,1,'',['']] call BIS_fnc_param;
	_varValue = _this select 2;
	_global = [_this,3,false,[true]] call BIS_fnc_param;

	if(isNull _obj OR _varName isEqualTo '') exitWith {}; 
	_obj setVariable[_varName,_varValue,_global];

";
publicVariable "TON_fnc_setObjVar";
*/