/*
	Athor: Hirschi - Die Liga
*/
private["_val"];
_mode 		= [_this,0,-1	  ,[0]		] call BIS_fnc_param;
_val 		= ctrlText 1400;
if(! ([_val] call TON_fnc_isnumber)) exitWith
{
	hint "Du musst eine Zahl eingeben.";
};
_val = parseNumber _val; //requested number
_val = round _val;
if(_val > 14) exitWith {hint "Das ist gegen das Gesetz !!!";};
if(isNil "life_vInact_curTarget") exitWith {hint "Kein Zielfahrzeug...."};

if(_mode isEqualTo 0) exitWith {
	hint 'Das neue Gutachten wird ausgestellt ..';
	uiSleep 2;	
	if(life_vInact_curTarget isKindOf "Car") then {_val = 14 - _val;}else{_val = 7 - _val;};
	
	_val = _val max 0;		
	_rep = life_vInact_curTarget getVariable["tuv",[0,0]];	
	_rep = _rep select 1;
	life_vInact_curTarget setVariable ["tuv",[_val,_rep],true];
	[life_vInact_curTarget] spawn ligafn_alac_vehinfo;
	closeDialog 0;
};
// Generalüberholung
if(_mode isEqualTo 1) exitWith {
		
		closeDialog 0;	
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf life_vInact_curTarget) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
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
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Fahrzeug wird komplett ueberholt","PLAIN"];};
		life_vInact_curTarget setVariable ["tuv",[0,0],true];
		life_vInact_curTarget setDamage 0;
		life_vInact_curTarget setVariable ["Mani",false,true];

		titleText["STR_NOTF_RepairedVehicle","PLAIN"];
		
		[life_vInact_curTarget] spawn ligafn_alac_vehinfo;
	
};





