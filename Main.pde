//
// Lab 5: Processing Music Visualizer
// Author: David DaSilva
// This program reads four songs into an array and allows the user to choose one of the 
// four songs. If the user chooses an invalid option an error message is read. Otherwise, 
// the menu will fall and the visualization will begin. The visualization includes
// a square object that bounces and ossilates its color to the left, right and mized 
// output of the audio file using the Minim library. Along with the centered 
// object, the user will see randomized color squares that appear to 
// ossilate as well. To quit the program, click the 'esc' key. 
// The user has the ability to run many songs at once which is a bad idea for ones 
// sanity. In that case, the title of the program becomes "MTV".

//The Minim Library is needed for the audio features 
import ddf.minim.*;


//WORLD OBJECTS
Minim minim;
AudioPlayer[] song = new AudioPlayer[4];// array holding four songs
AudioInput input;
PFont f;
Object wall;
Begin open;

//WORLD PARAMETERS:
//variables for window
float x, y, z;
//variables for gravity
float speed = 0;
float gravity = 0.1;
//font

//
// setup
// Display a black background, load songs into an array, and create the objects to draw.
//
void setup(){
 size (500 , 500, P3D);
 background(245);
 
 //
 //Loads four in songs into an array
 // incrementing the song file name to accomadate the 
 // for loop.
 minim = new Minim(this);
 for(int i = 0; i < 4; i++){
   song[i] = minim.loadFile("song_0"+i+".mp3");
   }
 
 //
 //This determines the font type for the menu output.
 //
 
 f = createFont("Helvetica", 16);
 
 //
 //declare new variables for classes Begin and Object
 //
 open = new Begin(width/2, height/2, f);
 wall = new Object(width/2, height/2, 250, 250);
 
 // 
 // this allows for simple easy to use variables in
 // the case that I need to place the item on the vertex
 //
 x = width/2;
 y = height/2;
 z = 0; 

}



//
// draw
// Handles updates of all screen elements. It gives the user 
// options for songs to play and runs the visualizer.
// 
void draw(){
  background(0);
  int choice = 0;

 //opening window
  choice = open.run();
    if(choice == 1 || choice == 2 || choice == 3 || choice == 4){

      // dynamic removes the menu screen from the display.
      open.dynamic();
      song[choice - 1].play();
      wall.display(choice - 1);
      wall.distort();
      // Clone c creates the external boxes that generate randomly over the black screen
      Clone c = new Clone(random(500), random (500));
      c.display(choice - 1); 
    } 
}
  