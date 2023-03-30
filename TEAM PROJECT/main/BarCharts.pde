import controlP5.*;

public class BarCharts {
  
     ControlP5 cp5;
     String[] airportNameList;
     int[] airportLateData;
     BarChart bc;
     
     public BarCharts(PApplet p) {
          cp5 = new ControlP5(p);
          DropdownList dropdown = cp5.addDropdownList("dropdown").setPosition(100, 10).setSize(200, 100);       
          addItems(dropdown, airportNames);
          
          dropdown.addCallback(new CallbackListener() {
            public void controlEvent(CallbackEvent event) {
              if (event.getAction() == ControlP5.ACTION_CLICK) {
                int selectedValue = (int) dropdown.getValue();
                if(selectedValue != 0) updateNamesList(selectedValue);
              }
            }
          });
     }
     
     public void draw() {
       background(255);
       if(bc != null) bc.draw();
       cp5.draw();
     }
     
     public void addItems(DropdownList dl, String[] values) {
       for(int i = 1; i<=values.length; i++) {
         dl.addItem(values[i-1], i);
       }
     }
     
     public void controlEvent(ControlEvent event) {
       println("pressed");
       if(event.isFrom("dropdown")) {
         int selectedValue = (int) event.getController().getValue();
         println(selectedValue);
         //if(selectedValue != 0) updateNamesList(selectedValue);
       }
     }
     
     public void updateNamesList(int index) {
       String[] newList;
       if(airportNameList != null) {
         newList = new String[airportNameList.length+1];
         for(int i = 0; i<airportNameList.length;i++) {
           newList[i] = airportNameList[i];
         }
         newList[newList.length-1] = airportNames[index-1];
       } else {
         newList = new String[1];
         newList[0] = airportNames[index-1];
       }
       
       airportNameList = newList;
       
       updateBarChart();

     }
     
     public void updateBarChart() {
         if(airportLateData == null) {
           airportLateData = new int[1];
         } else {
           airportLateData = new int[airportLateData.length+1];
         }
         
         
         for(int i = 0; i<airportNameList.length;i++) {
            airportLateData[i] = data.getFlightByAirport(airportNameList[i]).getFlightByLateness(5).getSize();
         }
         
         bc = new BarChart(100, 100, 1000, 400, airportNameList, airportLateData, "Late flights by airport");
     }
     
     
}  
