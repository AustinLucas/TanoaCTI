_PlayerUID = _this select 0;
_PlayerName = _this select 1;

player sideChat _PlayerUID;
player sideChat _PlayerName;


if (_PlayerUID == "ServerDB") then
{
  _inidbi = ["new", _PlayerUID] call OO_INIDBI;
  ["write", ["Server info", "Server Name", _PlayerName]] call _inidbi;
  ["write", ["Server info", "UID", _PlayerUID]] call _inidbi;
  _inidbi = null;
}
else
{
  _inidbi = ["new", _PlayerUID] call OO_INIDBI;
  ["write", ["Player info", "Name", _PlayerName]] call _inidbi;
  ["write", ["Player info", "UID", _PlayerUID]] call _inidbi;
  _inidbi = null;
};
