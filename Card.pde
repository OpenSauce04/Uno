class Card {
  int number;
  String colour;
  boolean dontScale;
  
  int cardTransparency;
  
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
    if (!dontScale) {
      drawWidth = cardWidth;
      drawHeight = cardHeight;
      drawCardNo = cardNo;
    } else {
      drawWidth = width/7 - cardPadding;
      drawHeight = drawWidth * 1.4;
      drawCardNo = 7;
    }
    stroke(0);
    rect(x, y, drawWidth, drawHeight, 15);
    fill(255, 255, 255);
    stroke(255);
    pushMatrix();
    translate(x+42, y+10);
    shearX(-PI/10.0);
    ellipse(-(max(drawCardNo, 7)-7)*3, 0, drawWidth-20, drawHeight-20);
    popMatrix();
    fill(0);
    text(number, x + (drawWidth/2), y + (drawHeight/2) + (textSize/4));
  }



  void drawCardPlacementAnim(int x, int y) {
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
    if (!dontScale) {
      drawWidth = cardWidth;
      drawHeight = cardHeight;
      drawCardNo = cardNo;
    } else {
      drawWidth = width/7 - cardPadding;
      drawHeight = drawWidth * 1.4;
      drawCardNo = 7;
    }
    stroke(0, cardTransparency);
    rect(x, y, drawWidth, drawHeight, 15);
    fill(255, 255, 255, cardTransparency);
    stroke(255, cardTransparency);
    pushMatrix();
    translate(x+42, y+10);
    shearX(-PI/10.0);
    ellipse(-(max(drawCardNo, 7)-7)*3, 0, drawWidth-20, drawHeight-20);
    popMatrix();
    fill(0, cardTransparency);
    text(number, x + (drawWidth/2), y + (drawHeight/2) + (textSize/4));
    
    placedCardAnimTimer--;
  }
}
