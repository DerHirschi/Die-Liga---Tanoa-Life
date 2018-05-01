#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
/*__________________________________________
  Script by Sickboy (sb _at_ 6thSense.eu)
  Version: v0.1
  Edited by Hirschi - Die Liga
__________________________________________*/
private["_infectedZone","_intrig","_outtrig"];	
	_infectedZone = ["pvp_1"]; // zones to infect
	
	infected 			= createGroup east;
	infectedCount		= 0;
	airdrop_zomgoingon  = false;
	publicVariable "airdrop_zomgoingon";
	ZomTarg 			= [];
	ZomBox				= objNull;
	
	fncNextSoundCl 		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_nextSoundCl.sqf";
	
	fncAttack 			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_attack.sqf";
	fncContact			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_contact.sqf";
	fncNextSound 		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_nextSound.sqf";
	fncNearestTarget 	= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_nearest.sqf";
	fncRoaming 			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_roaming.sqf";
	fncStuff 			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_stuff.sqf";
	infectedinit 		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\infectedinit.sqf";
	zoneInit			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\zoneinit.sqf";
	playerLeavingZone	= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\playerLeavingZone.sqf";
	fncPop				= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\popinfected.sqf";
	fncPopAir			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\popinfectedAir.sqf";
	fncPopRem			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\popinfectedRem.sqf";
	fncPopManual		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\popmanual.sqf";
	fncPopOutdoor		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\popoutdoor.sqf";
	fncVehicle			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\fnc_vehicle.sqf";
	attackerZoneInit	= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\attackers\attackerzoneinit.sqf";
	fncPopAttacker		= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\attackers\popattacker.sqf";
	fncAttacker			= compileFinal  preprocessFileLineNumbers "\a3_SkyNet_HC\Scripte\Zombies\infected\attackers\fnc_attacker.sqf";
	
	
	{
		private ["_markName","_markPos","_mPosX","_mPosY","_mkrY","_mkrX","_detectorName","_x"];
		_markName=_x;
		_markPos=MarkerPos _markName;
		_mPosX=_markPos select 0;
		_mPosY=_markPos select 1;
		_mkrY= getmarkerSize _markName select 0;
		_mkrX= getmarkerSize _markName select 1;
		_detectorName=_x;
		//deleteMarker _x;
		_x = createTrigger["EmptyDetector",_markPos];
		//_x setTriggerArea[(_mkrX*3),(_mkrX*3),0,false];
		_x setTriggerArea[(_mkrX * 1.5),(_mkrX * 1.5),0,false];
		_x setTriggerActivation ["ANY", "PRESENT", true];
		//_x setTriggerStatements ["this","thisTrigger spawn zoneInit;thistrigger spawn fncPop ",""];
		_x setTriggerStatements ["this","",""];
		_intrig = _x;
		Zom_Trig = _x;
		
	} forEach _infectedZone;
	
	/*
	{
		private ["_markName","_markPos","_mPosX","_mPosY","_mkrY","_mkrX","_detectorName","_x"];
		_markName=_x;
		_markPos=MarkerPos _markName;
		_mPosX=_markPos select 0;
		_mPosY=_markPos select 1;
		_mkrY= getmarkerSize _markName select 0;
		_mkrX= getmarkerSize _markName select 1;
		_detectorName=_x;
		//deleteMarker _x;
		_x = createTrigger["EmptyDetector",_markPos];
		//_x setTriggerArea[(_mkrX*3),(_mkrX*3),0,false];
		_x setTriggerArea[(_mkrX * 2.5),(_mkrX * 2.5),0,false];
		_x setTriggerActivation ["CIV", "PRESENT", true];
		//_x setTriggerStatements ["this","","thisTrigger spawn playerLeavingZone;"];
		_x setTriggerStatements ["this","",""];
		_outtrig = _x;
	} forEach _infectedZone;
	*/


_infectedZone = _infectedZone select 0;
	
//_radius = (getMarkerSize _infectedZone) select 0;
_mkrY= (triggerArea _intrig) select 0;
_mkrX= (triggerArea _intrig) select 1;

_distance=_mkrX;
if (_mkrY > _mkrX)then
{
	_distance=_mkrY;
};

_dist = _distance ;
_zone = getMarkerPos _infectedZone;
//_zoneloc = createTrigger["EmptyDetector",_zone];
//_zoneloc setTriggerArea[(_radius * 1.3),(_radius * 1.3),0,false];
//_zoneloc setTriggerActivation ["CIV", "PRESENT", true];
private ["_trig","_fnc_run2targ"];
Z_zoneakt = false;
_trig = false;


_fnc_run2targ = {
	private["_ex"];
	_ex = false;
	for "_n" from 1 to 2 do {

		for "_z" from 1 to 3 do {

			
			_tarcount = count ZomTarg;
			_zomcount = count units infected;
			{if((_x distance (getPos zomAirpoint)) < 18)exitWith{_ex = true;};}forEach ZomTarg;
			if!(Z_zoneakt)exitWith {};
			if(airdrop_zomgoingon)exitWith {};
			if(count ZomTarg isEqualTo 0)exitWith {};
			if((count units infected) isEqualTo 0)exitWith {};
		
			if(_ex)exitWith	{};
			{
				for "_i" from 1 to floor (_zomcount / _tarcount) do {
					((units infected) select _i) doMove position _x;
/*					
					diag_log str _x;
					diag_log str (units infected) select _i;
					diag_log str _tarcount;
					diag_log str _zomcount;
					diag_log str ZomTarg;
					diag_log str floor (_zomcount / _tarcount);
*/					
				};
			}forEach ZomTarg;
			diag_log "durchlauf";
			diag_log str _z;
			uiSleep 18;			
		};
		while {true}do {
			if((((count (units infected)) < 50) || (_n > 1) || (!(Z_zoneakt)) || (airdrop_zomgoingon)))exitWith{diag_log "WARTEN ENDE trigger";};
			diag_log "WARTE";
			sleep 3			
		};		
		if!(Z_zoneakt)exitWith {};
		if(airdrop_zomgoingon)exitWith {};
		if(count ZomTarg isEqualTo 0)exitWith {};
		if((count units infected) isEqualTo 0)exitWith {};
		
		if(Z_zoneakt)then { _this spawn fncPop;  };
		
		diag_log "WARTEN ENDE";
	};
	diag_log "ENDE";
};



while {true} do {	
	//_trig = false;
	{
		if((side _x) isEqualTo civilian) then {
			if(((_x distance _zone) < _dist - 20) && (alive _x )) exitWith {
				//diag_log ">>> Spieler in Zone .. Zone noch nicht aktiv <<<<";
				if!(Z_zoneakt)then {
					Z_zoneakt = true;
					if(isNull infected) then {infected 			= createGroup east;};
				//	diag_log ">>> Spieler in Zone .. Zone wurde aktiviert <<<<";							
					_intrig spawn zoneInit;			
					
					
					
					
					_intrig spawn fncPop;
					sleep 30;
					_intrig spawn _fnc_run2targ;
					//{_x doMove [21994.7,21048.8,0];}forEach units infected; 
					
					uiSleep 50;
					};			
				//_trig = true;
			};
		};
	} foreach playableUnits;
	/*
	if!(_trig) then {
		//diag_log ">>> 2. Druchlauf <<<<";
		if(((count ZomTarg) isEqualto 0) && Z_zoneakt) then {
			uiSleep 5;
						
			_intrig spawn playerLeavingZone;
			uiSleep 18;
		
			if!(EQUAL(count units infected,0)) then {					
			//	diag_log ">>> FAILSAFE !!!<<<<";
						
				_intrig spawn playerLeavingZone;
				uiSleep 22;
				if!(EQUAL(count units infected,0)) then {
					{deleteVehicle _x}forEach units infected;
					infectedCount=0;
					uiSleep 10;
				};			
			};
		}; 
	};		
	//diag_log ">>> Tick <<<<";
	*/
			
	sleep (3 + random 3);	
};