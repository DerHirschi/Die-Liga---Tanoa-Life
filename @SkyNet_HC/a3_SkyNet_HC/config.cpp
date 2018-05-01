/*
╔═════════════════════════════════════════════════════╗
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░░█▀▀▀▄░▄░░░░░░░█░░░░▄░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░░░░░█░░░█░░░█▀▀▀░░█░░░░░░░█▀▀▀▀█░█▀▀▀█░░░░░░░░░░░║
║░░░░░░░░█░░░█░█░█▀▀▀░░█░░░░█░░█░░░░█░█░░░█░░░░░░░░░░░║
║░░░░░░░░▀▀▀▀░░▀░▀▀▀▀░░▀▀▀▀░▀░░▀▀▀▀▀█░▀▀▀▀█░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄█░░░░░░░░░░░░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
║░░░░▀▀▀▀░░░█░░░█░░▀░░░░░▀░░░░░██░░░█░░░░░░░▀▀▀█▀▀▀░░░║
║░░░█░░░░░░░█░░█░░░░▀░░░▀░░░░░░█░█░░█░░█▀▀▀░░░░█░░░░░░║
║░░░░▀▀▀░░░░█▀▀░░░░░░▀░▀░░░▀▀░░█░░█░█░░█▀▀▀░░░░█░░░░░░║
║░░░░░░░█░░░█░░█░░░░░░█░░░░░░░░█░░░██░░▀▀▀▀░░░░█░░░░░░║
║░░░▀▀▀▀░░░░▀░░░▀░░░░░▀░░░░░░░░▀░░░░▀░░░░░░░░░░▀░░░░░░║
║░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░║
╠═════════════════════════════════════════════════════╝
║ File: config.cpp
║ Author: Hirschi - Die Liga
╚═════════════════════════════════════════════════════╝
*/

class CfgPatches {
	class a3_SkyNet {
		units[] = {};
		weapons[] = {};
		a3_SkyNet_version = 0.02;
		requiredVersion = 1.54;
		requiredAddons[] = {};
	};
};

class CfgHCSettings
{
	class Settings
	{
		VERs = "0.21 Alpha extDB+ HC"; 	// Version
		SKYons = true; 					// SKY - Net ON / OFF
		DBons = true; 					// DB ON / OFF
		SYSlogss = true;				// Syslog auf DB ON / OFF
		RPT = true;						// Debug Ausgabe via RPT
		DBRPT = true; 					// Debug Ausgabe via DB
		BEBUG = true; 					// Erweiterte Debug Ausgaben
		SKY_IDs = "HC_1"; 				// ID für RPT´s usw
	};
	
	class Tasks
	{		
		life_MP 	= false;					// life_fnc_MP LOG 2 DB
		BIS_MP 		= false;					// BIS_fnc_MP LOG 2 DB
		LogLink 	= true;					// EVH LogLink von Spieler zu HC
		GELDLOG 	= true;					// Geldlog 2 DB
		ServerDiag 	= true;				// Server Diagnose ( FPS Log )
		//ClientRemoteLink = true;		// Remote EVH von CL zu HC um Scripte zu Rem
	};
	 
	class Scripts
	{
		Schiffswrack 	= false;		//Schiffswrack Trunk wird nicht voll
		Jagen 			= true;			//Jagen
		JagenHasen		= false;		//Jagen Hasenjagdgebiet
		Airdrop 		= true;			//Airdrop
		Zombies 		= true;			//Zombies
		Bohrturm 		= true;			//Bohrturm
	};
	
	class Admins
	{
		Admin_aray1[] = {	};	//{Admin,Level}
		Admin_aray2[] = {};	//{Admin,Level}
		Admin_aray3[] = {};	//{Admin,Level}
		Admin_aray4[] = {};	//{Admin,Level}
		Admin_aray5[] = {
							"765611...."
						};	//{Admin,Level}
		
	};
	
	class DB1
	{
		// Daten Bank 1
		DB = true;		
		/*Database Selection*/
		Database = "SKYhc1"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = true; //Log queries? Only set this to true if you are developing.
	};
	
	class DB2
	{
		// Daten Bank 1
		DB = true;
		/*Database Selection*/
		Database = "SKYhc2"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = true; //Log queries? Only set this to true if you are developing.
	};

	class DB3
	{
		// Daten Bank 1
		DB = true;		
		/*Database Selection*/
		Database = "SKYhc3"; //Database config name
		/*RCON Settings*/
		RCON = false; //Enabled?
		RCON_Selection = "RCON"; //Selection of what RCON config to pull from the extDB Configuration file eg. [RCON]
		/*VAC Settings*/
		VAC = false; //Enabled? If you want to ban VAC'd players, edit it in the extDB Configuration file.
		/*MISC settings*/
		MISC = false; //Enabled? Allows you to use certain features that are not really related to the database for extDB
		/*Logging Settings*/
		LOG = false; //Custom Logging Enabled?
		LOG_Settings[] = {{"HACKER","hacker.log"},{"LOG2","debug.log"}}; //First Selection = ID | Second Selection = Log File
		/*Debug*/
		MySQL_Query = true; //Log queries? Only set this to true if you are developing.
	};	
};


class CfgFunctions {
	class a3_SkyNet
	{
		tag = "SKYINIT";
		
		class Init {
			file = "a3_SkyNet_HC";
			class SkyNET_HC_Init {
			//	preInit = 1;
				postInit = 1;
			// preStart = 1;				
			};
			class sessID {};
		};
	};	
		
	class System {
			
		tag = "SKY";		
		
		class Admin
		{
			file = "\a3_SkyNet_HC\System\Admin";
			
			class AdminLogin {};
			class sendCode {};
			class sendClientCode {};
			//class Code {};
		
		};	
		
		class Log
		{
			file = "\a3_SkyNet_HC\System\Log";
			
			class DBlogSys {};
			class handleDBLog {};
		//	class EHlog {};
		};	
		
		class Diag
		{
			file = "\a3_SkyNet_HC\System\Diag";
			
			class getSrvParam {};
		};
			
		class Netz
		{
			file = "\a3_SkyNet_HC\System\Netz";
				
			//	class EVH {};
			//	class initHC {};
			class NETinit {};
			class posInit {};
			class MPall {};
			class MPsrv {};
			class MPid {};
			class clrem {};
			class setObjVar {};
			//	class RemLinkexec {};

		};		
			
		class DB
		{
			file = "\a3_SkyNet_HC\System\DB";
				
			class DBinit {};
			class dbCall {};
			class gewinnwar {};
			class brettDBsys {};
			

		};		

		class SKYHCL
		{
			file = "\a3_SkyNet_HC\System\HC";
				
			//class initSKYhc {};			

		};	

		class Map
		{
			file = "\a3_SkyNet_HC\System\Mapping";
				
			class objBuilder {};			
			class objAttatch {};			

		};		
		
		class Loop
		{
			file = "\a3_SkyNet_HC\System";
				
			class MainLoop {};	
		};		
	};
		
		
		
	class Scripte {
			
		tag = "LIGA";		

		class Bohrturm
		{
			file = "\a3_SkyNet_HC\Scripte\Bohrturm";
			
			class turmInit 		{};			
			class turmUP 		{};			
			class turmDOWN		{};			
			class updateTurm 	{};			
			class burnTurm 		{};			
			class TurmProcess 	{};			
			class TurmProcAkt 	{};			
			class ProccInit 	{};			
		};	

		class Schiffswrack
		{
			file = "\a3_SkyNet_HC\Scripte\Airdrop";
			
			class generateAirdropAuto 	{};			
			class generateAirdrop 		{};			
			class generateAirdropZom 	{};			
			class AirdropConfig 		{};			
		};	

		class Airdrop
		{
			file = "\a3_SkyNet_HC\Scripte\Schiffswrack";
			
			class schiffwrackauto {};			
		};	

		class Auktionshaus
		{
			file = "\a3_SkyNet_HC\Scripte\Auktionshaus";
			
			class SAH_addOffer 		{};			
			class SAH_reciever 		{};			
			class SAH_removeOffer 	{};			
			class SAH_Transaction 	{};			
		};		

		class Tankst
		{
			file = "\a3_SkyNet_HC\Scripte\Tankstellen";
			
			//class initTankst		{};			
		
		};		
	};	
};

#include "Liga_objekte.cpp"