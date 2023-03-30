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
     fill(100);
     for(int i = 0; i<size; i++) {
       int offset = i*(h/size);
       rect(x, y+offset, (w*0.7*((float) values[i]/ (float) max)), (h/size)*.8);
       textAlign(LEFT);
       text(labels[i] + "-" + values[i], x+(w*0.75*((float)values[i]/ (float) max)), (y+offset)+(((float) h/ (float) size)*0.65));
       textAlign(CENTER);  
       text(title, x+((float) w / 2.0), (y+h)*1.25);
       textAlign(LEFT);
   }
   }
   
   public int getMax(int[] v) {
     int max = v[0];
     for(int i = 0; i<v.length; i++) {
       if(v[i] > max) max = v[i];
     }
     return max;
   }
   
   
}
