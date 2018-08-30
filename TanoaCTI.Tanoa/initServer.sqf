
execVM "RadioSystem\RadioCoverageList.sqf";
checkForServerDB = [clientOwner, "ServerDB", serverName];
publicVariableServer "checkForServerDB";

"checkForServerDB" addPublicVariableEventHandler
{
  _data = _this select 1; //Grabs array broadcast across network
  _ID = _data select 0;   //
  _UID = _data select 1;  // Splits array into its parts
  _Name = _data select 2; //
  _inidbi = ["new", _UID] call OO_INIDBI;
  _DBExists = "exists" call _inidbi;

  if (_DBExists) then
  {
    //hint _Name + " Database exists... Reading";
    player sideChat _Name + " Database exists... Reading";
    null = ["ServerDB"] execVM "INIDBI\getServerData.sqf";
  }
  else
  {
    player sideChat _Name + " Database does NOT exist... Creating!";
    null = [_UID, _Name] execVM "INIDBI\CreateDatabase.sqf";
  };
};
"checkForDB" addPublicVariableEventHandler //function Check for Database
{
  _data = _this select 1; //Grabs array broadcast across network
  _ID = _data select 0;   //
  _UID = _data select 1;  // Splits array into its parts
  _Name = _data select 2; //
  _player = _data select 3;
  _inidbi = ["new", _UID] call OO_INIDBI;
  _DBExists = "exists" call _inidbi;

  if (_DBExists) then
  {
    //hint _Name + " Database exists... Reading";
    player sideChat _Name + " Database exists... Reading";
    null = [_UID, _player] execVM "INIDBI\getData.sqf";
  }
  else
  {
    player sideChat _Name + " Database does NOT exist... Creating!";
    null = [_UID, _Name] execVM "INIDBI\CreateDatabase.sqf";
  };
};

BaseMap addAction["Save Data",
{
  _players = allPlayers - entities "HeadlessClient_f";
  _playercount = count _players;

      null = ["ServerDB"] execVM "INIDBI\saveData.sqf";

      {
        player sideChat "Player " + Name _x + " has left. Their data has been saved.";
        _dataToSave = [getPosATL _x, getUnitLoadout _x];
        null = [getPlayerUID _x, _dataToSave] execVM "INIDBI\saveData.sqf";
      }
      foreach allPlayers;

}];

BaseMap addAction["Capture RadioStation", {
  _Active = true;
  (RadioCoverage select 0) set [1, true];
}];

BaseMap addAction["Disable RadioCoverage in Map",
{
  Disable = ["1"];
  publicVariableServer "Disable";
}];
BaseMap addAction["Enable RadioCoverage in Map",
{
  Enable = ["1"];
  publicVariableServer "Enable";
}];

RadioTower206Gen1 ["Turn on generator",
{
  
]};

RadioTower206Gen2 ["Turn on generator",
{

}];
