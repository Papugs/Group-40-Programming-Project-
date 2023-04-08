public class BarChart {
  int x, y;
  int size;
  int w;
  int h;
  String[] labels;
  int[] values;
  int max;
  String title;

  public BarChart(int x, int y, int w, int h, String[] x_labels, int[] y_values, String t) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.labels = x_labels;
    this.values = y_values;
    this.size = x_labels.length;
    max = getMax(y_values);
    title = t;
  }

  public void draw() {
    for (int i = 0; i<size; i++) {
      fill(color(52, 155, 235));
      int offset = i*(h/size);
      if(    mouseX >= x 
          && mouseX <= x+(w*0.7*((float) values[i]/ (float) max))
          && mouseY >= y+offset
          && mouseY <= y+offset + (h/size)*.8) {
            stroke(100);
          } else {
            noStroke();
          }
          
      rect(x, y+offset, (w*0.7*((float) values[i]/ (float) max)), (h/size)*.8);
      fill(100);
      textAlign(LEFT);
      text(labels[i] + "-" + values[i] + " late flights", x+(w*0.75*((float)values[i]/ (float) max)), (y+offset)+(((float) h/ (float) size)*0.65));
      
    }
    textAlign(CENTER);
    float textSize = textAscent()/textDescent();
    textSize(50);
    text(title, x+((float) w / 2.0), (y+h)*1.1);
    textSize(textSize);
    textFont(bigStdFont);
    text("Click on a bar to remove it from the graph", x+((float) w / 2.0), (y+h)*1.15);
    textFont(stdFont_20);
    textAlign(LEFT);
    noStroke();
  }

  public int getMax(int[] v) {
    int max = v[0];
    for (int i = 0; i<v.length; i++) {
      if (v[i] > max) max = v[i];
    }
    return max;
  }
  
  public int getWhichBarSelected(int mx, int my) {
      for (int i = 0; i<size; i++) {
      int offset = i*(h/size);
      if(    mouseX >= x 
          && mouseX <= x+(w*0.7*((float) values[i]/ (float) max))
          && mouseY >= y+offset
          && mouseY <= y+offset + (h/size)*.8) {
            return i;
          }
      }
    
    return -1;
  }
}
class HeatMap extends BarChart {
  int[][] dates;
  int x, w, h, linesY;
  String[] x_labels;
  String title;
  int highestVal;
  int boxWidth, boxHeight, row, boxN, day, start;
  PFont ylabelFont;

  HeatMap(int x, int y, int w, int h, String[] x_labels, int[][] xy_values, String t, int[] y_values) {
    super(x, y, w, h, x_labels, y_values, t);
    dates = xy_values;
    title = t;
    this.x = x;
    this.w = w;
    this.h = h;
    this.x_labels = x_labels;
    findHighestValue();
    linesY = y_values[0]+2-y_values[1];
    boxWidth = w/25;
    boxHeight = h/linesY;
    boxN = (linesY-1)*24;
    start = y_values[1]-1;
    ylabelFont = loadFont("Arial-BoldMT-20.vlw");
  }

  void draw(float y) {
    pushMatrix();
    pushStyle();
    translate(x, y);
    textFont(ylabelFont);
    noStroke();
    fill(255);
    rect(0, 0, w, h);
    fill(0);
    stroke(1);
    strokeWeight(0.1);



    // INSERT COLOUR BOXES
    row = start;
    for (int count=1; count <= boxN; count += 1) {
      int boxX = ((count%24)+1)*boxWidth;
      int boxY = (row-start) * boxHeight;
      if (count%24 == 0) row++;
      drawColourBox(boxX, boxY, dates[row][(count-1)%24]);
    }


    // CREATE GRID
    for (int i=1; i<32; i++) {
      if (i<25) {
        int off = i*(w/25);
        line(off, 0, off, h);
        String y_label = Y_TIME_LABELS[i-1];
        textSize(15);
        text(y_label, off+w/24/2, h-h/linesY/2);
      }
      if (i < linesY) {
        int offY = i*(h/linesY);
        line(0, offY, w, offY);
        day = i+start;
        String y_label2 = str(day);
        if (day > 3 && day !=21 && day !=22 && day !=23 && day!=31) y_label2 += "th";
        switch(day) {
        case 1:
        case 21:
        case 31:
          y_label2 += "st";
          break;
        case 2:
        case 22:
          y_label2 += "nd";
          break;
        case 3:
        case 23:
          y_label2 += "rd";
          break;
        }
        textSize((w/24)/5);
        text(y_label2, w/24/2, offY-h/linesY/2+textAscent());
      }
    }
    popStyle();
    popMatrix();
  }

  void findHighestValue() {
    for (int[] time : dates) {
      for (int value : time) {
        if (value > highestVal) highestVal = value;
      }
    }
  }
  void drawColourBox(int x, int y, int value) {
    float relativeVal = ((float(value) / float(highestVal))*2)-1;
    float red=0, green=0, blue=0;
    pushStyle();
    if (relativeVal > 0) {
      red = 255;
      green = 255 * relativeVal;
    } else if (relativeVal < 0) {
      green = 255;
      red = 255+(255 * relativeVal);
    } else {
      green = 255;
      red = 255;
    }
    fill(red, green, blue);
    rect(x, y, boxWidth, boxHeight);
    popStyle();
  }
  void updateHeatMap(int x, int w, int h, String[] x_labels, int[][] xy_values, String t, int[] y_values) {
    dates = xy_values;
    title = t;
    this.x = x;
    this.w = w;
    this.h = h;
    this.x_labels = x_labels;
    findHighestValue();
    linesY = y_values[0]+2-y_values[1];
    boxWidth = w/25;
    boxHeight = h/linesY;
    boxN = (linesY-1)*24;
    start = y_values[1]-1;
  }
}
