/*hint "starting!";
_ClientID = clientOwner;
_PlayerUID = getPlayerUID player;
_PlayerName = name player;

checkForDatebase = [_ClientID, _PlayerUID, _PlayerName];
publicVariableServer "checkForDatebase";

player addAction ["save data",
{
  _gear = getUnitLoadout player;
  _playerPosition = getPos player;
  _PlayerUID = getPlayerUID player;
  saveData = [_gear, _PlayerUID, _playerPosition];
  publicVariableServer "saveData";
}];
*/
execVM "RadioSystem\RadioCoverageList.sqf";
_ClientID = clientOwner;
_PlayerUID = getPlayerUID player;
_PlayerName = Name player;

checkForDB = [_ClientID, _PlayerUID, _PlayerName, player];
publicVariableServer "checkForDB";


player addAction["Radio NATO", {
  _PlayerPos = Position Player;
  _RadioStations = true;
  _inRange = false;
  {
      if (_PlayerPos inArea (_x select 0) && (_x select 1) && _RadioStations) then
      {
        systemChat (_x select 0);
        _inRange = true;
      };
  } forEach RadioCoverage;
  if (_inRange && _RadioStations) then {
      Player sideChat "NATO has been reached!";
  }else
  {
    if (!_inRange && _RadioStations) then
    {
      Player sideChat "NATO is Unreachable, you have no long distance radio coverage!";
    };
    if (!_RadioStations) then
    {
        Player sideChat "NATO is Unreachable, you have no long distance radio transmission system!"
    };
  };
}];
