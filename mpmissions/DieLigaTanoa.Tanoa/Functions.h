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
	║	File: Functions.h
	║	Tonic´s Altis Life RPG 
	║  	Modified by: Hirschi Liga-Life.de
	╚══════════════════════════════════════════════════╝	
*/
class Socket_Reciever
{
	tag = "SOCK";
	
	class SQL_Socket
	{
		file = "core\session";
		
		class requestReceived 	{};
		class dataQuery 		{};
		class insertPlayerInfo 	{};
		class updateRequest 	{};
		class syncData 			{};
		class updatePartial 	{};
	};
};

class SpyGlass
{
	tag = "SPY";
	
	class Functions
	{
		file = "SpyGlass";
		
	//	class cookieJar			{};
		class menuCheck			{};
		class notifyAdmins		{};
	//	class payLoad			{};
		class variableCheck		{};
	//	class initSpy 		{};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		
		class setupActions 			{};
		class setupEVH 				{};
		class initCiv 				{};
		class initCop 				{};
		class initMedic 			{};
		class welcomeNotification 	{};
		class configuration 		{};
		class initAdac 				{};
		class survival 				{};
	};
	
	class Admin
	{
		file = "core\admin";
		
		class admininfo 		{};
		class adminid 			{};
		class admingetID 		{};
		class adminMenu 		{};
		class adminQuery 		{};
		class SuppATM 			{};
		class SuppClLiz 		{};
		class SuppShop 			{};
		class toSt 				{};
		class funcs 			{};
		class adumenu 			{};
	};
	
	class Medical_System
	{
		file = "core\medical";
		
		class onPlayerKilled 		{};
		class onPlayerRespawn 		{};
		class respawned 			{};
		class revivePlayer 			{};
		class revived 				{};
		class medicMarkers 			{};
		class requestMedic 			{};
		class medicRequest 			{};
		class deathScreen 			{};
		class medicLoadout 			{};
		class medicSirenLights 		{};
		class medicLights 			{};
		class medicSiren 			{};
		class medInteractionMenu 	{};
		class medicShowLicense 		{};
        class medicLicenseShown 	{};
        class healEq 				{};
        class medLogin 				{};
	};
	
	class Actions
	{
		file = "core\actions";
		
		class surrender 		{}; 
		class buyLicense 		{};
		class healHospital 		{};
		class pushVehicle 		{};
		class repairTruck 		{};
		class serviceChopper 	{};
		class catchFish 		{};
		class catchTurtle 		{};
		class dpFinish 			{};
		class dropFishingNet 	{};
		class getDPMission 		{};
		class postBail 			{};		
		class arrestAction 		{};
		class arrestActionMed 	{};
		class escortAction 		{};
		class impoundAction 	{};
		class impoundActionVer 	{};
		class pulloutAction 	{};
		class putInCar 			{};
		class stopEscorting 	{};
		class restrainAction 	{};
		class searchAction 		{};
		class searchVehAction	{};
		class unrestrain 		{};
		class pickupItem 		{};
		class pickupMoney 		{};
		class ticketAction 		{};
		class packupSpikes 		{};
		class storeVehicle 		{};
		class robAction 		{};
		class captureHideout 	{};
		class gather 			{};
		class RigGather 		{};
        class robShops 			{};
        class robShops2 		{};
        class shopState 		{};		
		class packupmauer 		{};
		class gutAnimal 		{};
	};
	
	class Housing
	{
		file = "core\housing";
		
		class buyHouse 				{};
		class getBuildingPositions 	{};
		class houseMenu 			{};
		class lightHouse 			{};
		class lightHouseAction 		{};
		class sellHouse 			{};
		class initHouses 			{};
		class copBreakDoor 			{};
		class raidHouse 			{};
		class lockupHouse 			{};
		class copHouseOwner 		{};
		class lockHouse 			{};
	};
	
	class Config
	{
		file = "core\config";
		
		class licensePrice 		{};
		class licenseType 		{};
		class eatFood 			{};
		class varHandle 		{};
		class varToStr 			{};		
		class itemWeight 		{};		
		class vehShopLicenses 	{};
		class vehicleAnimate 	{};		
		class vehicleWeightCfg 	{};
		class houseConfig 		{};
		class itemIcon 			{};		
		class adacDefault 		{};	
	};

	class Player_Menu
	{
		file = "core\pmenu";
		
		class wantedList 			{};
		class wantedInfo 			{};
		class wantedMenu 			{};
		class wantedMenue 			{};
		class pardon 				{};
		class giveItem 				{};
		class giveMoney				{};
		class p_openMenu 			{};
		class p_updateMenu 			{};
		class removeItem 			{};
		class useItem 				{};
		class cellphone 			{};
		class keyMenu 				{};
		class keySchenk 			{};
		class keyGive 				{};
		class keyDrop 				{};
		class s_onSliderChange 		{};
		class updateViewDistance 	{};
		class settingsMenu 			{};
		class AAN					{};
		class smartphone 			{};
		class newMsg 				{};
		class showMsg 				{};
		class wantedadd2			{};
		class wanted2 				{};
	};
	
	class Functions
	{
		file = "core\functions";
		
		class calWeightDiff 	{};
		class fetchCfgDetails 	{};
		class handleInv 		{};
		class hudSetup 			{};
		class hudUpdate 		{};
		class tazeSound 		{};
		class animSync 			{};
		class simDisable 		{};
		class keyHandler 		{};
		class dropItems 		{};
		class handleDamage 		{};
		class numberText 		{};
		class handleItem 		{};
		class accType 			{};
		class receiveItem 		{};
		class giveDiff 			{};
		class receiveMoney 		{};
		class playerTags 		{};
		class clearVehicleAmmo 	{};
		class pullOutVeh 		{};
		class nearUnits 		{};
		class actionKeyHandler 	{};
		class playerCount 		{};
		class fetchDeadGear 	{};
		class loadDeadGear 		{};
		class isnumeric 		{};
		class escInterupt 		{};
		class onTakeItem 		{};
		class fetchVehInfo 		{};
		class pushObject 		{};
		class onFired 			{};
		class revealObjects 	{};
		class nearestDoor 		{};
		class inventoryClosed 	{};
		class inventoryOpened 	{};
		class isUIDActive 		{};
		class saveGear 			{};
		class loadGear 			{};
		class stripDownPlayer 	{};	
        class fadeSound 		{};	
		class Opener 			{}; 
		class weedSmoke 		{};		
		class ryn_message 		{};  		
		class clientMessage 	{};			
	};
	
	class Network
	{
		file = "core\functions\network";
		
		class broadcast 	{};
		class MP 			{};
		class MPexec 		{};	
		class corpse 		{};
		class jumpFnc		{};
		class soundDevice 	{};
		class setFuel 		{};		
		class say3D 		{};
	};
	
	class Civilian
	{
		file = "core\civilian";
		
		class jailMe 				{};
		class jail 					{};
		class jailMeMed 			{};
		class jailMed 				{};
		class tazed 				{};
		class knockedOut 			{};
		class knockoutAction 		{};
		class robReceive 			{};
		class robPerson 			{};
		class removeLicenses 		{};
		class demoChargeTimer 		{};
		class civLoadout 			{};
		class civShowLicense	 	{};
		class civLicenseShown	 	{};
		class civInteractionMenu 	{}; 
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		
		class colorVehicle 		{};
		class openInventory 	{};
		class lockVehicle 		{};
		class vehicleOwners 	{};
		class vehStoreItem 		{};
		class vehTakeItem 		{};
		class vehInventory 		{};
		class vInteractionMenu 	{};
		class vehicleWeight 	{};
		class deviceMine 		{};
		class addVehicle2Chain 	{};
	};
	
	class Cop
	{
		file = "core\cop";
		
		class copShowLicense 		{};     
		class copLicenseShown 		{};	
		class copMarkers 			{};
		class copLights 			{};
		class vehInvSearch 			{};
		class copSearch 			{};
		class bountyReceive 		{};
		class searchClient 			{};
		class restrain 				{};
		class ticketGive 			{};
		class ticketPay 			{};
		class ticketPrompt 			{};
		class copSiren 				{};
		class spikeStripEffect 		{};
		class radar 				{};
		class questionDealer 		{};
		class copInteractionMenu	{};
		class sirenLights 			{};
		class licenseCheck 			{};
		class licensesRead 			{};
		class repairDoor			{};
		class doorAnimate 			{};
		class fedCamDisplay 		{};
		class copLoadout 			{};
		class ticketPaid 			{};
		class alkoholdrugtester	 	{}; 
		class wantedGrab 			{};
		class showArrestDialog	 	{}; 
		class arrestDialog_Arrest 	{};		
		class copSiren2 			{};
		class copSiren3 			{};
		class copLogin				{};
	};
	
	class Gangs
	{
		file = "core\gangs";
		
		class initGang 			{};
		class createGang 		{};
		class gangCreated 		{};
		class gangMenu 			{};
		class gangKick 			{};
		class gangLeave 		{};
		class gangNewLeader 	{};
		class gangUpgrade 		{};
		class gangInvitePlayer 	{};
		class gangInvite 		{};
		class gangDisband 		{};
		class gangDisbanded 	{};
		class gangMarkers 		{};
	};
	
	class Shops
	{
		file = "core\shops";
		
		class atmMenu 				{};
		class buyClothes 			{};
		class changeClothes 		{};
		class clothingMenu 			{};
		class clothingFilter 		{};
		class vehicleShopMenu 		{};
		class vehicleShopLBChange 	{};
		class vehicleShopBuy 		{};
		class weaponShopFilter 		{};
		class weaponShopMenu 		{};
		class weaponShopSelection 	{};
		class weaponShopBuySell 	{};
		class weaponShopMags 		{}; 
		class virt_buy 				{};
		class virt_menu 			{};
		class virt_update 			{};
		class virt_sell 			{};
		class chopShopMenu 			{};
		class chopShopSelection 	{};
		class chopShopSell 			{};
		class slotmachine 			{};
		class slotSpin 				{};
		class vehicleRotate 		{};
		class vehShopColor 			{};
		class licen					{};
	};
	
	class Items
	{
		file = "core\items";
		
		class pickaxeUse 		{};
		class lockpick 			{};
		class spikeStrip 		{};
		class jerryRefuel 		{};
		class flashbang 		{};
		class boltcutter 		{};
		class blastingCharge 	{};
		class defuseKit 		{};
		class storageBox 		{};
		class weed 				{};
		class useKokain 		{};
		class useHeroin 		{};
		class gpsTracker 		{};
		class drinkbeer			{};
		class meth 				{};
		class lsd 				{};
		class lsd1 				{};
		class zig 				{};
		class mauer 			{};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		
		class setMapPosition 		{};
		class displayHandler 		{};
		class spawnConfirm 			{};
		class spawnMenu 			{};
		class spawnPointCfg 		{};
		class spawnPointSelected 	{};
		class progressBar 			{};
		class impoundMenu 			{};
		class unimpound 			{};
		class SuppUnimpound 		{};
		class sellGarage 			{};
		class bankDeposit 			{};
		class bankWithdraw 			{};
		class bankTransfer 			{};
		class garageLBChange 		{};
		class safeInventory 		{};
		class safeOpen				{};
		class safeTake 				{};
		class safeFix 				{};
		class vehicleGarage 		{};
		class gangDeposit 			{};
		class calldialog 			{};
	    class sendChannel 			{};
		class gangWithdraw			{};
		
	};
	


	class Adac
	{
        file = "core\adac";
		
        class adacMarkers 			{};
		class serviceLights 		{};
		class adacLights 			{};
		class AdacLoadout 			{};
		class AdacEnter 			{};	
		class adacInteractionMenu	{};
		class ADACIDShown 			{};
		class ADACShowID 			{};
    };
	
	class Special
	{
		file = "core\special";
		
		class openEmpMenu 	{};
		class isEmpOperator {};
		class scanVehicles 	{};
		class warnVehicle 	{};
		class empVehicle 	{};
		class vehicleWarned {};
		class vehicleEmpd 	{};
	};
	
    class Market
    {
        file = "core\market";
		
		class MarketSend 			{};
        class openMarketView 		{};
        class refreshMarketView 	{};
        class marketShortView 		{};
        class marketGetBuyPrice 	{};
        class marketGetSellPrice 	{};
        class marketGetRow 			{};
        class marketGetPriceRow 	{};
        class marketSetPriceRow 	{};
        class marketBuy 			{};
        class marketSell 			{};
    };
	
	class Liga
    {
        file = "Liga";
		
		class LIGAInit 	{};
		class welcome 	{};		
    };
	
	class ligaactions
    {
        file = "Liga\actions";
		
		class processAction {};	
		class NotMarker 	{};		
	};
	
	class ligaWH
    {
        file = "Liga\WH";		
		
		class ligaWHcalc 		{};
		class ligaWHdisp 		{};
		class ligaWHdiShow 		{};
		class ligaWeapWH 		{};
		class ligaWHbuy 		{};
		class ligaWHcalcPreis 	{};

    };
	
	class PVC
    {
        file = "Liga\PVC";
		
		class PVCgetID 			{};
		class PVCsetIDtoVar 	{};
		class getPVC 			{};
		class PVCMarketPrice 	{};
		class PVCscTrig 		{};

    };
	class LigaInit
    {
        file = "Liga\Init";
		
		class MarketInit 	{};
		class clanKey 		{};
		class AdminStats 	{};
		class DevSpawn 		{};

    };
	
	class LigaFnc
    {
        file = "Liga\Func";
		
		class DestInv 			{};
		class ligaDes 			{};
		class ligaZeltInv 		{};
		class ligaFass 			{};
		class ligaFassInv 		{};		
		class LeimNoti 			{};
		class BauNoti 			{};
		class schnee 			{};
		class schneeC 			{};
		class DestSmoke 		{};
		class DestSmoke1 		{};
		class ligaDesAdAc 		{};
		class statMaisch 		{};
		class ligaNews 			{};
		class setHit			{};
		class ligaSetClothText 	{};
		class tuvcheck 			{};

    };
	
	class LigaRadio
    {
        file = "Liga\Radio";
		
		class BosMenu {};
    };
	
/*
	class Paintball
	{
		file = "core\paintball";
		
		class pb_response {};
	};
*/	
	
	class anstrich
	{
		file = "core\repaint";
		
		class RepaintMenu 		{};
		class Repaintcolor 		{};
		class RepaintVehicle 	{};		
	};	
	
	class Scripts
	{
		file = "scripts";

		class hydroNotification {};
		class schlossNot 		{};
		class diesel 			{};
		class fuel 				{};
		class fuelCheck 		{};
		class fuelConfig 		{};
		class fuelPrices 		{};
		class initFuelAction 	{};
		class super 			{};
		class Kerosin 			{};
		class vehicleCheck		{};
		class airdrop 			{};		
		class switchMove 		{};
		class radartrap 		{};
	};	
	
	class AHAus
	{
		file = "scripts\Auktionshaus";
		
		class CAH_Buy 			{};
		class CAH_getPlayerObj 	{};		
		class CAH_loadInventory {};		
		class CAH_loadOffers 	{};			
		class CAH_reciever 		{};		
		class CAH_Sell 			{};		
	};		
};


class LigaClient
{
	tag = "LIGACL";
	
	class Func
	{
		file = "Liga\Func";
		
		class zomAir			{};
		class IgiVehInit		{};
		class TurmMenu			{};
		class play3DSound		{};
		class Bohrmenu			{};
		class removeHeliAc		{};
		class vehGarage			{};
		class antiTattoo		{};
		class ImoBuyFrakCheck	{};		//LIGACL_fnc_ImoBuyFrakCheck
	};
	
	class Act
	{
		file = "Liga\actions";
		
		class turmPreProcess	{};
		class LKWbeladen		{};
			
	};	
	
	class Taxen
	{
		file = "Liga\Taxen";
		

		class HeliTaxen			{};
	
		
	};			

	class Tankstellen
	{
		file = "Liga\Tankstellen";
		
		class InitTank			{};
		class buyTank			{};
		class sellTank			{};
		class preismenu			{};
		class preismenuset		{};
		
	};		

	class Laden
	{
		file = "Liga\Laden";
		
		class LigaLadenCfg		{};		//LIGACL_fnc_LigaLadenCfg
		class buyLigaLaden		{};		//LIGACL_fnc_buyLigaLaden
		class getLadenPositions	{};		//LIGACL_fnc_getLadenPositions
		class initLaden			{};		//LIGACL_fnc_initLaden
		class LigaAddKass		{};		//LIGACL_fnc_LigaAddKass
		class LigaLadenMenu		{};		//LIGACL_fnc_LigaLadenMenu
		class getListData		{};		//LIGACL_fnc_getListData
		class addLadenAction	{};		//LIGACL_fnc_addLadenAction
		class sellLaden			{};		//LIGACL_fnc_sellLaden
		class LadenSellMenu		{};		//LIGACL_fnc_LadenSellMenu
		class LadenVirtBuy		{};		//LIGACL_fnc_LadenVirtBuy
		class buyCheck			{};		//LIGACL_fnc_buyCheck
		
	};		

	class Lotto
	{
		file = "Liga\Lotto";
		

		class lottoDialog				{};		//LIGACL_fnc_lottoDialog
		class lottoUbDialog				{};		//LIGACL_fnc_lottoUbDialog
		class selLottoSch				{};		//LIGACL_fnc_selLottoSch
		class LottoMkCross				{};		//LIGACL_fnc_LottoMkCross
		class LottoAddLosNR				{};		//LIGACL_fnc_LottoAddLosNR
		class LottoGetWin				{};		//LIGACL_fnc_LottoGetWin
		class LottoQuesttWin			{};		//LIGACL_fnc_LottoQuesttWin
	
	};	

	class FireWork_Client
	{
		file = "scripts\GRAD_fireworks";
		

		class Fireworks				{};		//LIGACL_fnc_Fireworks
		class addFWaction			{};		//LIGACL_fnc_addFWaction
	
	};	
	
	class Dialog_FNCs
	{
		file = "Liga\DialogFnc";
		

		class LigaCraftMenu			{};		//LIGACL_fnc_LigaCraftMenu
		class LigaCraftMenuDet		{};		//LIGACL_fnc_LigaCraftMenuDet
	
	};		
	
	class GebWagHandel
	{
		file = "Liga\GebWagHan";		

		class GebHanShowList		{};		//LIGACL_fnc_GebHanShowList	
		class GebHanSellVeh			{};		//LIGACL_fnc_GebHanSellVeh	
	};				
};