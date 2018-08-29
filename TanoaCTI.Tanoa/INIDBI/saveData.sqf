
  _UID = _this select 0;
  _data = _this select 1;
  _inidbi = ["new", _UID] call OO_INIDBI;

  if (_UID == "ServerDB") then
  {
    {
        ["write", ["RadioTowers", str(_x select 2), _x select 1]] call _inidbi;
    }foreach RadioCoverage;
  }
  else
  {
    ["write",["Data", "PlayerPos", _data select 0]] call _inidbi;
    ["write",["Data", "PlayerLoadout", _data select 1]] call _inidbi;
    systemChat "Player Data saved";
  };
