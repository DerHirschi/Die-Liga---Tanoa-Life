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
║	File: fn_SuppClLit.sqf
║	Author: Hirschi Liga-Life 
║	
║	Description:
║	Clan Lizensen 6 Bit 
╠═══════════════════════════════════════════════════
║_______________________________________________________________
║	_a		 |	_b		  |	_c			 |	_d		  |	_e	   |_f												|
║________________________________________________________________
║	lci_liga	 |	lci_stlkr |	lci_admin |	lci_adm |	lci_sil |	lci_ano										|
║________________________________________________________________________
║	0			 |	0			  |	1				 |	0			  |	0		  |0					=		R.O.G.				-	cl_rog
║	0			 |	0			  |	0				 |	0			  |	1		  |	0					=		SILVA				-	cl_sil
║	0			 |	0			  |	0				 |	0			  |	0		  |	1					=		Anonymus		-	cl_ano
║	0			 |	1			  |	0				 |	0			  |	0		  |	0					=		S.T.L.K.R.		-	cl_stlkr
║	1			 |	0			  |	0				 |	0			  |	0		  |	0					=		LIGA				-	cl_liga
║	0			 |	0			  |	0				 |	1			  |	0		  |	0					=		Admin				-	cl_admi
║---------------------------------------------------------------------------------------------------------------------------
║	0			 |	0			  |	0				 |	0			  |	1		  |	1					=		A.o.D.				-	cl_aod
║	0			 |	0			  |	0				 |	1			  |	1		  |	1					=		R.N.S.X			-	cl_rnsx
║	0			 |	0			  |	1				 |	1			  |	1		  |	1					=		SKULL			-	cl_skull
╚═══════════════════════════════════════════════════	
*/
#define SL(VAR) missionNamespace setVariable[VAR,true]
#define SLDEL(VAR) missionNamespace setVariable[VAR,false]

{	SLDEL(_x);	}	forEach 	["lci_admin","lci_sil","lci_ano","lci_stlkr","lci_liga","lci_adm"];



switch (_this select 0) do {
	case 0:	{hint "Clan Lizenz wurde entzogen...";};
	case 1: { SL("lci_admin");	};   													//R.O.G
	case 2: { SL("lci_sil");	};														//SILVA
	case 3: { SL("lci_ano");	};														//Anonymus
	case 4: { SL("lci_stlkr");	};														//S.T.L.K.R.
	case 5: { SL("lci_liga");	};														//LIGA
	case 6: { SL("lci_adm");	};														//Admin

	case 7: { SL("lci_sil");	SL("lci_ano");	};										//A.o.D.

	case 8: { SL("lci_adm");	SL("lci_sil");	SL("lci_ano");	};						//R.N.S.X

	case 9: { SL("lci_admin");	SL("lci_adm");	SL("lci_sil");	SL("lci_ano");	};		//SKULL
};

[] call SOCK_fnc_updateRequest;
if(_mode != 0)then {hint "Deine Clan Lizenz wurde dir erfolgreich verliehen !!";};