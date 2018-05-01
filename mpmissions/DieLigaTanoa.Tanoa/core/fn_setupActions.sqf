/*
	File: fn_setupActions.sqf
	Edit: Hirschi - Die Liga
	Description:
	Master addAction file handler for all client-based actions.
*/
/*
switch (side player) do
{
	case default
	{
		//Personalausweis zeigen

		
		

	};

	case west:
	{
		//Polizeimarke
	

	};
	
		case east:
	{
		//ADAC-Ausweis
		//Hinsetzen 

	};
	
	case independent:
    {
        //Medicmarke
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Absperrung aufheben</t>",{[0] call life_fnc_packupmauer},"",0,false,false,"",' _mauer = nearestObjects[getPos player,['RoadBarrier_F'],8] select 0; !isNil '_mauer' && !isNil {(_mauer getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",{[2] call life_fnc_packupmauer},"",0,false,false,"",' _kegel = nearestObjects[getPos player,['RoadCone_L_F'],8] select 0; !isNil '_kegel' && !isNil {(_kegel getVariable 'item')}']];
		// Strahler
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler aufheben</t>",{[1] call life_fnc_packupmauer},"",0,false,false,"",' _strahler = nearestObjects[getPos player,['Land_PortableLight_double_F'],8] select 0; !isNil '_strahler' && !isNil {(_strahler getVariable 'item')}']];
		//Hinsetzen 
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [0,(nearestObjects[getPos player,['Land_RattanChair_01_F'],1.3] select 0)] call life_fnc_sitDown;  },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_RattanChair_01_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [1,(nearestObjects[getPos player,['Land_Bench_02_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_Bench_02_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [1,(nearestObjects[getPos player,['Land_Bench_01_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_Bench_01_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [2,(nearestObjects[getPos player,['Land_Bench_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_Bench_F'],1.3] select 0; !isNil '_rat' && !liga_sit']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [3,(nearestObjects[getPos player,['Land_OfficeChair_01_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_OfficeChair_01_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_ChairWood_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_ChairWood_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_CampingChair_V1_f'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_CampingChair_V1_f'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_CampingChair_V2_f'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_CampingChair_V2_f'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_ChairPlastic_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,['Land_ChairPlastic_F'],1.3] select 0; !isNil '_rat' && !liga_sit ']];
		life_actions = life_actions + [player addAction["<t color='#DF0101'>Aufstehen</t>",{ [10,ObjNull] call life_fnc_sitDown; },"",0,false,false,"",' liga_sit ']];
		// Schnapserei	
		life_actions = life_actions + [player addAction["<t color='#FFE701'>Zelt</t>",life_fnc_ligaZeltInv,"",0,false,false,"",' _zelt = nearestObjects[getPos player,['Land_TentA_F'],2.5] select 0; !isNil '_zelt' && !isNil {(_zelt getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FFE701'>Maische-Fass</t>",life_fnc_ligaFassInv,"",0,false,false,"",' _fass = nearestObjects[getPos player,['Land_WaterBarrel_F'],2.5] select 0; !isNil '_fass' && !isNil {(_fass getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Destille abbauen</t>",{ [0] spawn TON_fnc_ligaDestObj; if(([true,'15',1] call life_fnc_handleInv)) then{   titleText['Du hast deine Destille abgebaut ','PLAIN'];  };},"",0,false,false,"",' _dest = nearestObjects[getPos player,['Land_HeatPump_F'],2.8] select 0; !isNil '_dest' && !isNil {(_dest getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FFE701'>Destille</t>",{ [0] spawn life_fnc_DestInv;},"",0,false,false,"",' _destI = nearestObjects[getPos player,['Land_HeatPump_F'],2.1] select 0; !isNil '_destI' && !isNil {(_destI getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FFE701'>Methyl-Eimer</t>",{ [1] spawn life_fnc_DestInv;},"",0,false,false,"",' _eimer = nearestObjects[getPos player,['Land_Bucket_painted_F'],1.9] select 0; !isNil '_eimer' && !isNil {(_eimer getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FFE701'>Schnapps-Fass</t>",{ [2] spawn life_fnc_DestInv;},"",0,false,false,"",' _sfass = nearestObjects[getPos player,['Land_BarrelWater_F'],1] select 0; !isNil '_sfass' && !isNil {(_sfass getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#E200FF'>Tarnnetz abbauen</t>",{[4] call life_fnc_packupmauer},"",0,false,false,"",' _netz = nearestObjects[getPos player,['CamoNet_BLUFOR_F'],2.5] select 0; !isNil '_netz' && !isNil {(_netz getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Zelt abbauen</t>",{[3] call life_fnc_packupmauer},"",0,false,false,"",' _zelt = nearestObjects[getPos player,['Land_TentA_F'],2.5] select 0; !isNil '_zelt' && !isNil {(_zelt getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Maische-Fass abbauen</t>",{[7] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,['Land_WaterBarrel_F'],2.5] select 0; !isNil '_fass' && !isNil {(_fass getVariable 'item')} && !isNil {(_fass getVariable 'destpro')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Klappstuhl abbauen</t>",{[5] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,['Land_CampingChair_V1_f'],2.5] select 0; !isNil '_fass' && !isNil {(_fass getVariable 'item')}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Klappstuhl abbauen</t>",{[6] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,['Land_CampingChair_V2_f'],2.5] select 0; !isNil '_fass' && !isNil {(_fass getVariable 'item')}']];

    };		
	
};
*/
//Drop fishing net
life_actions = [player addAction[localize 'STR_pAct_DropFishingNet',life_fnc_dropFishingNet,"",0,false,false,"",'	(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
//Rob person
life_actions = life_actions + [player addAction['Person ausrauben',life_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE]) && (!liga_cop_on && !liga_lrk_on) ']];

life_actions = life_actions + [player addAction["<t color='#FF0000'>Kegel aufheben</t>",{[2] call life_fnc_packupmauer},"",0,false,false,"",' _kegel = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !(side player isEqualTo civilian) && !isNil "_kegel" && !isNil {(_kegel getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler aufheben</t>",{[1] call life_fnc_packupmauer},"",0,false,false,"",' _strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0; !(side player isEqualTo civilian) && !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Absperrung aufheben</t>",{[0] call life_fnc_packupmauer},"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !(side player isEqualTo civilian) && !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && !(side player isEqualTo civilian)']];

life_actions = life_actions + [player addAction["<t color='#DF7401'>Einsteigen</t>",{  player moveInAny cursorTarget; },"",0,false,false,"",' ( ((vehicle player) isEqualTo player ) && ((cursorTarget isKindOf "Ship") || (cursorTarget isKindOf "Air")  || (cursorTarget isKindOf "Car") ) && ((locked  cursorTarget) isEqualTo 0 )   && ( (cursorTarget distance2D player ) < 4  )     )']];
life_actions = life_actions + [player addAction["<t color='#00FF00'>Positionslicht An</t>",{ (vehicle player) setCollisionLight true;  },"",0,false,false,"",' ((typeof vehicle player) isEqualTo "I_Heli_light_03_unarmed_F" ) && !(isCollisionLightOn  (vehicle player))']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Positionslicht Aus</t>",{   (vehicle player) setCollisionLight false; },"",0,false,false,"",' ((typeof vehicle player) isEqualTo "I_Heli_light_03_unarmed_F" ) && (isCollisionLightOn  (vehicle player))']];


life_actions = life_actions + [player addAction["<t color='#00FF00'>Ausweis zeigen</t>",life_fnc_civShowLicense,'',1,false,true,'','side player isEqualTo civilian &&  !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
life_actions = life_actions + [player addAction["<t color='#00FF00'>ADAC-Ausweis zeigen</t>",life_fnc_ADACShowID,'',1,false,true,'',' playerSide isEqualTo east && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
life_actions = life_actions + [player addAction["<t color='#00FF00'>Polizeimarke zeigen</t>",life_fnc_copShowLicense,'',1,false,true,'',' side player isEqualTo west && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
life_actions = life_actions + [player addAction["<t color='#00FF00'>Dienstausweiss zeigen</t>",life_fnc_medicShowLicense,'',1,false,true,'',' side player isEqualTo independent && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];


//Hinsetzen
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [0,(nearestObjects[getPos player,['Land_RattanChair_01_F'],1.3] select 0)] call life_fnc_sitDown;  },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_RattanChair_01_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [1,(nearestObjects[getPos player,['Land_Bench_02_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_Bench_02_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [1,(nearestObjects[getPos player,['Land_Bench_01_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_Bench_01_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [2,(nearestObjects[getPos player,['Land_Bench_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_Bench_F"],1.3] select 0; !isNil "_rat" && !liga_sit']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [3,(nearestObjects[getPos player,['Land_OfficeChair_01_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_OfficeChair_01_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_ChairWood_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_ChairWood_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_CampingChair_V1_f'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_CampingChair_V1_f"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_CampingChair_V2_f'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_CampingChair_V2_f"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#00FFFF'>Hinsetzen</t>",{ [4,(nearestObjects[getPos player,['Land_ChairPlastic_F'],1.3] select 0)] call life_fnc_sitDown; },"",0,false,false,"",' _rat = nearestObjects[getPos player,["Land_ChairPlastic_F"],1.3] select 0; !isNil "_rat" && !liga_sit ']];
life_actions = life_actions + [player addAction["<t color='#DF0101'>Aufstehen</t>",{ [10,ObjNull] call life_fnc_sitDown; },"",0,false,false,"",' liga_sit ']];
// Schnapserei	
life_actions = life_actions + [player addAction["<t color='#FFE701'>Zelt</t>",life_fnc_ligaZeltInv,"",0,false,false,"",' _zelt = nearestObjects[getPos player,["Land_TentA_F"],2.5] select 0; !isNil "_zelt" && !isNil {(_zelt getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FFE701'>Maische-Fass</t>",life_fnc_ligaFassInv,"",0,false,false,"",' _fass = nearestObjects[getPos player,["Land_WaterBarrel_F"],2.5] select 0; !isNil "_fass" && !isNil {(_fass getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Destille abbauen</t>",{  [0,(position player)] remoteExecCall ["TON_fnc_ligaDestObj",2];           if(([true,"15",1] call life_fnc_handleInv)) then{   titleText['Du hast deine Destille abgebaut ','PLAIN'];  };},"",0,false,false,"",' _dest = nearestObjects[getPos player,["Land_HeatPump_F"],2.8] select 0; !isNil "_dest" && !isNil {(_dest getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FFE701'>Destille</t>",{ [0] spawn life_fnc_DestInv;},"",0,false,false,"",' _destI = nearestObjects[getPos player,["Land_HeatPump_F"],2.1] select 0; !isNil "_destI" && !isNil {(_destI getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF9A01'>Destille anheizen</t>",{ [[3,l_dest_1,life_id],"TON_fnc_processDest",false,false] call life_fnc_MP; l_dest_1 setVariable["destpro",Nil,true] ;	},"",0,false,false,"",' l_dest_1 = nearestObjects[getPos player,["Land_HeatPump_F"],2.1] select 0; !isNil "l_dest_1" && !isNil {(l_dest_1 getVariable "item")} && !isNil {(l_dest_1 getVariable "destpro")}']];

life_actions = life_actions + [player addAction["<t color='#4264EB'>Maische herstellen</t>",{ [[l_fass_1,life_id],"TON_fnc_processMaisch",false,false] call life_fnc_MP; l_fass_1 setVariable["destpro",Nil,true] ;	},"",0,false,false,"",' l_fass_1 = nearestObjects[getPos player,["Land_WaterBarrel_F"],1.5] select 0; !isNil "l_fass_1" && !isNil {(l_fass_1 getVariable "item")} && !isNil {(l_fass_1 getVariable "destpro")}']];

life_actions = life_actions + [player addAction["<t color='#FFE701'>Methyl-Eimer</t>",{ [1] spawn life_fnc_DestInv;},"",0,false,false,"",' _eimer = nearestObjects[getPos player,["Land_Bucket_painted_F"],1.9] select 0; !isNil "_eimer" && !isNil {(_eimer getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FFE701'>Schnapps-Fass</t>",{ [2] spawn life_fnc_DestInv;},"",0,false,false,"",' _sfass = nearestObjects[getPos player,["Land_BarrelWater_F"],1] select 0; !isNil "_sfass" && !isNil {(_sfass getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#E200FF'>Tarnnetz abbauen</t>",{[4] call life_fnc_packupmauer},"",0,false,false,"",' _netz = nearestObjects[getPos player,["CamoNet_BLUFOR_F"],2.5] select 0; !isNil "_netz" && !isNil {(_netz getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Zelt abbauen</t>",{[3] call life_fnc_packupmauer},"",0,false,false,"",' _zelt = nearestObjects[getPos player,["Land_TentA_F"],2.5] select 0; !isNil "_zelt" && !isNil {(_zelt getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Maische-Fass abbauen</t>",{[7] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,["Land_WaterBarrel_F"],2.5] select 0; !isNil "_fass" && !isNil {(_fass getVariable "item")} && !isNil {(_fass getVariable "destpro")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Klappstuhl abbauen</t>",{[5] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,["Land_CampingChair_V1_f"],2.5] select 0; !isNil "_fass" && !isNil {(_fass getVariable "item")}']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Klappstuhl abbauen</t>",{[6] call life_fnc_packupmauer},"",0,false,false,"",' _fass = nearestObjects[getPos player,["Land_CampingChair_V2_f"],2.5] select 0; !isNil "_fass" && !isNil {(_fass getVariable "item")}']];
