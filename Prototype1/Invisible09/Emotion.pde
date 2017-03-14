class Emotion {

  XML yourEmotion, yourFeeling;
  //variable to collect data from multiple responses section
  StringList yourSpecialFeeling;
  //variable to store info about emotion responses
  String yourBasicEmotion;
  //variables to check if different feelings for each emotion were selected
  boolean excitement, wonder, pride, peace, relief, amusement, compassion, joy, rejoicing, pleasure;
  boolean anguish, sorrow, grief, despair, misery, hopelessness, helplessness, resignation, distraughtness, discouragement, disappointment;
  boolean fury, bitterness, vengefulness, argumentativeness, exasperation, frustration, annoyance;
  boolean terror, horror, panic, desperation, dread, anxiety, nervousness, trepidation;
  boolean loathing, abhorrence, revulsion, repugnance, distaste, aversion, dislike;
  color dotColor;

  Emotion() {
  }

  void emotionEntry(XML[] fileXML) {
    //calling and getting responses from emotion response column
    for (int i = 0; i < fileXML.length; i++) {
      //calling and getting responses from emotion response column
      yourEmotion = fileXML[i].getChild("gsx:howwouldyoudefineyouremotionsatthismoment");
      yourBasicEmotion = yourEmotion.getContent();
      println(yourBasicEmotion);
      //initiating String List to stores multiple responses from feelings response columns
      yourSpecialFeeling = new StringList();

      //checking if emotion was selected
      if (yourBasicEmotion.equals("Enjoyment")) {


        //if yes, then read the responses to check the feelings associated
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofenjoymenthowwouldyoudefineyourfeelingsnow");
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
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofsadnesshowwouldyoudefineyourfeelingsnow");
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
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofangerhowwouldyoudefineyourfeelingsnow");
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
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionoffearhowwouldyoudefineyourfeelingsnow");
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
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofdisgusthowwouldyoudefineyourfeelingsnow");
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
}