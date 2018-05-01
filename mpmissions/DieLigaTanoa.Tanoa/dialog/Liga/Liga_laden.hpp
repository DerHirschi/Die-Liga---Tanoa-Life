//#define INFINITE 1e+1000

class LadenMenu
{
	
	idd = 3500;
	name = "LadenMenu";
	movingEnable = false;
	enableSimulation = true;
	//duration = INFINITE;

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
	║	File: Liga_laden.hpp	
	║		
	║	Author:  Hirschi - Die Liga	
	║	Vorlage: Tonic´s Altis Life R.P.G. Ver.:4.3	
	╠══════════════════════════════════════════════════╗
	║
	║	Danke ArmA GUI-EDITOR ...
	║	Trotzdem noch 5 ver*** Std. Arbeit.
	║	
	║	Ich hasse Displays !!!
	║
	╚══════════════════════════════════════════════════╝
*/
	class controlsBackground
	{
		
	
		class RscTitleBackground : Life_RscText
		{//HG
			colorBackground[] = {0, 0, 0.055, 0.7};
			idc = -1;
			
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.360937 * safezoneW;
			h = 0.451 * safezoneH;
		};
		class MoneyBild : Life_RscPicture
		{//GeldPi
			
			idc = -1;
			text = "icons\Money.paa";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class RscBackground : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0, 0, 0, 0.8};
			idc = 3503;
			text = "Laden Menue";
			x = 0.32677 * safezoneW + safezoneX;
			y = 0.280704 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.027 * safezoneH;
		};

		class OptText1 : Life_RscText
		{//Text Balken oben
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			sizeEx = 0.035;
			text = "Marker ( 10.000 $ / Relog ) :";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.033 * safezoneH;
		};	
		
		class OptText2 : Life_RscText
		{//Text Balken oben
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			sizeEx = 0.035;
			text = "Lotto ( 10.000 $ / Relog ) :";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};	
		
		class OptText3 : Life_RscText
		{//Text Balken oben
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			sizeEx = 0.035;
			text = "Name des Ladens :";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.022 * safezoneH;
		};			
		
		/*
		class RscTitleText : Life_RscTitle
		{//Text Balken mitte 
		
			colorBackground[] = {0, 0, 0, 0};
			idc = 3501;
			text = "";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.022 * safezoneH;
		};
		*/
		
		
		class ItemBG1 : Life_RscText
		{// Text mitte Balken rechts
			idc = -1;
			colorBackground[] = {0.4, 0.4, 0.4, 0.3};
			
			x = 0.510312 * safezoneW + safezoneX; 
			y = 0.452297 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW; 
			h = 0.0717 * safezoneH;
		};		
		class ItemText1 : Life_RscText
		{// Text mitte Balken rechts
		
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Item 1:";
			sizeEx = 0.04;
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW; 
			h = 0.066 * safezoneH;
		};
		

		
		
		class ItemBG2 : Life_RscText
		{// Text mitte Balken rechts
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.3};
			
			x = 0.510312 * safezoneW + safezoneX; 
			y = 0.531 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW; 
			h = 0.077 * safezoneH;
		};			
		class ItemText2 : Life_RscText
		{// Text mitte Balken rechts
		
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Item 2:";
			sizeEx = 0.04;
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.511 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW; 
			h = 0.066 * safezoneH;
		};


		
		class ItemBG3 : Life_RscText
		{// Text mitte Balken rechts
			idc = -1;
			colorBackground[] = {0.4, 0.4, 0.4, 0.3};
			
			x = 0.510312 * safezoneW + safezoneX; 
			y = 0.618 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW; 
			h = 0.077 * safezoneH;
		};	
		class ItemText3 : Life_RscText
		{// Text mitte Balken rechts
		
			idc = -1;
			colorBackground[] = {0, 0, 0, 0};
			text = "Item 3:";
			sizeEx = 0.04;
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.599 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW; 
			h = 0.066 * safezoneH;
		};
		

		
		/*
		class VehicleWeight : RscTitleText
		{
			idc = 3504;
			style = 1;
			text = "";
		};
		*/
		class RscTrunkText : Life_RscText
		{// Text mitte Balken links 
		
			idc = -1;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "Gesamt Bestand";
			sizeEx = 0.04;
			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class RscPlayerText : Life_RscText
		{// Text mitte Balken rechts
		
			idc = -1;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "Preise und Einstellungen";
			sizeEx = 0.04;
			
			x = 0.510312 * safezoneW + safezoneX; 
			y = 0.423 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW; 
			h = 0.022 * safezoneH;
		};	
	};
	
	class Controls
	{
		class RscBackground : Life_RscTitle
		{//Text Balken oben
			
			colorBackground[] = {0, 0, 0, 0.8};
			idc = 3503;
			text = "Laden Menue";
			x = 0.32677 * safezoneW + safezoneX;
			y = 0.280704 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.027 * safezoneH;
		};		
		class MoneyText : Life_RscText
		{//GeldText
			
			idc = 3507;
			text = "";
			sizeEx = 0.09;
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class LadenName : Life_RscEdit
		{
			idc = 3501;
			text = "";
			sizeEx = 0.035;
			x = 0.453594 * safezoneW + safezoneX; 
			y = 0.379 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW; 
			h = 0.022 * safezoneH;
		};			
		
		class Check1 : Life_RscButtonMenuOh
		{
			idc = 3551;
		//	text = "";
			colorBackground[] = {0, 0, 0, 0.3};
			onButtonClick = "[]spawn{	_house	= (nearestObject [(getPosATL player), 'House_F']);	_extra	 	= _house getVariable 'ladextra';	if(!isNil '_extra') then {		if((_extra select 1) isEqualTo 0) then {			_house setVariable ['ladextra',[(ctrlText 3501),1,(_extra select 2)],true]; ((findDisplay 3500) displayCtrl 3551)ctrlSetBackgroundColor [0, 0.3, 0, 1];		}else{			_house setVariable ['ladextra',[(ctrlText 3501),0,(_extra select 2)],true]; ((findDisplay 3500) displayCtrl 3551)ctrlSetBackgroundColor [0.3, 0, 0, 1];		};	};};";
			x = 0.453594 * safezoneW + safezoneX; 
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW; 
			h = 0.022 * safezoneH;
				class Attributes
				{
					font = "TahomaB";
					color = "#E5E5E5";
					align = "center";
					shadow = "false";
					size = "1";
				};
		};
		
		class Check2 : Life_RscButtonMenuOh
		{
			idc = 3552;
		//	text = "";			
			colorBackground[] = {0, 0, 0, 0.3};
			onButtonClick = "[]spawn{		_house	= (nearestObject [(getPosATL player), 'House_F']);	_extra	 	= _house getVariable 'ladextra';	if(!isNil '_extra') then {		if((_extra select 2) isEqualTo 0) then {			_house setVariable ['ladextra',[(ctrlText 3501),(_extra select 1),1],true]; ((findDisplay 3500) displayCtrl 3552)ctrlSetBackgroundColor [0, 0.3, 0, 1];		}else{			_house setVariable ['ladextra',[(ctrlText 3501),(_extra select 1),0],true]; ((findDisplay 3500) displayCtrl 3552)ctrlSetBackgroundColor [0.3, 0, 0, 1]; 		};	};};"; 

			x = 0.453594 * safezoneW + safezoneX; 
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW; 
			h = 0.022 * safezoneH;
				class Attributes
				{
					font = "TahomaB";
					color = "#E5E5E5";
					align = "center";
					shadow = "false";
					size = "1";
				};
		};	
		
		
		
		
		class GesBestandBox : Life_RscListBox
		{//Box links
	
			idc = 3502;
			colorBackground[] = {0.7, 0.7, 0.8, 0.3};
			text = "";
			sizeEx = 0.035;
			
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.455074 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;  
			h = 0.242 * safezoneH;
		};
		
		
		
		
		class ItemBox1 : Life_RscListBox
		{//Box links

			idc = 3504;
			colorBackground[] = {1, 1, 1, 0.3};
			text = "";
			sizeEx = 0.035;
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;  
			h = 0.022 * safezoneH;
		};		
		class ItemPreisEdit1 : Life_RscEdit
		{
			idc = 3514;
			text = "1";
			sizeEx = 0.035;
			x = 0.613437 * safezoneW + safezoneX; 
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW; 
			h = 0.022 * safezoneH;
		};		
		class ItemButton1 : Life_RscButtonMenu
		{
			idc = -1;
			text = ">>";
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "[3514,3504,0] call LIGACL_fnc_getListData;";
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW; 
			h = 0.033 * safezoneH;
				class Attributes
				{
					font = "TahomaB";
					color = "#E5E5E5";
					align = "center";
					shadow = "false";
					size = "1.2";
				};			
		};		
		
		
		
		
		
		
		
		class ItemBox2 : Life_RscListBox
		{//Box links
	
			idc = 3505;
			colorBackground[] = {1, 1, 1, 0.3};
			text = "";
			sizeEx = 0.035;
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;  
			h = 0.022 * safezoneH;
		};	
		class ItemPreisEdit2 : Life_RscEdit
		{
			idc = 3515;
			text = "1";
			sizeEx = 0.035;
			x = 0.613437 * safezoneW + safezoneX; 
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW; 
			h = 0.022 * safezoneH;
		};		
		class ItemButton2 : Life_RscButtonMenu
		{
			idc = -1;
			text = ">>";
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "[3515,3505,1] call LIGACL_fnc_getListData;";
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW; 
			h = 0.033 * safezoneH;
				class Attributes
				{
					font = "TahomaB";
					color = "#E5E5E5";
					align = "center";
					shadow = "false";
					size = "1.2";
				};			
		};		


		

		class ItemBox3 : Life_RscListBox
		{//Box links
	
			idc = 3506;
			colorBackground[] = {1, 1, 1, 0.3};
			text = "";
			sizeEx = 0.035;
			
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;  
			h = 0.022 * safezoneH;
		};		
		class ItemPreisEdit3 : Life_RscEdit
		{
			idc = 3516;
			text = "1";
			sizeEx = 0.035;
			x = 0.613437 * safezoneW + safezoneX; 
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW; 
			h = 0.022 * safezoneH;
		};		
		class ItemButton3 : Life_RscButtonMenu
		{
			idc = -1;
			text = ">>";
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "[3516,3506,2] call LIGACL_fnc_getListData;";
			x = 0.515469 * safezoneW + safezoneX; 
			y = 0.654 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW; 
			h = 0.033 * safezoneH;
	
				class Attributes
				{
					font = "TahomaB";
					color = "#E5E5E5";
					align = "center";
					shadow = "false";
					size = "1.2";
				};
		};			

		class ButtonOK : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0, 0.2, 0, 0.9};
			text = "Speichern";
			onButtonClick = "			[]spawn	{				_cont	= nearestObjects [player, ['Land_CashDesk_F'], 20];		_house	= (nearestObject [(getPosATL player), 'House_F']);				_extra	 	= _house getVariable 'ladextra';			if(!isNil '_extra') then {					_house setVariable ['ladextra',[(ctrlText 3501),(_extra select 1),(_extra select 2)],true];				};			closeDialog 0;	[] spawn LIGACL_fnc_initLaden; [_cont] remoteExec ['LIGACL_fnc_addLadenAction',  -2  ];	};			";
			x = 0.319531 * safezoneW + safezoneX; 
			y = 0.725 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW; 
			h = 0.022 * safezoneH;
		};		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.2, 0, 0, 0.9};
			text = "Abbrechen";
			onButtonClick = "closeDialog 0;";
			x = 0.385719 * safezoneW + safezoneX; 
			y = 0.725 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW; 
			h = 0.022 * safezoneH;
		};
		class Geldholen : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0, 0, 0.2, 0.9};
			text = "Geld Abholen";
			onButtonClick = "closeDialog 0; [] spawn { _kasse = life_trunk_vehicle getVariable ['kassinh',-1]; if(_kasse isEqualTo -1) then {hint 'Ups.. da ist was schief gelaufen. Bitte versuche es noch einmal oder melde dich im Support.. Danke.';}else{life_trunk_vehicle setVariable ['kassinh',0,true]; life_cash = life_cash + _kasse; hint format['Du hast %1 $ aus der Kasse genommen.',_kasse]; }; };";
			x = 0.587656 * safezoneW + safezoneX; 
			y = 0.725 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW; 
			h = 0.022 * safezoneH;
		};	
		class ButtonFW : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.6, 0.6, 0, 0.9};
			text = "Feuerwerk 80.000 $";
			onButtonClick = "closeDialog 0; []spawn {if(life_atmcash < 80000)exitWith{hint 'Du hast nicht genug Geld auf dem Konto..'};	_house	= (nearestObject [(getPosATL player), 'House_F']);	[_house] remoteExec ['TON_fnc_LadenFeuerwerk',2]; life_atmcash = life_atmcash - 80000;	};";
			x = 0.463906 * safezoneW + safezoneX; 
			y = 0.725 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW; 
			h = 0.022 * safezoneH;
		};		
	};
};