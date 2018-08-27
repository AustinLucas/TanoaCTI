_Serverinidbi1 = ["new", "ServerDB"] call OO_INIDBI;
_serverDBExists = "exists" call _Serverinidbi1;
if (_serverDBExists) then
{
  hint "Server DB Exists";
}
else
{
  Hint "Server DB Does not Exists";
  null = ["", "ServerDB", ""] execVM "CreateDatabase.sqf";
};


"checkForDatebase" addPublicVariableEventHandler
{
  private ["_data"];
  _data = (_this select 1);
  _ClientID =  (_data select 0);
  _PlayerUID = (_data select 1);
  _PlayerName = (_data select 2);

  _inidbi = ["new", _PlayerUID] call OO_INIDBI;
  _DBExists = "exists" call _inidbi;

  if (_DBExists) then
  {
    hint "exists";
    null = [_PlayerUID] execVM "getData.sqf";
  }
  else
  {
    hint "Does not exist";
    null = [_ClientID, _PlayerUID, _PlayerName] execVM "CreateDatabase.sqf";
  };
};

"saveData" addPublicVariableEventHandler
{
  private ["_data"];
  _data = (_this select 1);
  _gear = (_data select 0);
  _PlayerUID = (_data select 1);
  _playerPosition = (_data select 2);
  _boxCargo =[getitemCargo _gearbox1, getitemCargo _gearbox2, getitemCargo _gearbox3];
  _arrayLength = count _boxCargo;

  While[{_i = 0}, {_i <= _arrayLength}, {1}] do{
    ["write", ["AmmoBox Cargo", "Box"+ toString _i, _boxCargo select _i]] call _Serverinidbi;
  };
  _inidbi = ["new", _PlayerUID] call OO_INIDBI;
  ["write", ["Player Gear", "Gear", _gear], ["Player Position", "Position", _playerPosition]] call _inidbi;
};