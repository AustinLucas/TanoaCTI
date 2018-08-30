
execVM "RadioSystem\RadioCoverageList.sqf";
execVM "RadioSystem\GeneratorVars.sqf";
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
sleep 1;
{
  _Gen = (missionNamespace getVariable ((_x select 2) + "Gen"));
  _Gen addAction["Turn on generator",
   {
    _data = ((_this select 3) select 0);
    _counter = 0;
    {
        if ((_data + "GenOn") == (_x select 0)) exitWith
        {
          _x set [1, true];
        };
        _counter = _counter + 1;
        systemChat "Gen Counter: " + (str _counter);
    } forEach GeneratorsVars;
    if (((ComputerVars select _counter) select 1)  && ((GeneratorsVars select _counter) select 1)) then
    {
      null = [_data] execVM "RadioSystem\CaptureRadio.sqf";
    }
    else
    {
      systemChat "You now need to configure the computer";
    }; //Magic that is super confusing... I don't know how the fuck this works...
  }, [(_x select 2)]];

  _Comp = (missionNamespace getVariable ((_x select 2) + "Computer"));
  _Comp addAction["Configure computer",
  {
    _data = ((_this select 3) select 0);
    _counter = 0;
    {
      if ((_data + "ComputerOn") == (_x select 0)) exitWith
      {

      };
      _counter = _counter + 1;
      systemChat str _counter;
    } forEach ComputerVars;
    if (!((GeneratorsVars select _counter) select 1)) then
    {
      systemChat "The generator needs to be turned on first!";
      _counter = 0;
    }
    else
    {
      _counter = 0;
      {
        if ((_data + "ComputerOn") == (_x select 0)) exitWith
        {
          _x set [1, true];
        };
        _counter = _counter + 1;
        systemChat "Computer Counter: " + (str _counter);
      } forEach ComputerVars;

      if (((ComputerVars select _counter) select 1) && (((GeneratorsVars select _counter) select 1))) then
      {
        systemChat "This radio tower is now active";
        null = [_data ] execVM "RadioSystem\CaptureRadio.sqf";
      };
    };
  }, [(_x select 2)]];
} forEach RadioCoverage; // Goes through and add actions to every generator and computer
