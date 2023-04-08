//import grafica.*;

//class Bargraph {
//  String TitleText = ("Lateness");//Plot Title
//    float[] sensorVals = {27, 25, 23, 22, 21, 20, 20, 20, 21, 21.25, 21.5, 21};
//    int numVal = sensorVals.length;//Length of Sensor Array for Plot Loop
//    float redVal = 1.6; //Red Colour Limit
//    float amberVal = 3; //Amber Colour Limit
//    GPlot plot1;
//     GPointsArray points;
//    GPointsArray points1;
//    GPointsArray points2;
//  Bargraph(PApplet p) {
   
//    points = new GPointsArray(2000); //Amber Point Array
//    points1 = new GPointsArray(2000); // Red Point Array
//    points2 = new GPointsArray(2000); //Green Point Array


//    // Create the first plot
//    plot1 = new GPlot(p);
//    plot1.setPos(150, 150);
//    plot1.setMar(60, 70, 40, 70);
//    plot1.setDim(300, 300);
//    plot1.setAxesOffset(4);
//    plot1.setTicksLength(4);
//    plot1.setTitleText(TitleText);
//    plot1.getYAxis().setAxisLabelText("no. of late flights");
//    plot1.getXAxis().setAxisLabelText(" dearture airports ");

//    //Array Colour Coding and Plotting------------------------------------
//    float minVal = min(sensorVals);//Find set minimum value
//    float redBound = (minVal+redVal);//Define Red Boundary
//    float greenBound = (minVal+amberVal);//Define Green Bondary
//    //For loop for sorting array values into appropriate layers
//    for (int i=0; i < numVal; i++) {
//      if (sensorVals[i] < redBound) {
//        points1.add(i, sensorVals[i]);
//      }
//      if (sensorVals[i] >= greenBound) {
//        points2.add(i, sensorVals[i]);
//      } else {
//        points.add(i, sensorVals[i]);
//      }
//    }
    
//    plot1.setPoints(points);
//    plot1.addLayer("redVal", points1); //Add red layer
//    plot1.addLayer("greenVal", points2); //Add green layer
//    plot1.setPointColor(color(255, 800, 0, 100)); //Set original layer amber
//    plot1.getLayer("redVal").setPointColor(color(255, 0, 0, 100)); //Set red layer red
//    plot1.getLayer("greenVal").setPointColor(color(0, 255, 0, 100));//Set green layer green
//  }
//  void draw() {//Plot Creation
    
    
//    //Draw the first plot
//    plot1.beginDraw();
//    plot1.drawBox();
//    plot1.drawXAxis();
//    plot1.drawYAxis();
//    plot1.drawTitle();
//    plot1.drawGridLines(GPlot.VERTICAL);
//    plot1.drawFilledContours(GPlot.HORIZONTAL, 0);
//    plot1.drawPoints();
//    plot1.drawLines();
//    plot1.endDraw();
//    plot1.activatePanning(); // Activate the panning (only for the first plot)
//  }
//}
