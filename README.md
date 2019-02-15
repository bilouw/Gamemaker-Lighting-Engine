# Gamemaker Lighting Engine

![](GLE.gif)

Tiles based Lighting Engine that projects shadows with raycasting.

 The shadows projection is based on a tutorial by Mike Dailly that can be found here : [https://www.yoyogames.com/blog/419/realtime-2d-lighting-in-gamemaker-studio-2-part-1](https://www.yoyogames.com/blog/419/realtime-2d-lighting-in-gamemaker-studio-2-part-1?fbclid=IwAR3RysnCli5LjJS5s3Y9ZbQFEAbvlA1_QC-GVmozdKdm7r0sIFDs1fFKSzA). Thanks to him because it is the most difficult part if you’re not so good at maths.  
 
Once the shadows are casted, I use a pretty common method to draw the shadows on a light sprite then make blend stuff with surfaces.

It is not the most impressive light engine, but a good way to start with dynamic light development (which is pretty complex). Also, it can make a pretty good job in 2D games (mostly pixel art) to create some atmosphere and add volume to your scene.
  

## USING GLE

  

### Initial Setup :

Just drag and drop the « o_light_handler » object in a layer in your room. The lights and shadows will be applied on every layer below.

### Add Lights :

To add lights, create a child object of « o_light_par ». In « variables definitions » menu, you can set the scale of the radius light. You can also set if the light is static or dynamic. Static lights will be calculated only at room start.

### Foreground Lights :

If you want, you can put a different ambient shadow for background and foreground. Maybe you want to have a very dark background, but a foreground with some assets less dark. You can do this in the Light Handler, just see instructions below.

  

### Light Handler :

You can set differents things in « Variables Definitions » :

- ambient_light_ : Set the value of the background light in the room. 0 for total shadow and 1 for total light.

- foreground_ambient_light_ : Set the value of the foreground light in the room. 0 for total shadow and 1 for total light.

- foreground_depth_ : Set the depth of the foreground. This is where you set up which layer the foreground ambient light is applied on. The default value is -1 which deactivates the foreground ambient shadow.

  

### Collider :

The colliders are the tiles that block the lights and cast the shadows. These tiles can be the size you want, so you can cast a shadow from a tile of 1 pixel. You can also use the tilemap of your collision (if you have tile-based collision) to project shadow on every of your walls.

To add tilemap, go in the « o_light_handler » and add the tilemap id in the « tilemap_ » variable which is an array. See the project example to learn more.

### Improvements :

The Engine can be improved. Static lights are pretty optimized, but dynamics ones can be heavy to calculate. To improve this, just use static lights when you can,  minimize the dynamics light number and radius, or do some improvements (like calcul only dynamics lights present in camera). Below, some improvement that I might do in the future (I use this engine in my game development) :

- Add some color to the light (easy to do, you can do it yourself)

- Make some particules/flickering  effects.

- Optimize the calcul of shadows for dynamics lights.

- To use RGBA channel to draw 4 lights mask per surface (more efficient) and to can make shadows more complex and realistic. 

Here a link of Celeste's creator that explain how lights works in Celeste : https://medium.com/@NoelFB/remaking-celestes-lighting-3478d6f10bf 

In the last part, the optimization i talked ealier is a little bit explained. Also, it's a pretty good explanation on how this engine works too, because i followed most of this method.

You can also take this project as a base to start, then make your own functionality to make the engine better for you. I hope it will be helpful.

## Credits :

Mike Dailly : For his tutorial on shadows raycasting   https://www.yoyogames.com/blog/419/realtime-2d-lighting-in-gamemaker-studio-2-part-1

Adam Saltsman : For his free asset pack that i used for this project : https://adamatomic.itch.io/

## License :

You can use this code in any project (Commercial or not). I just demand to be credited.