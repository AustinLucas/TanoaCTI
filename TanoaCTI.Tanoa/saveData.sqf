
  _UID = _this select 0;
  _data = _this select 1;
  _inidbi = ["new", _UID] call OO_INIDBI;

  if (_UID == "ServerDB") then
  {
  /*  _z = 0;
    {
        ["write",["Data", "Box" + str _z + "Contents", getItemCargo _x]] call _inidbi;
        ["write",["Data", "Box" + str _z + "Position", getPosATL _x]] call _inidbi;
        _z = _z + 1;
        systemChat ("Box " + str _z + "Has been saved to Server Data");
    } forEach _data;
*/
  }
  else
  {
    ["write",["Data", "PlayerPos", _data select 0]] call _inidbi;
    ["write",["Data", "PlayerLoadout", _data select 1]] call _inidbi;
    systemChat "Player Data saved";
  };
