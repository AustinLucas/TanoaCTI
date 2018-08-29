execVM "RadioSystem\RadioCoverageList.sqf";
_PlayerUID = _this select 0;
_inidbi = ["new", _PlayerUID] call OO_INIDBI;

_counter = 0;
systemChat "Initializing server";
sleep 1;
systemChat "Read Data, setting up veriables";
{
    _ReadData = ["read", ["RadioTowers", str(_x select 2)]] call _inidbi;
    _x set [1, _ReadData];
} forEach RadioCoverage;

execVM "RadioSystem\changeRadio.sqf";
