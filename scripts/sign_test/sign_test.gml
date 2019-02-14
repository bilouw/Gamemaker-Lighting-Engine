/// @description which side of a line is the point on.
/// @param Ax 
/// @param Ay 
/// @param Bx
/// @param By
/// @param Lx
/// @param Ly

var _Ax = argument0;
var _Ay = argument1;
var _Bx = argument2;
var _By = argument3;
var _Lx = argument4;
var _Ly = argument5;

return ((_Bx - _Ax) * (_Ly - _Ay) - (_By - _Ay) * (_Lx - _Ax));