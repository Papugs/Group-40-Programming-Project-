class Screen {
  PImage bg_img;
  color bgColor;
  ArrayList<A_Widget> widgets;
  int event;
  int screenID;
  PFont titleFont;
  PImage planeImg;
  int timeVar = 0;
  int num = 0;
  Screen(int screenID, color bgColor, ArrayList<A_Widget> widgets) {
    this.screenID = screenID;
    this.bgColor = bgColor;
    this.widgets = widgets;
    titleFont = loadFont("BookmanOldStyle-120.vlw");

    planeImg = loadImage("plane.png");
    bg_img = loadImage("bgP.jpeg");
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

        System.out.println(num);
      }

      if (num ==1) {
        background(255);
        text("Loading .", 400, 350);
      } else if (num == 2) {
        background(255);

        text("Loading ..", 400, 350);
      } else if (num == 3) {
        background(255);

        text("Loading ...", 400, 350);
      } else {
        background(255);

        text("Loading  ", 400, 350);
      }





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
    }


    for (int i = 0; i<widgets.size(); i++) {
      widgets.get(i).draw();
    }
  }
}
