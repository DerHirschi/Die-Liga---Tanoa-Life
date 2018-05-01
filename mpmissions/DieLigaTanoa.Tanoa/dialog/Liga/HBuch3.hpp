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
║ File: HBuch3.hpp
║ Author: Hirschi Liga-Life
╚══════════════════════════════════════════════════╝
*/

class liga_HB3 {
	idd = 4952;
	name= "liga_HB3";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class Backdrop : Life_RscPicture
		{
		idc = -1;
		text = "textures\LigaBuch\Tanoa_Buch_2.jpg";
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
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB4"";playSound ""HBuch""; ";
			x = 0.922 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.89 - (1 / 25);
			w = 0.09;
			h = (1 / 25);
		};
		
		class Ligazur : Liga_RscButtonMenuUns {
			colorBackground[] ={0, 0, 0, 0};
			idc = -1;
			text = "";
			onButtonClick = "closeDialog 0; createDialog ""liga_HB2""; playSound ""HBuch""; ";
			x = - 0.177;
			y = 0.895 - (1 / 25);
			w = 0.09;
			h = (1 / 25);
		};
		
				class ButtonClose : life_RscButtonMenu {
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
		
				class ButtonIndex : life_RscButtonMenu {
			idc = -1; 

			colorBackground[] ={0, 0.17, 0, 0.5};
			text = "Inhalt";
			class Attributes {	align = "center"; };
			onButtonClick = "closeDialog 0; createDialog ""liga_HB1""; playSound ""HBuch"";";
			x = 1.09375 - (6.25 / 40) - 0.005;
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
