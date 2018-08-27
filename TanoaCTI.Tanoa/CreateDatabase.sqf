_ClientID =  (_this select 0);
_PlayerUID = (_this select 1);
_PlayerName = (_this select 2);

_inidbi = ["new", _PlayerUID] call OO_INIDBI;

["write", ["Player info", "Name", _PlayerName]] call _inidbi;
["write", ["Player info", "UID", _PlayerUID]] call _inidbi;

if (_ClientID == "Server") then
{

}
else
{

};
