class Clock {

  float x, y, radius;

  //constructor for the clock class
  Clock(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  //function to draw the base of the clock
  void drawClock(color outlineColor) {
    strokeWeight(5);
    stroke(outlineColor);
    fill(255);
    circle(x, y, radius*2);
    circle(x, y, 5);

    //Creates the clock tickes for each Hour of the clock(12 ticks in total)
    for (int i = 0; i < 12; i++) {
      //calculates the angle of each clock tick
      float angle = radians(i*(360/12));
      //using SOHCAHTOA(trigonometry) to get the coordinate points of x and Y values of the circle's circumference
      float x1 = x+cos(angle)*(radius-10);
      float y1 = y+sin(angle)*(radius-10);
      float x2 = x+cos(angle)*radius;
      float y2 = y+sin(angle)*radius;
      strokeWeight(2);
      line(x1, y1, x2, y2);
    }
  }
  //function to draw the hour hand of the clock
  void drawHourHand(int hours) {
    //using trigonometry to create an accurate hour hand
    float hourAngle = radians((hours)*(360/12)-90);
    float hx = x+cos(hourAngle)*(radius*0.45);
    float hy = y+sin(hourAngle)*(radius*0.45);
    strokeWeight(5);
    line(x, y, hx, hy);
  }

  //function to draw the minute hand of the clock
  void drawMinuteHand(int minutes) {
    //using trigonometry to create an accurate minute hand
    float minuteAngle = radians(minutes*(360/60)-90);
    float mx = x+cos(minuteAngle)*(radius*0.7);
    float my = y+sin(minuteAngle)*(radius*0.7);
    strokeWeight(5);
    line(x, y, mx, my);
  }
}
