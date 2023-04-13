import controlP5.*;

public class BarCharts {
  
     ControlP5 cp5;
     String[] airportNameList;
     int[] airportLateData;
     BarChart bc;
     DropdownList dropdown;
     TextBox tb;
     int lateness; 
     
     public BarCharts(PApplet p) {
          cp5 = new ControlP5(p);
          dropdown = cp5.addDropdownList("dropdown").setPosition(100, 125).setSize(400, 200);
          dropdown.setBarHeight(40);
          addItems(dropdown, airportNames);
          dropdown.setBarVisible(false);
          dropdown.setFont(bigStdFont);
          dropdown.setItemHeight(40);
          dropdown.close();
          
          tb = new TextBox(1000, 120, 150, 50, "How late? ");
          
          dropdown.addCallback(new CallbackListener() {
            public void controlEvent(CallbackEvent event) {
              if (event.getAction() == ControlP5.ACTION_CLICK && !dropdown.isOpen()) {
                int selectedValue = (int) dropdown.getValue();
                if(!isNameInList(airportNames[selectedValue])) updateNamesList(selectedValue);
              }
            }
          });
          
          lateness = 5;
     }
     
     public void draw() {
       textFont(bigStdFont);
       if(tb.pollForNewNumber()) {
         lateness = tb.getNewNumber();
         updateBarChart();
       }
       
      
         dropdown.setBarVisible(true);
         if(bc != null) {
           fill(100);
           text("Get flights that are late by: ", 675, 150);
           tb.draw();
           bc.draw();
         } else {
           fill(100);
           text("Select an airport from the dropdown menu to get started", 300, 400);
         }
         cp5.draw();
       
       
       textFont(stdFont);
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
           airportLateData = new int[airportNameList.length];
         }
         
         
         for(int i = 0; i<airportNameList.length;i++) {
            airportLateData[i] = data.getFlightByAirport(airportNameList[i]).getFlightByLateness(lateness).getSize();
         }
         
         
         bc = new BarChart(100, 200, 1000, 350, airportNameList, airportLateData, "Late flights by airport");
     }
     
     public void resetBarChart() {
       dropdown.close();
       bc = null;
       airportNameList = null;
     }
     
     public void removeItemFromChart(int index) {
       String[] newList;
       if(airportNameList.length != 1) {
         newList = new String[airportNameList.length-1];
         
         int j = 0; 
         for(int i = 0; i<newList.length; i++) {
            if(i == index) {
              j++;
            }
            
            newList[i] = airportNameList[j];
            j++;
         }
         
         
         airportNameList = newList;
         updateBarChart();         
       } else {
         resetBarChart();
       }

     }
     
     
     public void mousePressed() {
       if(bc != null && !dropdown.isOpen()) {
         if(bc.getWhichBarSelected(mouseX, mouseY) != -1) {
           removeItemFromChart(bc.getWhichBarSelected(mouseX, mouseY));
         }
       }
       
       tb.mousePressed();
     }
     
     public void keyPressed() {
       tb.keyPressed();
     }
     
     public void keyTyped() {
       tb.keyTyped();
     }
     
     
}  
