
Clock clock;
float[][] data;
String[] lightData;



void setup() {
  size(1100, 500);
  //loads the sleep data csv file
  lightData= loadStrings("DATA DIARY SLEEP CSV.csv");
  //initialises the maximum number of each row(3 weeks of data)
  data= new float[lightData.length][];
  for (int row=0; row<lightData.length; row++) {
    //splits a row of data into a smaller array
    String[] dataItems= split(lightData[row], ",");
    //initialises the maximum number of sleep data in a row(7 days a week)
    data[row] = new float[dataItems.length];
    //adds data items into a 2d array of the float data type 
    for (int col=0; col<dataItems.length; col++) {
      data[row][col]=float(dataItems[col]);
    }
  }
}

void draw() {
  background(255);
  int spacingX=150;
  int spacingY=150;
  
  for (int i=0; i<data.length; i++) {
    for (int j=0; j<data[i].length; j++) {
      //calculates the hour and the amount of minutes of sleep of a specific day
      float sleepTime= data[i][j];
      int hoursSlept= int(sleepTime);
      int minuteOfHour= int((sleepTime-hoursSlept)*60);
      //creates a clock object of the specific day
      clock= new Clock(100+spacingX*j, 100+spacingY*i, 70);
      //checks hours slept and colour of the clock changes corresponding to the quality of sleep
      if (hoursSlept>=8) {
        clock.drawClock(color(0, 255, 0));
      } else if (hoursSlept>=6 && hoursSlept<8) {
        clock.drawClock(color(255, 158, 0));
      } else {
        clock.drawClock(color(255, 0, 0));
      }
      //draws the hour hand and minute hand of the clock
      clock.drawHourHand(hoursSlept);
      clock.drawMinuteHand(minuteOfHour);
    }
  }
}
