private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;

if (count pb_spieler==0&&pb_spielstatus==0) then {
    []spawn TON_fnc_game;
    pb_spielstatus = 1;
};

if (pb_spielstatus==1) then {
    _uidarr = [_uid];
    _geld = [_this,1,0,[0]] call BIS_fnc_param;
    if (_geld>=5000) then {
        pb_spieler = pb_spieler + _uidarr;
        [[5,"Du wurdest erfolgreich für das kommende Spiel angemeldet!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
    } else {
        [[1,"Du hast keine 5000 Dollar bei dir!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
    };
};

if ((pb_spielstatus == 2 && count pb_spieler >= 2)||(count pb_spieler == pb_maxspieler)) then {
    [[1,"Leider hat das Spiel bereits begonnen oder die Lobby ist bereits voll, versuche es später noch einmal!"],"life_fnc_pb_response",_uid,false] spawn life_fnc_MP;
};