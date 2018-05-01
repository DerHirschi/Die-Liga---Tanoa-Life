#include <LigaHandyMac.h>
#define SETX profileNamespace setVariable ["IGUI_GRID_GPS_X",(safezoneW * 0.576756 )]
#define SETY profileNamespace setVariable ["IGUI_GRID_GPS_Y",(safezoneY * -2.3036  )]
#define SETW profileNamespace setVariable ["IGUI_GRID_GPS_W",(safezoneW * 0.11668  )]
#define SETH profileNamespace setVariable ["IGUI_GRID_GPS_H",(safezoneH * 0.171559 )]
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
	║ Author: Hirschi - Die Liga
	║ 
	║ Alle Positionen der Displays wurden 
	║ ausschließlich mit einem selbst entwickelten
	║ GUI Builder bestimmt !!!! 	║ 
	║  
	╚══════════════════════════════════════════════════╝
*/
SETX;
SETY;
SETW;
SETH;

liga_handy_kl = true;
handy_ani = false;
handy_actApp = -1;
handy_menuOpen = false;
liga_handyAction = false;
liga_msg_strig = "";
liga_visCheck = 0;

Tick;

liga_fnc_handy			 = CoFin CF(1);
liga_fnc_app_list		 = CoFin CF(2);
liga_fnc_daytime		 = CoFin CF(3);
liga_fnc_telBuch		 = CoFin CF(4);
liga_fnc_APPload		 = CoFin CF(5);
liga_fnc_MessApp		 = CoFin CF(6);
liga_fnc_map			 = CoFin CF(7);
liga_fnc_hgsettings		 = CoFin CF(8);
liga_fnc_Anim			 = CoFin CF(9);
liga_fnc_HG				 = CoFin CF(10);
liga_fnc_newMsg			 = CoFin CF(11);
liga_fnc_HanSettings	 = CoFin CF(12);
liga_fnc_HomeScr		 = CoFin CF(13);
Liga_fnc_benzPreise 	 = CoFin CF(14);
liga_fn_getChatStr  	 = CoFin CF(15);
liga_fnc_DblMenAct 	 	 = CoFin CF(16);
//liga_fnc_HandyInit		 = CoFin CF(17);
liga_fnc_oben_list		 = CoFin CF(18);
liga_fnc_setHGsett		 = CoFin CF(19);
liga_fnc_Menu_u			 = CoFin CF(20);
liga_fnc_BackBut		 = CoFin CF(21);
liga_fnc_OptMenu		 = CoFin CF(22);
liga_fnc_oben			 = CoFin CF(23);
liga_fnc_setFav			 = CoFin CF(24);
//liga_fnc_hastPost		 = CoFin CF(25);
//liga_fn_getNamObjPlayer	 = CoFin CF(26);
liga_fn_getNamObjPlayer	 = CoFin CF(27);

Tack;