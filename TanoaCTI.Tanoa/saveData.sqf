
  _UID = _this select 0;
  _data = _this select 1;
  _inidbi = ["new", _UID] call OO_INIDBI;

  if (_UID = "ServerDB") then
  {
    ["write",["Data", "Test Data", _data]] call _inidbi;
    systemChat "Server Data saved";
  }
  else
  {
    ["write",["Data", "Test Data", _data]] call _inidbi;
    systemChat "Player Data saved";
  };
