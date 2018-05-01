class nanoEMPConsole {
	idd = 3494;
	name= "nanoEMPConsole";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_openEmpMenu;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0.15, 0, 0.6};	
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0.055, 0.6};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};
	
	class controls {
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 2901;
			text = "EMP Operator Konsole";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class PlayerList_Admin : Life_RscListBox 
		{
			idc = 2902;
			text = "";
			sizeEx = 0.035;
			//colorBackground[] = {0,0,0,0};
			//onLBSelChanged = "hint format [""%1"",_this select 1];";
			
			x = 0.12; y = 0.26;
			w = 0.30; h = 0.4;
		};
		
		class PlayerBInfo : Life_RscStructuredText
		{
			idc = 2903;
			text = "";
			x = 0.42;
			y = 0.25;
			w = 0.35;
			h = 0.6;
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "Schliesen";
			colorBackground[] ={0.2, 0, 0, 0.9};
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Refresh : Life_RscButtonMenu {
			idc = -1;
			text = "Suchen";
			colorBackground[] = {0, 0.25, 0, 0.9};
			onButtonClick = "[] spawn life_fnc_scanVehicles;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		/*class WarnEMP : Life_RscButtonMenu {
			idc = 2030;
			text = "Warnen";
			onButtonClick = "";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};*/

		class ExecEMP : Life_RscButtonMenu {
			idc = 2070;
			text = "Auslösen";
			colorBackground[] = {0.6, 0, 0, 0.9};
			onButtonClick = "[] spawn life_fnc_empVehicle;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class WarnEMP : Life_RscButtonMenu {
			idc = 2060;
			text = "Warnen";
			colorBackground[] = {0, 0.5, 0, 0.9};
			onButtonClick = "[] spawn life_fnc_warnVehicle;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};