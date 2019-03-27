//
// Object 
// Author: David DaSilva
// Components borrowed from Dr. Brown (Freedom of Speech/Object)
//
// This class creates the objects used in the visualizer as well as bringing
// the ossilation of color and bounciness to main object. It later becomes the 
// mother class to the tiny rects that pop around the screen.
//
class Object {
  float x;
  float y;
  float w;
  float h;
  
  //
  //Object 
  //Constructor. Allows designation of parameters to the bouncing colorful
  // wall that becomes the visualizer.
  //
  Object(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
  }
  
  //
  // display
  // creates the rectangle  and applies the synesthetic behavior to the 
  // object.
  //
  
  void display(int choice){
    rectMode(CENTER);//centers the object
    soundColor(choice);
    rect(x, y, h, w);
  }
  
  //
  // distort
  // Bounces the rectangle up and down giving it the illusion of weight 
  // attracting it to the center of the screen.
  //
  void distort(){
     y = y + speed;
     //Add gravity to speed
      speed = speed + gravity;
    
      if(y > height/2){
         speed = speed * -0.95;
         y = height/2;
      } 
      if(speed == 0){
         y = 0;
      }
  }
  
  //
  //soundColor
  // soundColor uses the Minim Library to read decible outputs from the song 
  // selection. It ties into the fill with the random() function to play out
  // colorful sequences to the music.
  //
  void soundColor(int choice){
    float setting = 100;
    //jostles the color and transparency of the back wall
    for(int i = 0; i < song[choice].bufferSize() - 1; i++)
    {  
      stroke(0);
      fill(random(setting), random(setting) + song[choice].right.get(i)*100, random(100) + song[choice].left.get(i)*50, random(255) + song[choice].mix.get(i)*.5);
    }
  }
  
}