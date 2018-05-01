/*
	Tankmanipulator ... bla .. bla 
	Author: Hirschi - Die Liga
*/

		life_action_inUse = true;
		_upp = format["Bohre den Tank an ..."];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		playSound "Repair";		
		while{true} do
		{
			if(animationState player != "Acts_carFixingWheel" ) then {
					player action ["SwitchWeapon", player, player, 100];   
					player playMove "Acts_carFixingWheel"; 
					player playActionNow "stop";
					player playMove "Acts_carFixingWheel";
					player playActionNow "stop";
					player playMove "Acts_carFixingWheel";   
			};
			sleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Aktion wurde abgebrochen","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["So wird das nichts","PLAIN"];};
		(_this select 0) setVariable ["Mani",true,true];