import controlP5.*;

public class BarCharts {
  
     ControlP5 cp5;
     String[] airportNameList;
     int[] airportLateData;
     BarChart bc;
     DropdownList dropdown;
     
     public BarCharts(PApplet p) {
          cp5 = new ControlP5(p);
          dropdown = cp5.addDropdownList("dropdown").setPosition(100, 25).setSize(400, 200);
          dropdown.setBarHeight(50);
          dropdown.setItemHeight(25);
          addItems(dropdown, airportNames);
          dropdown.setBarVisible(false);
          dropdown.close();
          
          dropdown.addCallback(new CallbackListener() {
            public void controlEvent(CallbackEvent event) {
              if (event.getAction() == ControlP5.ACTION_CLICK) {
                int selectedValue = (int) dropdown.getValue();
                if(!isNameInList(airportNames[selectedValue])) updateNamesList(selectedValue);
              }
            }
          });
     }
     
     public void draw() {
       
       background(255);
       dropdown.setBarVisible(true);
       if(bc != null) {
         bc.draw();
       } else {
         fill(100);
         text("Select an airport from the dropdown menu to get started", 250, 300);
       }
       cp5.draw();
     }
     
     public void addItems(DropdownList dl, String[] values) {
       for(int i = 1; i<=values.length; i++) {
         dl.addItem(values[i-1], i);
       }
     }
     
     
     public void updateNamesList(int index) {
       String[] newList;
       
       if(airportNameList != null ) {
         newList = new String[airportNameList.length+1];
         for(int i = 0; i<airportNameList.length;i++) {
           newList[i] = airportNameList[i];
         }
         newList[newList.length-1] = airportNames[index];
       } else {
         newList = new String[1];
         newList[0] = airportNames[index];
       }
       
       airportNameList = newList;
       
       updateBarChart();

     }
     
     public boolean isNameInList(String name) {
       if(airportNameList != null) {
          for(String s : airportNameList) {
            if(s.compareTo(name) == 0) return true;
          }
       }
        return false;
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
     
     public void resetBarChart() {
       bc = null;
     }
     
     
}  
