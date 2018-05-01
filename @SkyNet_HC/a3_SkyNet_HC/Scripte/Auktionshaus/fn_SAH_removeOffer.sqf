#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
diag_log format["removeSAH_offers:vorher %1",SAH_offers];
diag_log format["_this: %1",_this];

{	
	if (EQUAL(_x,_this)) exitWith {SAH_offers deleteAt _forEachIndex;};
} forEach SAH_offers;

diag_log format["removeSAH_offers:nachher %1",SAH_offers];

_query = format["eBayWrite:%1",SAH_offers];
diag_log format["Query: %1",_query];
        
DBCALL(0);


//profileNamespace setVariable ["LIGA_BAY",SAH_offers];