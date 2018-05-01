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
║ File: HBuch1.hpp
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/
#define GUI_GRID_X	(0.1)
#define GUI_GRID_Y	(0.054)
#define GUI_GRID_W (0.01)
#define GUI_GRID_H (0.067)

class liga_HB1 {
	idd = 4950;
	name= "liga_HB1";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\LigaBuch\Tanoa_Buch_0.jpg";
			x = -0.25;
			y = -0.1;
			w = 1.5;
			h = 1.035;
		};
	};
	
	class controls {	
		class Ligadef : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; ";
			x = 0;
			y = 0;
			w = 0;
			h = 0;
		};
		class Ligaweiter : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB2"";playSound ""HBuch""; ";
			x = 0.922 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.89 - (1 / 25);
			w = 0.09;
			h = (1 / 25);
		};
		
		//
		
		class Liga1 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB2"";playSound ""HBuch""; ";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y;
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga2 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB7""; playSound ""HBuch"";";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + GUI_GRID_H;
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga3 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB9"";playSound ""HBuch""; ";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 2 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		////////////
		class Liga4 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB9""; playSound ""HBuch"";";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 3 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		////////////////
		class Liga5 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB9a""; playSound ""HBuch"";";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 4 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga6 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0.15, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB10"";playSound ""HBuch""; ";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 5 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga7 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB11""; playSound ""HBuch"";";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 6 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga8 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB12"";playSound ""HBuch""; ";
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 7 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		
		class Liga9 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB13"";playSound ""HBuch""; ";			
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 8 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
		};
		/*
		class Liga10 : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB14""; playSound ""HBuch""; ";
			///////// 
			x = 0.455 + GUI_GRID_X;
			y = GUI_GRID_Y + ( 9 * GUI_GRID_H);
			w = 0.54 + GUI_GRID_W;
			h = GUI_GRID_H;
			////////
		};		
		*/
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1; 
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] ={0.17, 0, 0, 0.5};
			text = "$STR_Global_Close";
			class Attributes {	align = "center"; };
			onButtonClick = "closeDialog 0;";
			x = 1.09375;
			y = 0.95;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class CraftRez : life_RscButtonMenu {
			idc = -1; 

			colorBackground[] ={0, 0, 0.17, 0.5};
			text = "Rezepte";
			class Attributes {	align = "center"; };
			onButtonClick = "closeDialog 0; []spawn LIGACL_fnc_LigaCraftMenu;";
			x = -0.25;
			y = 0.95;
			w = (6.25 / 40);
			h = (1 / 25);
		};			
	};
};