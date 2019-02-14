///@description		project_shadow
///@arg				lx
///@arg				ly
///@arg				rad
///@arg				tilemap_array
/// Project tile's shadows

var lx = argument0;
var ly = argument1;
var rad = argument2;

for (var i=0; i<array_length_1d(argument3); i++)
{	
	var tilemap		= argument3[i];
	var tile_size	= tilemap_get_tile_width(tilemap);     // size of a tile
	
	var startx		= floor((lx-rad)/tile_size);
	var endx		= floor((lx+rad)/tile_size);
	var starty		= floor((ly-rad)/tile_size);
	var endy		= floor((ly+rad)/tile_size);
			
	vertex_begin(VBuffer, VertexFormat);

	for(var yy=starty;yy<=endy;yy++)
	{
		for(var xx=startx;xx<=endx;xx++)
		{
			var tile = tilemap_get(tilemap,xx,yy);
			if(tile == 1)
			{
				// get corners of the 
				var px1 = xx*tile_size;     // top left
				var py1 = yy*tile_size;
				var px2 = px1+tile_size;    // bottom right
				var py2 = py1+tile_size;

				if( !sign_test( px1,py1, px2,py1, lx,ly) ){
					project_vertex(VBuffer,  px1,py1, px2,py1, lx,ly, $000000);
				}
				if( !sign_test( px2,py1, px2,py2, lx,ly) ){
					project_vertex(VBuffer,  px2,py1, px2,py2, lx,ly, $000000);
				}
				if( !sign_test( px2,py2, px1,py2, lx,ly) ){
					project_vertex(VBuffer,  px2,py2, px1,py2, lx,ly, $000000);
				}
				if( !sign_test( px1,py2, px1,py1, lx,ly) ){
					project_vertex(VBuffer,  px1,py2, px1,py1, lx,ly, $000000);                      
				}  
			}
		}
	}					
	vertex_end(VBuffer);  
	vertex_submit(VBuffer,pr_trianglelist,-1);
}