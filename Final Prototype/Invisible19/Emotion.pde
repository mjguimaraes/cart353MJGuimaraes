class Emotion {

  XML[] fileXML, temp;
  XML yourEmotion, yourFeeling;
  //variable to collect data from multiple responses section
  StringList yourSpecialFeeling;
  //variable to store info about emotion responses
  String yourBasicEmotion;
  //variables to check if different feelings for each emotion were selected
  StringList excitement, wonder, pride, peace, relief, amusement, compassion, joy, rejoicing, pleasure;
  StringList anguish, sorrow, grief, despair, misery, hopelessness, helplessness, resignation, distraughtness, discouragement, disappointment;
  StringList fury, bitterness, vengefulness, argumentativeness, exasperation, frustration, annoyance;
  StringList terror, horror, panic, desperation, dread, anxiety, nervousness, trepidation;
  StringList loathing, abhorrence, revulsion, repugnance, distaste, aversion, dislike;

  String[] allEmotions, allFeelings;

  Emotion(XML[] temp) {
    fileXML = temp;
    allEmotions = new String[fileXML.length];
    allFeelings = new String[fileXML.length];

    yourSpecialFeeling = new StringList();

    excitement = new StringList();
    wonder = new StringList();
    pride = new StringList();
    peace = new StringList();
    relief = new StringList();
    amusement = new StringList();
    compassion = new StringList();
    joy = new StringList();
    rejoicing = new StringList();
    pleasure = new StringList();

    anguish = new StringList();
    sorrow = new StringList();
    grief = new StringList();
    despair = new StringList();
    misery = new StringList();
    hopelessness = new StringList();
    helplessness = new StringList();
    resignation = new StringList();
    distraughtness = new StringList();
    discouragement = new StringList();
    disappointment = new StringList();

    fury = new StringList();
    bitterness = new StringList();
    vengefulness = new StringList();
    argumentativeness = new StringList();
    exasperation = new StringList();
    frustration = new StringList();
    annoyance = new StringList();

    terror = new StringList();
    horror = new StringList();
    panic = new StringList();
    desperation = new StringList();
    dread = new StringList();
    anxiety = new StringList();
    nervousness = new StringList();
    trepidation = new StringList();

    loathing = new StringList();
    abhorrence = new StringList();
    revulsion = new StringList();
    repugnance = new StringList();
    distaste = new StringList();
    aversion = new StringList();
    dislike = new StringList();
  }

  void emotionEntry() {

    //calling and getting responses from emotion response column
    for (int i = 0; i < fileXML.length; i++) {
      //calling and getting responses from emotion response column
      yourEmotion = fileXML[i].getChild("gsx:howwouldyoudefineyouremotionsatthismoment");
      yourBasicEmotion = yourEmotion.getContent();

      if (yourEmotion.getContent().equals("")) {
        yourBasicEmotion = "[not defined]"; //checking for blank responses
      }

      //associate all responses to an array
      allEmotions[i] = yourBasicEmotion;

      //initiating String List to stores multiple responses from feelings response columns

      //checking if emotion was selected
      if (yourBasicEmotion.equals("Enjoyment")) {

        //if yes, then read the responses to check the feelings associated
        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofenjoymenthowwouldyoudefineyourfeelingsnow");
        //split multiple responses into different string values in the list
        yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 

        //sequence to check the selected feelings
        if (yourSpecialFeeling.hasValue("Excitement")) {
          excitement.append("Excitement");
        } else if (yourSpecialFeeling.hasValue("Wonder")) {
          wonder.append("Wonder");
        } else if (yourSpecialFeeling.hasValue("Pride")) {
          pride.append("Pride");
        } else if (yourSpecialFeeling.hasValue("Peace")) {
          peace.append("Peace");
        } else if (yourSpecialFeeling.hasValue("Relief")) {
          relief.append("Relief");
        } else if (yourSpecialFeeling.hasValue("Amusement")) {
          amusement.append("Amusement");
        } else if (yourSpecialFeeling.hasValue("Compassion")) {
          compassion.append("Compassion");
        } else if (yourSpecialFeeling.hasValue("Joy")) {
          joy.append("Joy");
        } else if (yourSpecialFeeling.hasValue("Rejoicing")) {
          rejoicing.append("Rejoicing");
        } else if (yourSpecialFeeling.hasValue("Pleasure")) {
          pleasure.append("Pleasure");
        }
        //console printing to check
        //println(excitement.size()+wonder.size()+pride.size()+peace.size()+relief.size()+amusement.size()+compassion.size()+joy.size()+rejoicing.size()+pleasure.size());
      } else if (yourBasicEmotion.equals("Sadness")) {

        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofsadnesshowwouldyoudefineyourfeelingsnow");
        yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 

        if (yourSpecialFeeling.hasValue("Anguish")) {
          anguish.append("Anguish");
        } else if (yourSpecialFeeling.hasValue("Sorrow")) {
          sorrow.append("Sorrow");
        } else if (yourSpecialFeeling.hasValue("Grief")) {
          grief.append("Grief");
        } else if (yourSpecialFeeling.hasValue("Despair")) {
          despair.append("Despair");
        } else if (yourSpecialFeeling.hasValue("Misery")) {
          misery.append("Misery");
        } else if (yourSpecialFeeling.hasValue("Hopelessness")) {
          hopelessness.append("Hopelessness");
        } else if (yourSpecialFeeling.hasValue("Helplessness")) {
          helplessness.append("Helplessness");
        } else if (yourSpecialFeeling.hasValue("Resignation")) {
          resignation.append("Resignation");
        } else if (yourSpecialFeeling.hasValue("Distraughtness")) {
          distraughtness.append("Distraughtness");
        } else if (yourSpecialFeeling.hasValue("Discouragement")) {
          discouragement.append("Discouragement");
        } else if (yourSpecialFeeling.hasValue("Disappointment")) {
          disappointment.append("Disappointment");
        }
      } else if (yourBasicEmotion.equals("Anger")) {

        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofangerhowwouldyoudefineyourfeelingsnow");
        yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 

        if (yourSpecialFeeling.hasValue("Fury")) {
          fury.append("Fury");
        } else if (yourSpecialFeeling.hasValue("Bitterness")) {
          bitterness.append("Bitterness");
        } else if (yourSpecialFeeling.hasValue("Vengefulness")) {
          vengefulness.append("Vengefulness");
        } else if (yourSpecialFeeling.hasValue("Argumentativeness")) {
          argumentativeness.append("Argumentativeness");
        } else if (yourSpecialFeeling.hasValue("Exasperation")) {
          exasperation.append("Exasperation");
        } else if (yourSpecialFeeling.hasValue("Frustration")) {
          frustration.append("Frustration");
        } else if (yourSpecialFeeling.hasValue("Annoyance")) {
          annoyance.append("Annoyance");
        }
      } else if (yourBasicEmotion.equals("Fear")) {

        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionoffearhowwouldyoudefineyourfeelingsnow");
        yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 

        if (yourSpecialFeeling.hasValue("Terror")) {
          terror.append("Terror");
        } else if (yourSpecialFeeling.hasValue("Horror")) {
          horror.append("Horror");
        } else if (yourSpecialFeeling.hasValue("Panic")) {
          panic.append("Panic");
        } else if (yourSpecialFeeling.hasValue("Desperation")) {
          desperation.append("Desperation");
        } else if (yourSpecialFeeling.hasValue("Dread")) {
          dread.append("Dread");
        } else if (yourSpecialFeeling.hasValue("Anxiety")) {
          anxiety.append("Anxiety");
        } else if (yourSpecialFeeling.hasValue("Nervousness")) {
          nervousness.append("Nervousness");
        } else if (yourSpecialFeeling.hasValue("Trepidation")) {
          trepidation.append("Trepidation");
        }
      } else if (yourBasicEmotion.equals("Disgust")) {

        yourFeeling = fileXML[i].getChild("gsx:consideringyouremotionofdisgusthowwouldyoudefineyourfeelingsnow");
        yourSpecialFeeling = new StringList(split(yourFeeling.getContent(), ", ")); 

        if (yourSpecialFeeling.hasValue("Loathing")) {
          loathing.append("Loathing");
        } else if (yourSpecialFeeling.hasValue("Abhorrence")) {
          abhorrence.append("Abhorrence");
        } else if (yourSpecialFeeling.hasValue("Revulsion")) {
          revulsion.append("Revulsion");
        } else if (yourSpecialFeeling.hasValue("Repugnance")) {
          repugnance.append("Repugnance");
        } else if (yourSpecialFeeling.hasValue("Distaste")) {
          distaste.append("Distaste");
        } else if (yourSpecialFeeling.hasValue("Aversion")) {
          aversion.append("Aversion");
        } else if (yourSpecialFeeling.hasValue("Dislike")) {
          dislike.append("Dislike");
        }
      } 

      allFeelings[i] = yourFeeling.getContent();
    }
  }
}