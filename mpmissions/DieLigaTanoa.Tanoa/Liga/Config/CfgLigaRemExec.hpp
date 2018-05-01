#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;			
		
    /* Client only functions  */
		F(SPY_fnc_notifyAdmins,CLIENT)
		F(SPY_fnc_menuCheck,CLIENT)
		F(SPY_fnc_variableCheck,CLIENT)
	
		F(fn_cllink,CLIENT)		
		F(fn_adlink,CLIENT)		
        F(life_fnc_jail,CLIENT)
        F(life_fnc_jailMeMed,CLIENT)
        F(life_fnc_jailMed,CLIENT)
		F(life_fnc_jailMe,CLIENT)		
		
		F(life_fnc_CAH_reciever,CLIENT)		
		
        F(life_fnc_moveIn,CLIENT)
        F(life_fnc_restrain,CLIENT)
        F(life_fnc_robPerson,CLIENT)
		F(life_fnc_robReceive,CLIENT)
		F(life_fnc_searchClient,CLIENT)
		
        F(TON_fnc_player_query,CLIENT)		
        F(life_fnc_knockedOut,CLIENT)
        F(life_fnc_switchMove,CLIENT)		
		F(life_fnc_animSync,CLIENT) 
		F(life_fnc_jumpFnc,CLIENT)
		F(life_fnc_weedSmoke,CLIENT)
		F(life_fnc_ligaDesAdAc,CLIENT)

		F(life_fnc_schneeC,CLIENT)        
		F(life_fnc_ligaNews,CLIENT)        
		F(life_fnc_clientMessage,CLIENT) 
        F(life_fnc_PVCsetIDtoVar,CLIENT)
        F(life_fnc_PVCscTrig,CLIENT)		
        		
        F(life_fnc_vehicleEmpd,CLIENT)
        F(life_fnc_vehicleWarned,CLIENT)
        F(life_fnc_copSiren,CLIENT)
        F(life_fnc_copSiren2,CLIENT)
        F(life_fnc_copsiren3,CLIENT)
        F(life_fnc_medicSiren,CLIENT)
		F(life_fnc_tazeSound,CLIENT)
		F(life_fnc_soundDevice,CLIENT)
		F(fncNextSoundCl,CLIENT)        
		F(life_fnc_say3D,CLIENT)

        F(life_fnc_giveDiff,CLIENT)
        F(life_fnc_gangInvite,CLIENT)
    
		F(TON_fnc_clientGangKick,CLIENT)		
        F(TON_fnc_clientGangLeader,CLIENT)		
        F(TON_fnc_clientGangLeft,CLIENT)
        F(life_fnc_lightHouse,CLIENT)
		
        F(life_fnc_civLicenseShown,CLIENT)
        F(life_fnc_medicLicenseShown,CLIENT)
        F(life_fnc_copLicenseShown,CLIENT)
        F(life_fnc_ADACIDShown,CLIENT)
        F(life_fnc_medicRequest,CLIENT)
        F(life_fnc_copMedicRequest,CLIENT)		
        F(life_fnc_revived,CLIENT)
        F(life_fnc_receiveItem,CLIENT)
	
		F(TON_fnc_clientGetKey,CLIENT) 
        F(life_fnc_receiveMoney,CLIENT)	     
		
        F(TON_fnc_clientWireTransfer,CLIENT)
        F(TON_fnc_clientKeyGesch,CLIENT)
		
        F(life_fnc_pickupMoney,CLIENT)
        F(life_fnc_pickupItem,CLIENT)
	
        F(life_fnc_gangCreated,CLIENT)
        F(liga_fn_getChatStr,CLIENT)
        F(liga_fnc_MessApp,CLIENT)		
        F(life_fnc_gangDisbanded,CLIENT)		
		
        F(SOCK_fnc_dataQuery,CLIENT)    
		F(SOCK_fnc_insertPlayerInfo,CLIENT)		
        F(SOCK_fnc_requestReceived,CLIENT)
		
        F(life_fnc_adminid,CLIENT)
   
		F(life_fnc_impoundMenu,CLIENT)    
		F(life_fnc_garageRefund,CLIENT)		
        F(life_fnc_addVehicle2Chain,CLIENT)	
		F(life_fnc_colorVehicle,CLIENT)			
        F(life_fnc_vehicleAnimate,CLIENT)
   	
		F(life_fnc_bountyReceive,CLIENT)
        F(life_fnc_wantedList,CLIENT)		
        F(life_fnc_wantedInfo,CLIENT)
        F(life_fnc_removeLicenses,CLIENT)
        F(life_fnc_chopRecv,CLIENT)
		
		F(life_fnc_demoChargeTimer,CLIENT) 
        F(life_fnc_spikeStripEffect,CLIENT)
		F(life_fnc_flashbang,CLIENT) 		
		F(life_fnc_robShops2,CLIENT) 		
		F(life_fnc_shopState,CLIENT) 		
		
        F(life_fnc_admininfo,CLIENT)
//F(TON_fnc_clientMessage,CLIENT)
		F(life_fnc_licenseCheck,CLIENT)
 		
        F(life_fnc_licensesRead,CLIENT)   
		F(life_fnc_copSearch,CLIENT)		
        F(life_fnc_copLights,CLIENT)
        F(life_fnc_medicLights,CLIENT)
        F(life_fnc_adacLights,CLIENT)
		
        F(life_fnc_ticketPrompt,CLIENT)
        F(life_fnc_ticketPaid,CLIENT)
		
        F(LIGACL_fnc_removeHeliAc,CLIENT)
        F(LIGACL_fnc_HeliTaxen,CLIENT)
        F(LIGACL_fnc_addLadenAction,CLIENT)
		
        F(LIGACL_fnc_LottoAddLosNR,CLIENT)
        F(LIGACL_fnc_LottoGetWin,CLIENT)
        F(LIGACL_fnc_lottoUbDialog,CLIENT)
		
        F(LIGACL_fnc_Fireworks,CLIENT)
        F(LIGACL_fnc_addFWaction,CLIENT)
		
        F(LIGACL_fnc_GebHanShowList,CLIENT)
		
   //     F(life_fnc_freezePlayer,CLIENT)

    /* Server only functions */		
			
		F(LIGA_fnc_turmUP,SERVER)
		F(LIGA_fnc_turmDOWN,SERVER)
		F(LIGA_fnc_updateTurm,SERVER)
		F(LIGA_fnc_TurmProcAkt,SERVER)
		
		F(LIGA_fnc_SAH_Transaction,SERVER)
		F(LIGA_fnc_SAH_reciever,SERVER)
		F(LIGA_fnc_SAH_addOffer,SERVER)
		
		F(LIGA_fnc_generateAirdropZom,SERVER)
		F(fncPopRem,SERVER)
		F(LIGA_fnc_generateAirdrop,SERVER)
		F(SKY_fnc_DBlogSys,SERVER)
		F(SKY_fnc_clrem,SERVER)		
	
		F(TON_fnc_setObjVar,SERVER)
		F(SKY_fnc_setObjVar,SERVER)
        F(bis_fnc_execvm,SERVER)
		
        F(TON_fnc_addTank,SERVER)
        F(TON_fnc_sellTank,SERVER)
        F(TON_fnc_updateTankTrunk,SERVER)
        F(TON_fnc_Schlosswech,SERVER)
        F(TON_fnc_TankABM,SERVER)
        F(TON_fnc_ABMcount,SERVER)
		
        F(TON_fnc_addLaden,SERVER)
        F(TON_fnc_updateKass,SERVER)
        F(TON_fnc_updateZusa,SERVER)
        F(TON_fnc_KassAction,SERVER)
        F(TON_fnc_sellLaden,SERVER)
		
        F(TON_fnc_IntroControll,SERVER)
		
        F(TON_fnc_preCheckHouse,SERVER)	
		
        F(TON_fnc_GebHanGetQ,SERVER)		
        F(TON_fnc_GebHanGetDet,SERVER)		
        F(TON_fnc_GebHanBuy,SERVER)	
		
        F(TON_fnc_ligaDestObj,SERVER)		
		
        F(TON_fnc_msgRequest,SERVER)
        F(TON_fnc_cleanupMessages,SERVER)
        F(TON_fnc_keydbchange,SERVER)
    
		F(life_fnc_wantedBounty,SERVER)
		F(TON_fnc_getID,SERVER)
		F(life_fnc_jailSys,SERVER)
		F(life_fnc_jailSysMed,SERVER)
        F(life_fnc_wantedRemove,SERVER)
    
		F(life_fnc_wantedCrimes,SERVER)		
		F(life_fnc_wantedAdd,SERVER)		
        F(TON_fnc_insertGang,SERVER)
		F(TON_fnc_removeGang,SERVER)	
		F(TON_fnc_radio,SERVER)		
        F(TON_fnc_updateGang,SERVER)		
        F(TON_fnc_updateHouseTrunk,SERVER)		
        F(TON_fnc_sellHouse,SERVER)		
        F(TON_fnc_managesc,SERVER)    
		F(TON_fnc_spikeStrip,SERVER)
		
		F(TON_fnc_robShops,SERVER)
		F(TON_fnc_shopState,SERVER)
		
		F(TON_fnc_LottoAddSchein,SERVER)
		F(TON_fnc_LottoSuchGewinn,SERVER)
		F(TON_fnc_LottoPlInfo,SERVER)
		
    //    F(life_fnc_wantedPardon,SERVER)
        F(life_fnc_wantedFetch,SERVER)
		
        F(DB_fnc_queryRequest,SERVER)		
        F(DB_fnc_insertRequest,SERVER)    
		F(DB_fnc_updatePartial,SERVER)    
		F(DB_fnc_updateRequest,SERVER)
		//F(DB_fnc_marketInsert,SERVER)
		F(TON_fnc_getIDPVC,SERVER)
		
		F(TON_fnc_sendPVC,SERVER)		
		F(TON_fnc_handleMessages,SERVER)	
        F(TON_fnc_chopShopSell,SERVER)	
        //F(TON_fnc_paintball,SERVER)	
        F(TON_fnc_schnee,SERVER)	
        F(TON_fnc_BaustellNoti,SERVER)			
        	
        F(TON_fnc_simDisable,SERVER)		
        F(TON_fnc_keyManagement,SERVER)		
        F(TON_fnc_vehicleDead,SERVER)		
        F(TON_fnc_vehicleDelete,SERVER)		
        F(TON_fnc_spawnVehicle,SERVER)		
        F(TON_fnc_getVehicles,SERVER)		
        F(TON_fnc_vehicleStore,SERVER)
        F(TON_fnc_vehicleStoreVer,SERVER)
        F(TON_fnc_SuppVehBack,SERVER)
        F(TON_fnc_vehicleRepaint,SERVER)
    
	
        F(TON_fnc_pickupAction,SERVER)    
		F(TON_fnc_cleanupRequest,SERVER)        
		F(TON_fnc_updateHouseContainers,SERVER)    
		F(SPY_fnc_cookieJar,SERVER)		
        F(TON_fnc_vehicleCreate,SERVER)
        F(TON_fnc_addHouse,SERVER)	

        F(TON_fnc_ligaWHdump,SERVER)		
        F(TON_fnc_LeimWE,SERVER)		
        F(TON_fnc_ligaDest,SERVER)		
        F(TON_fnc_ComBaustellInsert,SERVER)		
        F(TON_fnc_generateAirdrop,SERVER)		
        F(bis_fnc_setidentity,SERVER)	
		
        F(TON_fnc_FireWork,SERVER)		
        F(TON_fnc_LadenFeuerwerk,SERVER)		
		
        /* Functions for everyone */
				
	    F(life_fnc_corpse,ANYONE)        	
        F(life_fnc_lockVehicle,ANYONE)        			
       		
        F(LIGACL_fnc_HeliTaxen1,ANYONE)
       		
        F(life_fnc_setFuel,ANYONE)
        F(bis_fnc_objectvar,ANYONE)     
        F(bis_fnc_sharedobjectives,ANYONE)     
        F(bis_fnc_effectkilledairdestruction,ANYONE)     
        F(bis_fnc_effectKilledSecondaries,ANYONE)     
		F(life_fnc_pulloutVeh,ANYONE)	
        F(life_fnc_pushFunction,ANYONE)
		F(life_fnc_broadcast,ANYONE)
		F(life_fnc_simDisable,ANYONE)
		
		F(life_fnc_setHit,ANYONE)
	
    };

    class Commands {
        mode = 1;
        jip = 0;

        F(setFuel,ANYONE)
        //F(setHitPointDamage,ANYONE)
        F(addWeapon,ANYONE)
        F(addMagazine,ANYONE)
        F(addPrimaryWeaponItem,ANYONE)
        F(addHandgunItem,ANYONE)

    };
};

class MPExec {
	
	Server[] = {
				
				"ton_fnc_radio",
				"ton_fnc_notwarte",
				"ton_fnc_notsteu",
				"ton_fnc_cleanupmessages",
				"ton_fnc_msgrequest",
				"ton_fnc_getvehiclessupp",
				"ton_fnc_getvehicles",
				"ton_fnc_processdest",
				"ton_fnc_vehiclestore",
				"ton_fnc_processmaisch",
				"ton_fnc_diag"		
	};
	Client[] = {
				"life_fnc_revived",
				"life_fnc_lockvehicle",
				"life_fnc_say3d",
				"life_fnc_ryn_message",
				"life_fnc_suppclliz",
				"life_fnc_alkoholdrugtester",
				"life_fnc_liganews",
				"life_fnc_broadcast",
				"life_fnc_ligadesadac",
				"life_fnc_destsmoke1",
				"life_fnc_destsmoke",
				"life_fnc_clientmessage",
			//	"life_fnc_pb_response",
				"life_fnc_hclink",
				"bis_fnc_execvm"
	};		
};