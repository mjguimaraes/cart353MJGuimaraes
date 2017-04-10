class Person {

  PVector[] origin, velocity, angle, amplitude;
  XML[] fileXML, temp;
  float[] dotSize, ratePos;
  color[] emotionColor;

  Person(XML[] temp) {
    fileXML = temp;

    //defining arrays to all calculations below
    dotSize = new float[fileXML.length]; //rules size of each floating element
    ratePos = new float[fileXML.length]; //rules floating centers according to day rate
    origin = new PVector[fileXML.length]; //where each floating element starts
    velocity = new PVector[fileXML.length]; //velocity in which they float
    amplitude = new PVector[fileXML.length]; //how far each element reaches from floating centers
    angle = new PVector[fileXML.length]; //defines angular motion
    emotionColor = new color[fileXML.length]; //defines colours of each element regarding emotion declared on survey

    ellipseMode(CENTER);

    for (int i = 0; i < fileXML.length; i++) {
      //initiating variables
      origin[i] = new PVector();
      angle[i] = new PVector();
      velocity[i] = new PVector();
      amplitude[i] = new PVector();

      //mapping velocity to be the inverse of age - the older, the slower
      float velo = map(ageEntries.allAges[i], 5, ageEntries.allAges[i], ageEntries.allAges[i], 5);
      velocity[i] = new PVector(random(-.2/velo, .2/velo), random(-.1/velo, .1/velo));
      //velocity[i] = new PVector(random(-velo, velo), random(-.5*velo, .5*velo));

      //calculating colour, velocity and amplitude associated to each emotion type
      if (emotionEntries.allEmotions[i].equals("Enjoyment")) {
        emotionColor[i] = color(random(180, 245), random(180, 245), 0);//set colour to be shades of yellow to yellowish green

        //using log to limit the magnitude of larger numbers
        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*50, log(periodEntries.allPeriods[i])*50);
      } else if (emotionEntries.allEmotions[i].equals("Sadness")) {
        emotionColor[i] = color(0, random(80, 100), random(140, 180)); //set colour to be shades of blue

        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*70, log(periodEntries.allPeriods[i])*50);
      } else if (emotionEntries.allEmotions[i].equals("Anger")) {
        emotionColor[i] = color(random(150, 230), random(10, 40), random(10, 40));//set colour to be shades of red

        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*50, log(periodEntries.allPeriods[i])*10);
      } else if (emotionEntries.allEmotions[i].equals("Fear")) {
        emotionColor[i] = color(random(120, 170), 0, random(150, 240));//set colour to be shades of purple

        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*30, log(periodEntries.allPeriods[i])*60);
      } else if (emotionEntries.allEmotions[i].equals("Disgust")) {
        emotionColor[i] = color(random(150, 200), random(80, 120), 0);//set colour to be shades of orange to brown

        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*30, log(periodEntries.allPeriods[i])*70);
      } else if (emotionEntries.allEmotions[i].equals("[not defined]")) {
        emotionColor[i] = color(180); //set colour to be light grey

        amplitude[i] = new PVector(log(periodEntries.allPeriods[i])*40, log(periodEntries.allPeriods[i])*40);
      }
    }
  }

  void run() {
    //runs drawing functions
    movePerson();
    displayPerson();
  }

  void displayPerson() {
    for (int i = 0; i < fileXML.length; i++) {

      //calculate each element position accordinly to floating centers
      float x = sin(angle[i].x) * amplitude[i].x;
      float y = sin(angle[i].y) * amplitude[i].y;

      // relates each element size to the age response - the older, the bigger
      dotSize[i] = ageEntries.allAges[i]/5;

      //set apart each element to a floating center regarding the day rate
      pushMatrix();
      if (ratingEntries.allRates[i] == 1) {
        translate(3*width/4 + 50, 2*height/3 + 50); //for bad days
      } else if (ratingEntries.allRates[i] == 2) {
        translate(width/2, height/2+50); //for regular days
      } else if (ratingEntries.allRates[i] == 3) {
        translate(width/4 - 50, height/3 + 50); //for good days
      } else {
        translate(width/2, height/2); //checking for blank responses, move them to a regular day
      }
      rotate(angle[i].y/10);
      smooth();
      stroke(emotionColor[i], 10);
      line(0, 0, x, y);
      fill(emotionColor[i]);
      ellipse(x, y, dotSize[i], dotSize[i]);
      popMatrix();
      noStroke();
    }
  }

  void movePerson() {
    for (int i = 0; i < fileXML.length; i++) {
      angle[i].add(velocity[i]); //the angular movement is ruled by velocity defined above
    }
  }
}