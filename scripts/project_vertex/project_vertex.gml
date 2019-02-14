/// @description cast a shadow of this line segment from the point light
/// @param VB Vertex buffer
/// @param Ax  x1
/// @param Ay  y1
/// @param Bx  x2
/// @param By  y2
/// @param Lx  Light x
/// @param Ly  Light Y

var _vb = argument0;
var _Ax = argument1;
var _Ay = argument2;
var _Bx = argument3;
var _By = argument4;
var _Lx = argument5;
var _Ly = argument6;
var _Color = argument7;

// shadows are infinite - almost, just enough to go off screen
var SHADOW_LENGTH = 1000;

var Adx,Ady,Bdx,Bdy,len;

// get unit length to point 1
Adx = _Ax-_Lx;      
Ady = _Ay-_Ly;      
len = (1.0*SHADOW_LENGTH)/sqrt( (Adx*Adx)+(Ady*Ady) );      // unit length scaler * Shadow length
Adx = _Ax + Adx * len;
Ady = _Ay + Ady * len;

// get unit length to point 2
Bdx = _Bx-_Lx;      
Bdy = _By-_Ly;      
len = (1.0*SHADOW_LENGTH) / sqrt( (Bdx*Bdx)+(Bdy*Bdy) );    // unit length scaler * Shadow length
Bdx = _Bx + Bdx * len;
Bdy = _By + Bdy * len;


// now build a quad
vertex_position(_vb, _Ax,_Ay);
vertex_color(_vb, _Color, 1);
vertex_position(_vb, _Bx,_By);
vertex_color(_vb, _Color, 1);
vertex_position(_vb, Adx,Ady);
vertex_color(_vb, _Color, 1);

vertex_position(_vb, _Bx,_By);
vertex_color(_vb, _Color, 1);
vertex_position(_vb, Adx,Ady);
vertex_color(_vb, _Color, 1);
vertex_position(_vb, Bdx,Bdy);
vertex_color(_vb, _Color, 1);