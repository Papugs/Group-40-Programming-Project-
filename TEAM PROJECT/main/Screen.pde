class Screen {
  PImage bg_img;
  PImage icon;
  color bgColor;
  ArrayList<A_Widget> widgets;
  int event;
  int screenID;
  PFont titleFont;
  PFont A_font_80;
  PImage planeImg;
  int timeVar = 0;
  int num = 0;
  Screen(int screenID, color bgColor, ArrayList<A_Widget> widgets) {
    this.screenID = screenID;
    this.bgColor = bgColor;
    this.widgets = widgets;
    titleFont = loadFont("BookmanOldStyle-120.vlw");
    icon = loadImage("icon.png");
    planeImg = loadImage("plane.png");
    bg_img = loadImage("bgP.jpeg");
    stdFont = loadFont("ArialRoundedMTBold-9.vlw");
  stdFont_20 = loadFont("ArialRoundedMTBold-20.vlw");
  A_font_80 = loadFont("ArialMT-80.vlw");
  }
  void addWidget(A_Widget widget) {
    widgets.add(widget);
  }

  int getEvent(int mX, int mY) {
    for (int i=0; i<widgets.size(); i++) {
      if (mX > widgets.get(i).x && mX < widgets.get(i).x + widgets.get(i).width && mY > widgets.get(i).y && mY < widgets.get(i).y + widgets.get(i).height) {
        return widgets.get(i).event;
      }
    }
    return EVENT_NULL;
  }

  void draw() {
    if (screenID ==0) {
      fill(0);
      textFont(titleFont);
      textSize(80);



      if (timeVar%30 == 0) {
        if (num != 3) {
          num++;
        } else {
          num = 1;
        }
      }

      if (num ==1) {
        background(255);
        text("Loading .", 400, 550);
      } else if (num == 2) {
        background(255);

        text("Loading ..", 400, 550);
      } else if (num == 3) {
        background(255);

        text("Loading ...", 400, 550);
      } else {
        background(255);

        text("Loading  ", 400, 550);
      }

      image(icon, 340, 0);



      timeVar++;
    }
    if (screenID == 1) {

      fill(201, 233, 246);
      textFont(titleFont);
      textSize(120);
      text("Sky's The ", 40, 280);
      text("Limit", 40, 280+120);
      strokeWeight(2);
      fill(201, 233, 246);
      noStroke();
      rect(-10, -10, 1265, 100, 24);

      //image(planeImg, 299,-10,1000,700);
    } else if (screenID == 2) {
      fill(201, 233, 246);
      noStroke();
      rect(-10, -10, 1265, 100, 24);
    } else if (screenID == 3) {
      background(bgColor);
      fill(201, 233, 246);
      noStroke();
      rect(-10, -10, 1265, 100, 24);
    } else if (screenID == 4) {

      fill(201, 233, 246);
      noStroke();
      rect(-10, -10, 1265, 100, 24);
    } else if (screenID == 5) {
      background(bgColor);
      fill(201, 233, 246);
      noStroke();
      rect(-10, -10, 1265, 100, 24);


      //displaytext
      String s = "This program allows users to visualise the flights dataset in multiple ways.\n Flights can be sorted by date range on the Main Data page, which allows users to select a date range and view all the information about each flight within that range, as well as a heatmap of what days flights left on.\nThe Bar Graph page allows users to compare how many flights were late from various airports, also adjusting which flights should be counted based on how late they are. \nThe Geographic Map page allows users to view the flights that have left from each state, by selecting that state on the map.";
      fill(0);
      textFont(A_font_80);
      textSize(20);
      text(s, 40, 140, 1000, 700);
      
      textFont(A_font_80);
      textSize(20);
      String t = "The Team - \n 1. Ayushmaan Kumar Yadav \n 2. Henry Synnott \n 3. Palak Aggarwal \n 4. Nobert Papuga"; 
      text(t, 40, 330, 1000, 700);
    }


    for (int i = 0; i<widgets.size(); i++) {
      widgets.get(i).draw();
    }
  }
}
