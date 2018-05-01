#include "\life_server\Liga_Macros.hpp"

HC_UID = -1;
HC_id = -1;
PVAR_ALL("HC_id");
SKY_HC_aktiv_1 = false;
PVAR_ALL("SKY_HC_aktiv_1");
SKY_HC_first_1 = false;
PVAR_ALL("SKY_HC_first_1");


diag_log "║          << HC Link initialisiert >>";
diag_log "╟──────────────────────────────────────────────────╢";

waitUntil { uiSleep 5; SKY_HC_aktiv_1;};

	HC_id = owner sky_1;
	HC_UID = getPlayerUID sky_1;
	PVAR_ALL("HC_id");
	diag_log "╔══════════════════════════════════════════════════╗";
	diag_log "║       <<<< SKY-NET *** HC-LOGIN *** >>>>";
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log format["║ HC 		         			 : %1",HC_id];
	diag_log "╟──────────────────────────────────────────────────╢";
	diag_log "║ Uebergebe Mastergroup an HC ..... ";	
	
	(group master_group) setGroupOwner HC_id;

	ad_base_1 setGroupOwner HC_id;
	//LigaNPC1 setGroupOwner HC_id;
	//diag_log "║ Erzeuge NPC Group ..... ";
	
	//animalGroup = createGroup civilian;
	//diag_log "║ Uebergebe AnimalGroup an HC ..... ";	
	//animalGroup setGroupOwner HC_id;
	[]spawn{
		uiSleep 20;
		diag_log format["║ MasterGrp Owner     			 : %1",groupOwner (group master_group)];
		//diag_log format["║ NPC Owner 			 		 : %1",groupOwner LigaNPC1];
	};
	PVAR_HC(HC_id,"SESSION_ID");
	diag_log format["║ SESSION_ID         			 : %1",SESSION_ID];
	//diag_log format["║ HC Slot          			 : %1",((Sky_Net_Info select 0) + 1)];
	//diag_log format["║ HC UID            : %1",(getPlayerUID sky_1)];	
	//diag_log format["║ HC ID            			 : %1",(Sky_Net_Info select 1)];	
	//diag_log format["║ HC standby  			 : %1",SKY_stanby];	
	//diag_log format["║ HC Handshake Link : %1",SKY_HC_Link];	
	//diag_log format["║ HC Net Info 				 : %1",Sky_Net_Info];							
	diag_log "╚══════════════════════════════════════════════════╝";	
	
	
//#define PERSUCH ["Man"]
/*
private ["_trig"];
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log "║ Liga Objekt 2 HC !!";

	_timeStamp = diag_tickTime;
			
	_list = [15000,15000,0]nearObjects ["All", 20000];		
	_count = count _list;
		
	diag_log "╠══════════════════════════════════════════════════╣";
	diag_log format ["║ Gezählte Objekte %1", _count];
	diag_log format ["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];
	diag_log "╠══════════════════════════════════════════════════╣";
		
	{		
		if!(isPlayer _x) then {		
			_x setOwner HC_id;
		//[_x] join (group master_group);
		};
	} foreach _list;	
		

	diag_log format["║ %1 Sekunden Laufzeit",(diag_tickTime) - _timeStamp];
	diag_log "║ Liga Objekt 2 HC beendet !!";
	diag_log "╠══════════════════════════════════════════════════╣";

	_list spawn
	{
		private["_n","_n1"];
		
			_n = 0;
			_n1 = 0;
			uiSleep 10;
			{		
				if(owner _x isEqualTo HC_id) then { _n = _n +1;}else{ _n1 = _n1 + 1;};						
			} foreach _this;	
			diag_log format["║ %1 Objekte übergeben",_n];
			diag_log format["║ %1 Objekte nicht übergeben",_n1];
			diag_log format["║ %1 Objekte gesamt übergeben",count _this];

			diag_log "╠══════════════════════════════════════════════════╣";
		
	};

	
	
	*/
	

/*
	File: fn_initHC.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server checks for the headless client and initializes?

private["_HC_Monitor"];
if(isNil "life_HC_isActive") then {life_HC_isActive = false;};
//Check to see if our headless client has went away if he disconnects so we know..

HC_DC = ["HC_Disconnected","onPlayerDisconnected",{if(!isNil "HC_UID" && {_uid == HC_UID}) then {life_HC_isActive = false;};}] call BIS_fnc_addStackedEventHandler;

//Setup the PVEH so the server can update the HC_UID if the headless client was swapped.
"life_HC_isActive" addPublicVariableEventHandler {
	HC_UID = getPlayerUID HC1;
};

//Let's see if he is here on mission start..
if(isNil "HC_UID" && {!isNil "HC1"} && {!isNull HC1}) then {
	HC_UID = getPlayerUID HC1;
	life_HC_isActive = true;
};
*/
