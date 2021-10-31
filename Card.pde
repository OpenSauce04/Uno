class Card {
  int number;
  String colour;
  boolean dontScale; // Forces the card to use the "default" variants of width and height; Used exclusively for placed card
  
  int cardTransparency; // Used exclusively for card placement animation
  
  Card (int _number, String _colour, boolean _dontScale) {
    number = _number;
    colour = _colour;
    dontScale = _dontScale;
  }

  void drawCard(int x, int y) {
    switch(colour) {
      case("red"):
        fill(255, 0, 0);
        break;
      case("green"):
        fill(0, 255, 0);
        break;
      case("blue"):
        fill(0, 0, 255);
        break;
      case("yellow"):
        fill(255, 255, 0);
        break;
    }

    float drawWidth, drawHeight, drawCardNo;

    // Check to see if the card should be scaled or not, and apply the appropriate values
    if (!dontScale) {
      drawWidth = cardWidth;
      drawHeight = cardHeight;
      drawCardNo = cardNo;
    } else {
      drawWidth = width/7 - cardPadding;
      drawHeight = drawWidth * 1.4;
      drawCardNo = 7;
    }

    // Card base
    stroke(0);
    rect(x, y, drawWidth, drawHeight, 15); 
    fill(255, 255, 255);

    // White sheared oval thingy in the middle
    stroke(255);
    pushMatrix();
    translate(x+42, y+10);
    shearX(-PI/10.0);
    ellipse(-(max(drawCardNo, 7)-7)*3, 0, drawWidth-20, drawHeight-20); 
    popMatrix();

    // Card number
    fill(0);
    text(number, x + (drawWidth/2), y + (drawHeight/2) + (textSize/4));
  }


  void drawCardPlacementAnim(int x, int y) { // Draws the temporary card used in the fade effect of the card placement animation
    cardTransparency = placedCardAnimTimer * (255/60);
    
    //print(placedCardAnimTimer);
    //print(" " + cardTransparency + " " );
    
    switch(colour) {
      case("red"):
        fill(255, 0, 0, cardTransparency);
        break;
      case("green"):
        fill(0, 255, 0, cardTransparency);
        break;
      case("blue"):
        fill(0, 0, 255, cardTransparency);
        break;
      case("yellow"):
        fill(255, 255, 0, cardTransparency);
        break;
    }
    float drawWidth, drawHeight, drawCardNo;
    // Because this is always used for the card placement animation, it always uses the default card size values
    drawWidth = width/7 - cardPadding;
    drawHeight = drawWidth * 1.4;
    drawCardNo = 7;
    
    // Card base
    stroke(0, cardTransparency);
    rect(x, y, drawWidth, drawHeight, 15);

    // White sheared oval thingy in the middle
    fill(255, 255, 255, cardTransparency);
    stroke(255, cardTransparency);
    pushMatrix();
    translate(x+42, y+10);
    shearX(-PI/10.0);
    ellipse(-(max(drawCardNo, 7)-7)*3, 0, drawWidth-20, drawHeight-20);
    popMatrix();

    // Card number
    fill(0, cardTransparency);
    text(number, x + (drawWidth/2), y + (drawHeight/2) + (textSize/4));
    
    placedCardAnimTimer--;
  }


  void drawCardMystery(int x, int y) { // Basically the same as drawCard() Except it hides the colour and number of the card
    fill(50);
    float drawWidth, drawHeight, drawCardNo;
    if (!dontScale) {
      drawWidth = cardWidth;
      drawHeight = cardHeight;
      drawCardNo = botHand.size(); // Because "cardNo" tracks the PLAYER's card count, we grab the bot's card count directly instead
    } else {
      drawWidth = width/7 - cardPadding;
      drawHeight = drawWidth * 1.4;
      drawCardNo = 7;
    }

    // Card base
    stroke(0);
    rect(x, y, drawWidth, drawHeight, 15);

    // White sheared oval thingy in the middle
    fill(255, 255, 255);
    stroke(255);
    pushMatrix();
    translate(x+42, y+10);
    shearX(-PI/10.0);
    ellipse(-(max(drawCardNo, 7)-7)*3, 0, drawWidth-20, drawHeight-20);
    popMatrix();

    // Card number
    fill(0);
    text('?', x + (drawWidth/2), y + (drawHeight/2) + (textSize/4));
  }
}
