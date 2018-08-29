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

_ClientID = clientOwner;
_PlayerUID = getPlayerUID player;
_PlayerName = Name player;

checkForDB = [_ClientID, _PlayerUID, _PlayerName, player];
publicVariableServer "checkForDB";
