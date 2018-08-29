_PlayerUID = _this select 0;
_player = _this select 1;
_inidbi = ["new", _PlayerUID] call OO_INIDBI;


_Pos = ["read", ["Data", "PlayerPos"]] call _inidbi;
_player setPos _Pos;
_Loadout = ["read", ["Data", "PlayerLoadout"]] call _inidbi;
_player setUnitLoadout _Loadout;
//PlayerPos
//PlayerLoadout
