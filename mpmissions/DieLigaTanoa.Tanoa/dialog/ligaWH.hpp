#define HO 0.1
class wh_menu {
	idd = 4000;
	name= "wh_menu";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = ;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0, 0.17, 0, 0.6};	
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
			h = 0.7 - (22 / 250) + HO;
		};
/*						class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\In1.jpg";
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
*/		
		class whText : Life_RscText
		{
			idc = 4041;
			colorBackground[] = {0, 0.17, 0, 0.7};
			text = "Lagerbestände";
			sizeEx = 0.04;
			x = 0.12; 
			y = 0.27;
			w = 0.76; 
			h = 0.04;
		};
	};
	
	class controls {

		class whList : Life_RscListBox 
		{
			idc = 4001;
			text = "";
			sizeEx = 0.038;
			
			x = 0.12; 
			y = 0.31;
			w = 0.378;
			h = 0.7 - (50 / 250) + HO;
		};
		
		class whpycList : Life_RscListBox 
		{
			idc = 4002;
			text = "";
			sizeEx = 0.038;
			
			x = 0.5; 
			y = 0.31;
			w = 0.378;
			h = 0.7 - (50 / 250) + HO;
		};
		

			
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 4003;
			text = "Liga - Warenhaus";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
/*
		class MainWH : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			size = 0.03;
			class Attributes {	align = "left"; };
			text = "Zurueck";
			colorBackground[] ={0.17, 0, 0, 0.9};
			onButtonClick = "closeDialog 0; WH_ind = (WH_ind - 1) max 0; [ ] call life_fnc_ligaWHdiShow;";
			x = 0.41125;
			y = 0.9 - (1 / 25) + HO;
			w = (6.25 / 40);
			h = (1 / 25);
		};
*/
		class WH1 : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			class Attributes {	align = "left"; };
			size = 0.03;
			text = "Zurueck";
			colorBackground[] ={0.17, 0, 0, 0.9};
			onButtonClick = " WH_ind = (WH_ind - 1) max 0; [ ] call life_fnc_ligaWHdisp;";
			x = 0.5775;
			y = 0.9 - (1 / 25) + HO;
			w = (6.25 / 40);
			h = (1 / 25);
		};	

		class WH2 : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			class Attributes {	align = "left"; };
			size = 0.03;
			text = "Weiter";
			colorBackground[] ={0.17, 0, 0, 0.9};
			onButtonClick = " WH_ind = (WH_ind + 1) min ((count (getArray(missionConfigFile >> 'Warehouse' >> 'WH_Displ' >> 'dispShops') )) - 1); [ ] call life_fnc_ligaWHdisp;";
			x = 0.74375;
			y = 0.9 - (1 / 25) + HO;
			w = (6.25 / 40);
			h = (1 / 25);
		};		
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			size = 0.03;
			text = "$STR_Global_Close";
			colorBackground[] ={0.17, 0, 0, 0.9};
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.9 - (1 / 25) + HO;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};