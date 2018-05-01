class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";

	};

};

/*Server Settings*/

class CfgServerSettings
{
	class extDB
	{
		/*Database Selection*/
		Database = "altis-life-rpg-4"; //Database config name
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
	
	class Settings
	{
		Performance = true;
		HC_Init = true;
		HC_mpfnc_log = false;
		SKY_WL[] = {
		
		}; 
	};
};


class CfgFunctions
{
	
	class postInit 
	{
		class main {
			
			file = "life_server";
			class postInit {
				//preInit = 1;
				 postInit = 1;
			};
		};		
	};
	
	class Liga_Server
	{
		tag= "Liga";
		
		class Init
		{
			file = "\life_server";
			
			class LigaServerinit {};
		};
	};
	
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
			class marketInsert {};
			class marketInsertTimes {};
			class repaintVehicle {};
		};
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedCrimes {};
			class wantedTicket {};
			class wantedProfUpdate {};
			//class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
			class initWanted {};
			//class cookieJar {};
		};
		
		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			
			class jailSys {};
			class jailSysMed {};
			class jailTimer {};
			class jailPlayer {};
		};
		
	};

	class SKY_System
	{
		tag = "SPY";
		class SKY_net_server
		{
			file = "\life_server\SKY";

			class cookieJar {};
		};	
	};	
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			
			class managesc {};
			class cleanup {};
		//	class huntingZone {};
		//	class huntingZone1 {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class getVehiclesSupp {};
			class SuppVehBack {};
			class vehicleStore {};
			class vehicleStoreVer {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};            
			class robShops {}; 
			class shopState {};
			//class handleDBLog {};
			class vehicleRepaint {};
			class keyDBchange {};
		};
		
		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse 				{};
			class fetchPlayerHouses 	{};
			class initHouses 			{};
			class sellHouse 			{};
			class updateHouseContainers {};
			class updateHouseTrunk 		{};
			class houseCleanup 			{};
			class preCheckHouse 		{};
		};
		
		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
		
		class Client_Code
		{
			file = "\life_server\Functions\Client";
			
			class pickupAction {};
		};		
		
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
			class cleanupMessages {};
		};
/*		
		class Paintball
		{
			
		file = "\life_server\Functions\paintball";
			class paintball {};
			class game {};
		};
*/		
		class Liga
		{
			file = "\life_server\Functions\Liga";
			
			class LigaLifeInit {};
			class BaustellNoti {};
			class BauInit {};
			//class setHit {};
			class schnee {};
			class itemWeight {};
			class getHit {};
			class LigaPerformance {};	
			class RestartClean {};
			class simDisable {};
			class IntroControll {};			//TON_fnc_IntroControll
		};
		
		class LigaWH
		{
			file = "\life_server\Functions\Liga\WH";
			
			class ligaWHinit {};
			class ligaWHset {};
			class ligaWHdump {};
			class ligaWHranDump {};

		};
		
		class LigaDB
		{
			file = "\life_server\Functions\Liga\DB";
			
			class ComBaustellInsert {};	
			class ComBaustellGet {};
			class ComBaustellLOG {};
			class LeimWE {};
			class LeimDBget {};
			class LeimDBset {};
			class bohrturmReSpawn {};
		};
				
		class LigaPVC
		{
			file = "\life_server\Functions\Liga\PVC";
			
			class getIDPVC {};
			class sendPVC {};
		};
		
		class LigaActions
		{
			file = "\life_server\Functions\Liga\actions";
			
			class ligaDestObj {};
			class ligaDest {};
			class processDest {};
			class processMaisch {};
		};
		class LigaRadio
		{
			file = "\life_server\Functions\Liga\Radio";
			
			class radio 		{};
			class notsteu 		{};
			class notwarte 		{};
		};
		
		class Tankstelle
		{
			file = "\life_server\Scripte\Tankstellen";
			
			class initTankst 		{};	//TON_fnc_initTankst
			class addTank			{};	//TON_fnc_addTank
			class sellTank			{};	//TON_fnc_sellTank
			class fetchPlayerTanks 	{};	//TON_fnc_fetchPlayerTanks
			class updateTankTrunk 	{};	//TON_fnc_updateTankTrunk
			class Schlosswech 		{};	//TON_fnc_Schlosswech
			class TankABM 			{};	//TON_fnc_TankABM
			class ABMcount 			{};	//TON_fnc_ABMcount

		};		
		
		class LadenServ
		{
		file = "\life_server\Scripte\Laden";
			
			class addLaden 			{};	//TON_fnc_addLaden
			class initLaden			{};	//TON_fnc_initLaden
			class fetchPlayerLaden	{};	//TON_fnc_fetchPlayerLaden
			class updateKass		{};	//TON_fnc_updateKass
			class updateZusa		{};	//TON_fnc_updateZusa
			class cleanupLaden		{};	//TON_fnc_cleanupLaden
			class KassAction		{};	//TON_fnc_KassAction
			class sellLaden			{};	//TON_fnc_sellLaden
			class LadenFeuerwerk	{};	//TON_fnc_LadenFeuerwerk

		};			
	
		class LottoServer
		{			
			file = "\life_server\Scripte\Lotto";
			

			class LottoInit					{};		//TON_fnc_LottoInit
			class LottoAddSchein			{};		//TON_fnc_LottoAddSchein
			class LottoZieh					{};		//TON_fnc_LottoZieh
			class LottoSuchGewinn			{};		//TON_fnc_LottoSuchGewinn
			class LottoCalPot				{};		//TON_fnc_LottoCalPot
			class LottoPlInfo				{};		//TON_fnc_LottoPlInfo
			class callLottoWinner			{};		//TON_fnc_callLottoWinner
		};		
		
		class Firework_server
		{			
			file = "\life_server\Scripte\Feuerwerk";
			

			class FireWork					{};		//TON_fnc_FireWork

		};	
		
		class AutoHandler
		{			
			file = "\life_server\Scripte\GebHandel";
			

			class GebHanGetQ					{};		//TON_fnc_GebHanGetQ
			class GebHanGetDet					{};		//TON_fnc_GebHanGetDet
			class GebHanBuy						{};		//TON_fnc_GebHanBuy

		};			
		class Airdrop
		{
			file = "\life_server\Functions\airdrop";
			
			class generateAirdrop {};
		};
};
		
	class AoD_System
    {
        tag = "AoD";
        class Market
        {
            file = "\life_server\Functions\AoD\Market";
			
            class marketconfiguration {};
        };
    };	
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};

