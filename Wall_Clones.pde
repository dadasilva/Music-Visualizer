//
// Clone 
// Author: David DaSilva
// Creates boxes sporadically while main visualization takes place while
// borrowing the soundColor() function from the Object class.
//

class Clone extends Object {
    Clone(float x, float y){
        super(x, y, random(50), random(50)); // random because its only been 
                                             // squares.
    }
  }
  