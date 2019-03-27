// Begin
// This class generates a white boxed menu for the user to make a decision for a song.
// It is meant to be temporary so that the visualization may occur thus the dynamic() function.
// 

class Begin{
    float x;
    float y;
    PFont f;
    
    // Begin Constructor 
    // This allows the user to manipulate the position of the menu and the font that the menu recieves.
    //
    Begin(float _x, float _y, PFont F){
      x = _x;
      y = _y;
      F = f;
    }
    
    // run() truncates the display and the menu function returning a int option that
    // targets the visualization wall
    //
    int run(){
      display();
      return(menu());
      }
    
    // display draws the menu to cover the background partially although nothing rests behind it.
    int display(){
      rectMode(CENTER);
      fill(255);
      rect(x, y, 475, 475);
      f = createFont("Helvetica", 16);
      return (menu());
    }
    //
    // Menu handles all user input from choosing a song, giving an error for invalid input and 
    // rewinding songs letting the visualizer to work for another track. It's main importance
    // lies in passing the choice value to main and to the wall class.
    //
    int menu(){
        int choice = 0;
        fill(0);
        textAlign(RIGHT);
        text("Choose a song to start visualizer: ", width/2, 100);
        textAlign(LEFT);
        text("1 - Reach for the Dead", width/2, 140);
        textAlign(LEFT);
        text("2 - Beware", width/2, 180);
        textAlign(LEFT);
        text("3 - Mucha Muchacha", width/2, 220);
        textAlign(LEFT);
        text("4 - The Hammer", width/2, 260);
        if( key == '1'){
            choice = 1;
        }else if( key == '2'){
            choice = 2;
        }else if( key == '3'){
            choice = 3;
        }else if( key == '4'){
            choice = 4;
        }else if( key == 's'){
            for(int i = 0; i < 4; i ++){
                //Added feature to rewind song
                song[i].rewind();
                textAlign(CENTER);
                fill(255, 3, 3);
                text("Visualizer Stopped", width/2, height/2);
            }
        }else if( keyPressed == true && key != '1'||keyPressed == true && key != '2' || keyPressed == true && key!= '3' || keyPressed == true && key != '4'){
            textAlign(CENTER);
            fill(255, 3, 3);
            text("Please choose a valid option for a song!", width/2, 375);
            
        }
       
        return(choice);
        
      }
      
      //dynamic gives way to the visualizer by incrementing the y coordinates of the
      // rectangle.
      //
      void dynamic(){
        for(int i = 0; i < 250; i += 10){
            y = y + gravity;
            textAlign(RIGHT);
        }
      }
}