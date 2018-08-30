//add public variable change
{
    if (_x select 1) then
    {
      systemChat "Changing Radio Color";
      (_x select 2) setMarkerColor "ColorGreen";
      (_x select 0) setMarkerAlpha 25;
    };
} forEach RadioCoverage;

"Disable" addPublicVariableEventHandler
{
  {
    (_x select 0) setMarkerAlpha 0;
  } forEach RadioCoverage;
};

"Enable" addPublicVariableEventHandler
{
  {
    if (_x select 1) then
    {
      (_x select 0) setMarkerAlpha 25;
    };
  } forEach RadioCoverage;
};
