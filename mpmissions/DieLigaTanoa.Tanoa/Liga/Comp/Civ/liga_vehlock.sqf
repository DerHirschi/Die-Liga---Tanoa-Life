	

		_curTarget = cursorTarget;
		if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
				
		_locked = locked _curTarget;
		if(_curTarget in life_vehicles && player distance _curTarget < 8) then
		{
			if(_locked isEqualTo 2) then
			{
				if(local _curTarget) then
				{
					_curTarget lock 0;
					if(playerSide in [civilian,east,independent]) then
					{
					_curTarget animateDoor ["door_back_R",1];
					_curTarget animateDoor ["door_back_L",1];
					_curTarget animateDoor ['door_R',1];
					_curTarget animateDoor ['door_L',1];
					_curTarget animateDoor ['Door_rear',1];
					_curTarget animateDoor ['Door_LM',1];
					_curTarget animateDoor ['Door_RM',1];
					_curTarget animateDoor ['Door_LF',1];
					_curTarget animateDoor ['Door_RF',1];
					_curTarget animateDoor ['Door_LB',1];
					_curTarget animateDoor ['Door_RB',1];
					}
				}
				else
				{
					[_curTarget,0] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
					if(playerSide in [civilian,east,independent]) then
					{
					_curTarget animateDoor ["door_back_R",1];
					_curTarget animateDoor ["door_back_L",1];
					_curTarget animateDoor ['door_R',1];
					_curTarget animateDoor ['door_L',1];
					_curTarget animateDoor ['Door_rear',1];
					_curTarget animateDoor ['Door_LM',1];
					_curTarget animateDoor ['Door_RM',1];
					_curTarget animateDoor ['Door_LF',1];
					_curTarget animateDoor ['Door_RF',1];
					_curTarget animateDoor ['Door_LB',1];
					_curTarget animateDoor ['Door_RB',1];
					};
				};
				hint composeText [ image "icons\unlock.paa", " Fahrzeug aufgeschlossen" ];
				player say3D "unlock";
			}
			else
			{
				if(local _curTarget) then
				{
					_curTarget lock 2;
					if(playerSide in [civilian,east,independent]) then
					{
					_curTarget animateDoor ["door_back_R",0];
					_curTarget animateDoor ["door_back_L",0];
					_curTarget animateDoor ['door_R',0];
					_curTarget animateDoor ['door_L',0];
					_curTarget animateDoor ['Door_rear',0];
					_curTarget animateDoor ['Door_LM',0];
					_curTarget animateDoor ['Door_RM',0];
					_curTarget animateDoor ['Door_LF',0];
					_curTarget animateDoor ['Door_RF',0];
					_curTarget animateDoor ['Door_LB',0];
					_curTarget animateDoor ['Door_RB',0];
					}
				}
				else
				{
					
					[_curTarget,2] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
					if(playerSide in [civilian,east,independent]) then
					{
					_curTarget animateDoor ["door_back_R",0];
					_curTarget animateDoor ["door_back_L",0];
					_curTarget animateDoor ['door_R',0];
					_curTarget animateDoor ['door_L',0];
					_curTarget animateDoor ['Door_rear',0];
					_curTarget animateDoor ['Door_LM',0];
					_curTarget animateDoor ['Door_RM',0];
					_curTarget animateDoor ['Door_LF',0];
					_curTarget animateDoor ['Door_RF',0];
					_curTarget animateDoor ['Door_LB',0];
					_curTarget animateDoor ['Door_RB',0];
					};
				};
				hint composeText [ image "icons\lock.paa", " Fahrzeug abgeschlossen" ];
				player say3D "car_lock";
			};
		};		
