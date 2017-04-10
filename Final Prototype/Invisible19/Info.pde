class Info {

  XML[] fileXML, temp;

  PShape woman, man, logo;
  int unitWidth = 30;
  int unitHeight = 50;
  int w, h;
  PFont font18, font24;

  Info(XML[] temp) {
    fileXML = temp;
    noStroke();
    smooth();
    shapeMode(CENTER);

    //shapes to represent gender info
    woman = loadShape("woman.svg"); //vector retrieved from www.freepik.com/free-vector/silhouettes-of-man-and-woman_766045.htm, designed by Freepik
    man = loadShape("man.svg"); //vector retrieved from www.freepik.com/free-vector/silhouettes-of-man-and-woman_766045.htm, designed by Freepik
    woman.disableStyle(); //ignores native shape style
    man.disableStyle();
    //vector for logo
    logo = loadShape("logo.svg");

    //fonts for texts
    font18 = createFont("Dosis-Regular.ttf", 18, true);
    font24 = createFont("Dosis-Regular.ttf", 24, true);
  }

  //function to display info about each person response
  void displayInfo(int mouseXPos, int mouseYPos) {
    //variables to distribute woman/man shapes in a modular grid
    w = unitWidth;
    h = unitHeight - 20;

    //display each woman/man shape according to gender and emotion colour
    for (int i = 0; i < fileXML.length; i++) {
      noStroke();
      smooth();
      fill(person.emotionColor[i]);
      if (genderEntries.allGenders[i].equals("woman")) {
        shape(woman, w, h, 10, 40);
      } else if (genderEntries.allGenders[i].equals("man")) {
        shape(man, w, h, 11, 40);
      } else if (genderEntries.allGenders[i].equals("[preferred not mentionning gender]") || genderEntries.allGenders[i].equals("Other")) {
        ellipse(w, h, 10, 40);
      }

      //calculation to adjust the period ranges accordingly to current year
      int updateAge = int(ageEntries.allAges[i]) + (year() - 2017);
      float adjustPeriod = periodEntries.allPeriods[i] + (year() - 2017);
      //adjust period range to display X.XX if less than 10 years, and XX.XX if more
      String updatePeriod = nf(adjustPeriod, 2, 2);
      if (adjustPeriod < 10.0) {
        updatePeriod = nf(adjustPeriod, 1, 2);
      }
      //adjustments to gender pronoums
      String pronoum ="";
      String possessive ="";
      if (genderEntries.allGenders[i].equals("woman")) {
        pronoum = "she";
        possessive = "her";
      } else if (genderEntries.allGenders[i].equals("man")) {
        pronoum = "he";
        possessive = "his";
      }
      //strings that carries the summary of a person response
      String info = "This is the portrait of a " + genderEntries.allGenders[i] + " who lives in " + countryEntries.allCountries[i] + ", aged around " + updateAge + ", and suffers from " + conditionEntries.allConditions[i] + " for around " + updatePeriod + " years.";
      String emotion = "On " + dateEntries.allDates[i] + ", " + pronoum + " was having a " + ratingEntries.allDayRates[i] + ", and " + possessive + " relevant emotion for that day was " + emotionEntries.allEmotions[i] + ", and " + pronoum + " felt " + emotionEntries.allFeelings[i] + ".";
      //checking if mouse hover a woman/man shape, then display the respective summary
      float mouseDist = dist(mouseXPos, mouseYPos, w, h);
      if (mouseDist < 10) {
        fill(255);
        textAlign(LEFT, CENTER);
        textFont(font18);
        text(info+"\n"+emotion, 100, 660, 1100, 100);
      }
      //increments shape position to the right, so next shape will be equally distant
      w += unitWidth;
      //if reaches the end of window, increment to height, so it'll start a new row
      if (w >= width) {
        h += unitHeight;
        w = unitWidth;
      }
    }
    //texts for floating centers
    textAlign(CENTER, CENTER);
    textFont(font24);
    fill(255);
    text("Bad day", 3*width/4 + 50, 2*height/3 + 50);
    text("Regular day", width/2, height/2+50);
    text("Good day", width/4 - 50, height/3 + 50);
  }

  // function to display a colour legend at bottom of window
  void displayLegend(int mouseXPos, int mouseYPos) {
    // 1st box for enjoyment with linear gradient
    beginShape();
    fill(245, 245, 0);
    vertex(1, 770);
    fill(0, 240, 0);
    vertex(width/5-2, 770);
    fill(0, 240, 0);
    vertex(width/5-2, 800);
    fill(245, 245, 0);
    vertex(1, 800);
    endShape();

    //check if mouse over box and display feelings count
    if (mouseXPos >= 1 && mouseXPos <= width/5-2 && mouseYPos >= 770 && mouseYPos <= 800) {
      fill(255);
      String enjoy = "Excitement: " + emotionEntries.excitement.size() +  "\nWonder: " + emotionEntries.wonder.size() + "\nPride: " + emotionEntries.pride.size() + "\nPeace: " + emotionEntries.peace.size() + "\nRelief: " + emotionEntries.relief.size() + "\nAmusement: " + emotionEntries.amusement.size() + "\nCompassion: " + emotionEntries.compassion.size() + "\nJoy: " + emotionEntries.joy.size() + "\nRejoicing: " + emotionEntries.rejoicing.size() + "\nPleasure: " + emotionEntries.pleasure.size();
      textAlign(CENTER, CENTER);
      text(enjoy, 0, 560, width/5, 200);
    }

    // 2nd box for sadness with linear gradient
    beginShape();
    fill(0, 110, 240);
    vertex(width/5+1, 770);
    fill(0, 70, 220);
    vertex(2*width/5-2, 770);
    fill(0, 70, 220);
    vertex(2*width/5-2, 800);
    fill(0, 110, 240);
    vertex(width/5+1, 800);
    endShape();

    //check if mouse over box and display feelings count
    if (mouseXPos >= width/5+1 && mouseXPos <= 2*width/5-2 && mouseYPos >= 770 && mouseYPos <= 800) {
      fill(255);
      String sad = "Anguish: " + emotionEntries.anguish.size() +  "\nSorrow: " + emotionEntries.sorrow.size() + "\nGrief: " + emotionEntries.grief.size() + "\nDespair: " + emotionEntries.despair.size() + "\nMisery: " + emotionEntries.misery.size() + "\nHopelessness: " + emotionEntries.hopelessness.size() + "\nHelplessness: " + emotionEntries.helplessness.size() + "\nResignation: " + emotionEntries.resignation.size() + "\nDistraughtness: " + emotionEntries.distraughtness.size() + "\nDiscouragement: " + emotionEntries.discouragement.size() + "\ndisappointment: " + emotionEntries.disappointment.size();
      textAlign(CENTER, CENTER);
      text(sad, width/10, 560, 2*width/5, 200);
    }

    // 3rd box for anger with linear gradient
    beginShape();
    fill(230, 40, 40);
    vertex(2*width/5+1, 770);
    fill(200, 0, 0);
    vertex(3*width/5-2, 770);
    fill(200, 0, 0);
    vertex(3*width/5-2, 800);
    fill(230, 40, 40);
    vertex(2*width/5+1, 800);
    endShape();

    //check if mouse over box and display feelings count
    if (mouseXPos >= 2*width/5+1 && mouseXPos <= 3*width/5-2 && mouseYPos >= 770 && mouseYPos <= 800) {
      fill(255);
      String anger = "Fury: " + emotionEntries.fury.size() +  "\nBitterness: " + emotionEntries.bitterness.size() + "\nVengefulness: " + emotionEntries.vengefulness.size() + "\nArgumentativeness: " + emotionEntries.argumentativeness.size() + "\nExasperation: " + emotionEntries.exasperation.size() + "\nFrustration: " + emotionEntries.frustration.size() + "\nAnnoyance: " + emotionEntries.annoyance.size();
      textAlign(CENTER, CENTER);
      text(anger, width/5, 560, 3*width/5, 200);
    }

    // 4th box for fear with linear gradient
    beginShape();
    fill(180, 0, 220);
    vertex(3*width/5+1, 770);
    fill(120, 0, 180);
    vertex(4*width/5-2, 770);
    fill(120, 0, 180);
    vertex(4*width/5-2, 800);
    fill(180, 0, 220);
    vertex(3*width/5+1, 800);
    endShape();

    //check if mouse over box and display feelings count
    if (mouseXPos >= 3*width/5+1 && mouseXPos <= 4*width/5-2 && mouseYPos >= 770 && mouseYPos <= 800) {
      fill(255);
      String fear = "Terror: " + emotionEntries.terror.size() +  "\nHorror: " + emotionEntries.horror.size() + "\nPanic: " + emotionEntries.panic.size() + "\nDesperation: " + emotionEntries.desperation.size() + "\nDread: " + emotionEntries.dread.size() + "\nAnxiety: " + emotionEntries.anxiety.size() + "\nNervousness: " + emotionEntries.nervousness.size() + "\nTrepidation: " + emotionEntries.trepidation.size();
      textAlign(CENTER, CENTER);
      text(fear, 3*width/10, 560, 4*width/5, 200);
    }

    // 5th box for disgust with linear gradient
    beginShape();
    fill(200, 140, 0);
    vertex(4*width/5+1, 770);
    fill(140, 90, 0);
    vertex(width-2, 770);
    fill(140, 90, 0);
    vertex(width-2, 800);
    fill(200, 140, 0);
    vertex(4*width/5+1, 800);
    endShape();

    //check if mouse over box and display feelings count
    if (mouseXPos >= 4*width/5+1 && mouseXPos <= width-2 && mouseYPos >= 770 && mouseYPos <= 800) {
      fill(255);
      String disgust = "Loathing: " + emotionEntries.loathing.size() +  "\nAbhorrence: " + emotionEntries.abhorrence.size() + "\nRevulsion: " + emotionEntries.revulsion.size() + "\nRepugnance: " + emotionEntries.repugnance.size() + "\nDistaste: " + emotionEntries.distaste.size() + "\nAversion: " + emotionEntries.aversion.size() + "\nDislike: " + emotionEntries.dislike.size();
      textAlign(CENTER, CENTER);
      text(disgust, 4*width/10, 560, width, 200);
    }

    //titles for each box
    fill(0);
    textAlign(CENTER);
    textFont(font18);
    text("Enjoyment", width/10, 790);
    text("Sadness", 3*width/10, 790);
    text("Anger", 5*width/10, 790);
    text("Fear", 7*width/10, 790);
    text("Disgust", 9*width/10, 790);
  }

  //text for 1st text screen
  void introA() {
    beginShape();
    fill(245, 245, 0);
    vertex(0, 0);
    fill(0, 110, 240);
    vertex(width, 0);
    fill(220, 10, 10);
    vertex(width, height);
    fill(220, 0, 200);
    vertex(0, height);
    endShape();
    noStroke();
    textAlign(LEFT);
    textFont(font24);
    fill(0);
    String a = "Autoimmune diseases result from a dysfunction of the immune system. The immune system protects you from disease and infection. Sometimes, though, the immune system can produce autoantibodies that attack healthy cells, tissues, and organs.";
    String b = "The causes of autoimmune diseases remain largely unknown. There is growing consensus that autoimmune diseases likely result from interactions between genetic and environmental factors.";
    String c = "Some autoimmune diseases are life-threatening, and most are debilitating and require a lifetime of treatment.";
    String d = "There are treatments available to reduce the symptoms and effects from many autoimmune diseases, but cures have yet to be discovered.";
    String e = "Researchers have identified 80-100 different autoimmune diseases and suspect at least 40 additional diseases of having an autoimmune basis.";
    String f = "Earlier studies have shown that autoantibodies can develop many years before the clinical appearance of autoimmune diseases. Initial symptoms are often intermittent and unspecific until the disease becomes acute.";
    text(a + "\n\n" + b + "\n\n" + c + "\n\n" + d + "\n\n" + e + "\n\n" + f, 100, 100, 1000, 500);

    text("Please click '2' to continue...", 100, 700, 1000, 100);
  }

  //text for 2nd text screen
  void introB() {
    beginShape();
    fill(245, 245, 0);
    vertex(0, 0);
    fill(0, 110, 240);
    vertex(width, 0);
    fill(220, 10, 10);
    vertex(width, height);
    fill(220, 0, 200);
    vertex(0, height);
    endShape();
    noStroke();
    textAlign(LEFT);
    textFont(font24);
    fill(0);
    String a = "In addition to all physical and medical constraints patients face in a continuum, one very striking effect that such diseases carry over relates to disbelief and disregard.";
    String b = "Since most autoimmune diseases are rare, patients can often spend years seeking a proper diagnosis.";
    String c = "Specialists are generally unaware of interrelationships among the different autoimmune diseases or advances in treatment outside their own specialty area.";
    String d = "Most of those diseases neither provoke visible marks related to common expected traits of a sick person.";
    String e = "Some of the patients don’t get support and understanding within their professional environment. Some face the same treatment within their own family circle.";
    String f = "Most patients turn to hide their emotions and feelings on a search with no results to bear activities and relationships that are close to the ones they used to have prior the outcome of their condition.";
    text(a + "\n\n" + b + "\n\n" + c + "\n\n" + d + "\n\n" + e + "\n\n" + f, 100, 100, 1000, 500);

    text("Please click '3' to continue...", 100, 700, 1000, 100);
  }

  //text for 3rd text screen
  void introC() {
    beginShape();
    fill(245, 245, 0);
    vertex(0, 0);
    fill(0, 110, 240);
    vertex(width, 0);
    fill(220, 10, 10);
    vertex(width, height);
    fill(220, 0, 200);
    vertex(0, height);
    endShape();
    noStroke();
    textAlign(LEFT);
    textFont(font24);
    fill(0);
    String a = "For this project, autoimmune patients were invited and were offered a free space to make visible to the world one of the many invisible marks of such diseases.";
    String b = "They can rate their day and share their own emotions for that day. It ranges from a good day – when symptoms are barely perceived, to a bad day, when a flare burns in its strength. Nevertheless, for those patients, every day is a sick day.";
    String c = "Their emotions float around on how they’ve rated the day – as the daily activities float as their symptoms float every day. The distance to the center is driven for the number of years they carry their condition. Their age controls the size and the speed of their feelings – the younger, the faster and the smaller.";
    text(a + "\n\n" + b + "\n\n" + c, 100, 100, 1000, 500);

    text("Please click 'S' to visualize the emotions of " + source.entries().length + " people.", 100, 600, 1000, 100);
  }

  //intro screen
  void introLogo() {
    smooth();
    beginShape();
    fill(245, 245, 0);
    vertex(0, 0);
    fill(0, 110, 240);
    vertex(width, 0);
    fill(220, 10, 10);
    vertex(width, height);
    fill(220, 0, 200);
    vertex(0, height);
    endShape();
    shape(logo, 280, height/4, 640, 300);
    noStroke();
    textAlign(CENTER);
    fill(0);
    textFont(font24);
    text("Please click '1' to learn more...", width/2, 700);
  }
}