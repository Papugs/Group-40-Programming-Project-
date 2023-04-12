public class TextBox {
   int x, y, w, h;
   String input;
   boolean fill;
   int number;
   boolean newNumber;
   
   public TextBox(int x, int y, int w, int h, String text) {
     this.x = x;
     this.y = y;
     this.w = w;
     this.h = h;
     this.input = text;
     number = 0;
     newNumber = false;
   }
   
   public boolean pollForNewNumber() {
     return newNumber;
   }
   
   public int getNewNumber() {
     newNumber = false;
     return number;
   }
   
   public void draw() {
     if(fill) {
       stroke(100);
     } else {
         noStroke();
     }
     
     if(fill) {
       fill(255);
     } else {
       fill(color(52, 155, 235));
     }
     
     rect(x, y, w, h);
     fill(100);
     text(input, x+(0.1*w), y+(0.65*h));
     
   }
   
  void keyPressed() {
    if (keyCode == ENTER && fill) {
      if(input != "") {
        try {
          number = Integer.parseInt(input);
        }
        catch (NumberFormatException e) {
        }
      } else {
        number = 0;
        input = "0";
        
      }
      
      newNumber = true;
      fill = false;
      println("number: " + number);
    }
    else if (keyCode == BACKSPACE && input.length() > 0) {
      // Remove the last character from the input string
      input = input.substring(0, input.length() - 1);
    }
  }
  
  void keyTyped() {
    if (key >= '0' && key <= '9') {
      // Add the typed character to the input string
      input += key;
    }
   }
    
   public void mousePressed() {
     
     if(    mouseX >= x
         && mouseX <= x+w
         && mouseY >= y
         && mouseY <= y+h ) {  
           input = "";
           fill = true;
     } else {
       fill = false;
     }
   }
   
   
}
