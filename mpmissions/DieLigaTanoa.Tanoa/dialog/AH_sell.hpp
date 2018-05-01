class AH_sell 
{
	idd = 15000;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {};
	
	class controls {
		class RscText_1000: Life_RscText
		{
			idc = -1;
			x = 0.311778 * safezoneW + safezoneX;
			y = 0.301967 * safezoneH + safezoneY;
			w = 0.382515 * safezoneW;
			h = 0.385065 * safezoneH;
			colorBackground[] = {0, 0, 0.055, 0.6};
		};
		class RscText_1001: Life_RscText
		{
			idc = -1;
			text = "Dein Inventar"; //--- ToDo: Localize;
			x = 0.31785 * safezoneW + safezoneX;
			y = 0.312969 * safezoneH + safezoneY;
			w = 0.127505 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscListbox_1500: Life_RscListbox
		{
			idc = 15001;
			x = 0.31785 * safezoneW + safezoneX;
			y = 0.345974 * safezoneH + safezoneY;
			w = 0.188222 * safezoneW;
			h = 0.330055 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_1002: Life_RscText
		{
			idc = -1;
			text = "Verkaufe ausgewaehlten Gegenstand"; //--- ToDo: Localize;
			x = 0.512143 * safezoneW + safezoneX;
			y = 0.356976 * safezoneH + safezoneY;
			w = 0.127505 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscText_1003: Life_RscText
		{
			idc = -1;
			text = "Preis:  $"; //--- ToDo: Localize;
			x = 0.512143 * safezoneW + safezoneX;
			y = 0.389982 * safezoneH + safezoneY;
			w = 0.127505 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscEdit_1400: Life_RscEdit
		{
			idc = 15002;
			x = 0.563145 * safezoneW + safezoneX;
			y = 0.392182 * safezoneH + safezoneY;
			w = 0.121433 * safezoneW;
			h = 0.0220037 * safezoneH;
			text = "";
		};
		class RscButtonMenu_2400: Life_RscButtonMenu
		{
			idc = -1;
			text = "Angebot erstellen"; //--- ToDo: Localize;
			x = 0.512143 * safezoneW + safezoneX;
			y = 0.422987 * safezoneH + safezoneY;
			w = 0.176078 * safezoneW;
			h = 0.0220037 * safezoneH;
			onButtonClick = "[] spawn life_fnc_CAH_Sell;";
		};
		class RscButtonMenu_2401: Life_RscButtonMenu
		{
			idc = -1;
			text = "Zeige meine Angebote"; //--- ToDo: Localize;
			show = false;
			x = 0.512143 * safezoneW + safezoneX;
			y = 0.444991 * safezoneH + safezoneY;
			w = 0.176078 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
		class RscButtonMenu_2402: Life_RscButtonMenu
		{
			idc = -1;
			text = "Abbrechen"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.512143 * safezoneW + safezoneX;
			y = 0.469194 * safezoneH + safezoneY;
			w = 0.176078 * safezoneW;
			h = 0.0220037 * safezoneH;
		};
	};
};
