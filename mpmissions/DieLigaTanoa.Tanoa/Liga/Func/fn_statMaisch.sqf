
_statbar = _this select 0;

if(isNull life_trunk_vehicle OR !(("Land_WaterBarrel_F" == typeOf life_trunk_vehicle))) exitWith {}; 
if((life_trunk_vehicle getVariable ["trunk_in_use",false])) exitWith {
	[] spawn {
		hint "Die Maische wurde bereits angesetzt.. Du musst warten bis sie fertig ist !!!";
		_statbar = life_trunk_vehicle getVariable["liga_maischPro",0];		
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_upp = "Maische ist am gähren .....";
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (%3%1)...","%",_upp,round(_statbar * 100)];
		_progress progressSetPosition _statbar;
		sleep 4;
		5 cutText ["","PLAIN"];
					
		};	
	}; 	