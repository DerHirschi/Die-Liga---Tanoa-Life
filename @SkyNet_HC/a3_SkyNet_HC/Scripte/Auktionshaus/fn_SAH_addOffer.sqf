#include "\a3_SkyNet_HC\SkyNet_Macros.hpp"
diag_log format["addSAH_offers:vorher %1",SAH_offers];
SAH_offers pushBack _this;
diag_log format["addSAH_offers:nachher %1",SAH_offers];

//profileNamespace setVariable ["LIGA_BAY",SAH_offers];

_query = format["eBayWrite:%1",SAH_offers];
diag_log format["Query: %1",_query];
        
DBCALL(0);