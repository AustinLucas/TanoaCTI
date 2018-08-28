_dataToSave = "test";

null = ["ServerDB", _dataToSave] execVM "saveData.sqf";
{
  null = [getPlayerUID _x, _dataToSave] execVM "saveData.sqf";
  player sideChat "Player " + Name _x + " has left. Their data has been saved.";
}
foreach allPlayers;
