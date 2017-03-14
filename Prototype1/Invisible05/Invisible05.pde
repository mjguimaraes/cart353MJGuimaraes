//variable to store Google spreadsheet ID
String spreadsheetID;
//variables to store XML data
XML invisible, timestamp, yourCondition, diagnosisPeriod, yourCountry, yourGender, ageGroup, yourDayRate, yourEmotion, yourFeeling;
//variable to collect data from multiple responses section
StringList yourSpecialFeeling;
//variables to store info about bad/good day and emotion
int yourRate;
String badDay, regularDay, goodDay, yourBasicEmotion;
//variables to check if different feelings for each emotion were selected
boolean excitement, wonder, pride, peace, relief, amusement, compassion, joy, rejoicing, pleasure;
boolean anguish, sorrow, grief, despair, misery, hopelessness, helplessness, resignation, distraughtness, discouragement, disappointment;
boolean fury, bitterness, vengefulness, argumentativeness, exasperation, frustration, annoyance;
boolean terror, horror, panic, desperation, dread, anxiety, nervousness, trepidation;
boolean loathing, abhorrence, revulsion, repugnance, distaste, aversion, dislike;


void setup() {
  //calling Google spreadsheet XML responses file
  spreadsheetID = "1zLK2gKb-BaVQATpt5bH1aVI8Imnw24cF3Ss8sDfl_QY";
  invisible = loadXML("https://spreadsheets.google.com/feeds/list/" + spreadsheetID + "/1/public/full");

  //creating a XML Array object to store columns from spreadsheet
  XML[] invResponses = invisible.getChildren("entry");
  //check point to responses - count of entries
  println("Count: " + invResponses.length + " entries");
  println("---------------------------------");

  //reading each entry of the array
  for (int i = 0; i < invResponses.length; i++) {
    
    //calling and getting responses from timestamp response column
    timestamp = invResponses[i].getChild("gsx:timestamp");
    String date = timestamp.getContent().substring(0, 10); //taking just the date stamp, disregarding time
    println(date);

    //calling and getting responses from condition response column
    yourCondition = invResponses[i].getChild("gsx:whichisyourconditioninthecaseyouhavemultiplepleaseselecttheonethatwasfirstidentifieddiagnosed.");
    println(yourCondition.getContent());

    //calling and getting responses from how long for diagnosis response column
    diagnosisPeriod = invResponses[i].getChild("gsx:howlongagodidyouhavetheaboveconditionidentifieddiagnosed");
    println(diagnosisPeriod.getContent());

    //calling and getting responses from country response column
    yourCountry = invResponses[i].getChild("gsx:whichcountryareyoulivingcurrently");
    println(yourCountry.getContent());

    //calling and getting responses from gender response column
    yourGender = invResponses[i].getChild("gsx:whatisyourgender");
    println(yourGender.getContent());

    //calling and getting responses from age response column
    ageGroup = invResponses[i].getChild("gsx:whichisyouragegroup");
    println(ageGroup.getContent());

    //calling and getting responses from day rating response column
    yourDayRate = invResponses[i].getChild("gsx:howwouldyourateyourdaytoday");
    badDay = "Bad day";
    regularDay = "Regular day";
    goodDay = "Good day";
    //responses from spreadsheet return an integer
    yourRate = yourDayRate.getIntContent(); 
    //associate to a string
    if (yourRate == 1) {
      println(yourRate + " - " + badDay);
    } else if (yourRate == 2) {
      println(yourRate + " - " + regularDay);
    } else if (yourRate == 3) {
      println(yourRate + " - " + goodDay);
    } else {
      println("No rate");
    }

    //calling and getting responses from emotion response column
    yourEmotion = invResponses[i].getChild("gsx:howwouldyoudefineyouremotionsatthismoment");
    yourBasicEmotion = yourEmotion.getContent();
    println(yourBasicEmotion);

    //initiating String List to stores multiple responses from feelings response columns
    yourSpecialFeeling = new StringList();

    //checking if emotion was selected
    if (yourBasicEmotion.equals("Enjoyment")) {
      //if yes, then read the responses to check the feelings associated
      yourFeeling = invResponses[i].getChild("gsx:consideringyouremotionofenjoymenthowwouldyoudefineyourfeelingsnow");
      //split multiple responses into different string values in the list
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
      println(yourFeeling.getContent());
      //sequence to check the selected feelings
      if (yourSpecialFeeling.hasValue("Excitement")) {
        excitement = true;
      } else {
        excitement = false;
      }
      if (yourSpecialFeeling.hasValue("Wonder")) {
        wonder = true;
      } else {
        wonder = false;
      }
      if (yourSpecialFeeling.hasValue("Pride")) {
        pride = true;
      } else {
        pride = false;
      }
      if (yourSpecialFeeling.hasValue("Peace")) {
        peace = true;
      } else {
        peace = false;
      }
      if (yourSpecialFeeling.hasValue("Relief")) {
        relief = true;
      } else {
        relief = false;
      }
      if (yourSpecialFeeling.hasValue("Amusement")) {
        amusement = true;
      } else {
        amusement = false;
      }
      if (yourSpecialFeeling.hasValue("Compassion")) {
        compassion = true;
      } else {
        compassion = false;
      }
      if (yourSpecialFeeling.hasValue("Joy")) {
        joy = true;
      } else {
        joy = false;
      }
      if (yourSpecialFeeling.hasValue("Rejoicing")) {
        rejoicing = true;
      } else {
        rejoicing = false;
      }
      if (yourSpecialFeeling.hasValue("Pleasure")) {
        pleasure = true;
      } else {
        pleasure = false;
      }
      //console printing to check
      println("("+ excitement +"|"+ wonder +"|"+ pride +"|"+ peace +"|"+ relief +"|"+ amusement +"|"+ compassion +"|"+ joy +"|"+ rejoicing +"|"+ pleasure +")");
      println("---------------------------------");
    } else if (yourBasicEmotion.equals("Sadness")) {
      yourFeeling = invResponses[i].getChild("gsx:consideringyouremotionofsadnesshowwouldyoudefineyourfeelingsnow");
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
      println(yourFeeling.getContent());
      if (yourSpecialFeeling.hasValue("Anguish")) {
        anguish = true;
      } else {
        anguish = false;
      }
      if (yourSpecialFeeling.hasValue("Sorrow")) {
        sorrow = true;
      } else {
        sorrow = false;
      }
      if (yourSpecialFeeling.hasValue("Grief")) {
        grief = true;
      } else {
        grief = false;
      }
      if (yourSpecialFeeling.hasValue("Despair")) {
        despair = true;
      } else {
        despair = false;
      }
      if (yourSpecialFeeling.hasValue("Misery")) {
        misery = true;
      } else {
        misery = false;
      }
      if (yourSpecialFeeling.hasValue("Hopelessness")) {
        hopelessness = true;
      } else {
        hopelessness = false;
      }
      if (yourSpecialFeeling.hasValue("Helplessness")) {
        helplessness = true;
      } else {
        helplessness = false;
      }
      if (yourSpecialFeeling.hasValue("Resignation")) {
        resignation = true;
      } else {
        resignation = false;
      }
      if (yourSpecialFeeling.hasValue("Distraughtness")) {
        distraughtness = true;
      } else {
        distraughtness = false;
      }
      if (yourSpecialFeeling.hasValue("Discouragement")) {
        discouragement = true;
      } else {
        discouragement = false;
      }
      if (yourSpecialFeeling.hasValue("Disappointment")) {
        disappointment = true;
      } else {
        disappointment = false;
      }
      println("("+ anguish +"|"+ sorrow +"|"+ grief +"|"+ despair +"|"+ misery +"|"+ hopelessness +"|"+ helplessness +"|"+ resignation +"|"+ distraughtness +"|"+ discouragement +"|"+ disappointment +")");
      println("---------------------------------");
    } else if (yourBasicEmotion.equals("Anger")) {
      yourFeeling = invResponses[i].getChild("gsx:consideringyouremotionofangerhowwouldyoudefineyourfeelingsnow");
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
      println(yourFeeling.getContent());
      if (yourSpecialFeeling.hasValue("Fury")) {
        fury = true;
      } else {
        fury = false;
      }
      if (yourSpecialFeeling.hasValue("Bitterness")) {
        bitterness = true;
      } else {
        bitterness = false;
      }
      if (yourSpecialFeeling.hasValue("Vengefulness")) {
        vengefulness = true;
      } else {
        vengefulness = false;
      }
      if (yourSpecialFeeling.hasValue("Argumentativeness")) {
        argumentativeness = true;
      } else {
        argumentativeness = false;
      }
      if (yourSpecialFeeling.hasValue("Exasperation")) {
        exasperation = true;
      } else {
        exasperation = false;
      }
      if (yourSpecialFeeling.hasValue("Frustration")) {
        frustration = true;
      } else {
        frustration = false;
      }
      if (yourSpecialFeeling.hasValue("Annoyance")) {
        annoyance = true;
      } else {
        annoyance = false;
      }
      println("("+ fury +"|"+ bitterness +"|"+ vengefulness +"|"+ argumentativeness +"|"+ exasperation +"|"+ frustration +"|"+ annoyance +")");
      println("---------------------------------");
    } else if (yourBasicEmotion.equals("Fear")) {
      yourFeeling = invResponses[i].getChild("gsx:consideringyouremotionoffearhowwouldyoudefineyourfeelingsnow");
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
      println(yourFeeling.getContent());
      if (yourSpecialFeeling.hasValue("Terror")) {
        terror = true;
      } else {
        terror = false;
      }
      if (yourSpecialFeeling.hasValue("Horror")) {
        horror = true;
      } else {
        horror = false;
      }
      if (yourSpecialFeeling.hasValue("Panic")) {
        panic = true;
      } else {
        panic = false;
      }
      if (yourSpecialFeeling.hasValue("Desperation")) {
        desperation = true;
      } else {
        desperation = false;
      }
      if (yourSpecialFeeling.hasValue("Dread")) {
        dread = true;
      } else {
        dread = false;
      }
      if (yourSpecialFeeling.hasValue("Anxiety")) {
        anxiety = true;
      } else {
        anxiety = false;
      }
      if (yourSpecialFeeling.hasValue("Nervousness")) {
        nervousness = true;
      } else {
        nervousness = false;
      }
      if (yourSpecialFeeling.hasValue("Trepidation")) {
        trepidation = true;
      } else {
        trepidation = false;
      }
      println("("+ terror +"|"+ horror +"|"+ panic +"|"+ desperation +"|"+ dread +"|"+ anxiety +"|"+ nervousness +"|"+ trepidation +")");
      println("---------------------------------");
    } else if (yourBasicEmotion.equals("Disgust")) {
      yourFeeling = invResponses[i].getChild("gsx:consideringyouremotionofdisgusthowwouldyoudefineyourfeelingsnow");
      yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 
      println(yourFeeling.getContent());
      if (yourSpecialFeeling.hasValue("Loathing")) {
        loathing = true;
      } else {
        loathing = false;
      }
      if (yourSpecialFeeling.hasValue("Abhorrence")) {
        abhorrence = true;
      } else {
        abhorrence = false;
      }
      if (yourSpecialFeeling.hasValue("Revulsion")) {
        revulsion = true;
      } else {
        revulsion = false;
      }
      if (yourSpecialFeeling.hasValue("Repugnance")) {
        repugnance = true;
      } else {
        repugnance = false;
      }
      if (yourSpecialFeeling.hasValue("Distaste")) {
        distaste = true;
      } else {
        distaste = false;
      }
      if (yourSpecialFeeling.hasValue("Aversion")) {
        aversion = true;
      } else {
        aversion = false;
      }
      if (yourSpecialFeeling.hasValue("Dislike")) {
        dislike = true;
      } else {
        dislike = false;
      }
      println("("+ loathing +"|"+ abhorrence +"|"+ revulsion +"|"+ repugnance +"|"+ distaste +"|"+ aversion +"|"+ dislike +")");
      println("---------------------------------");
    }
  }
}