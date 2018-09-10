_trigger = _this select 0;
_NtownName = ((str _trigger) splitString "_");
_NtownName = _NtownName select 0;
_counter = 0;
_makername = "";
While {_counter <= 20} do
{
   _counter = _counter + 1;
   _makername = ((_NtownName) + ("_Inf_Building_") + (str (_counter)));
   _makername setMarkerAlpha 100;
};
