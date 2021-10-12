class Card {
  int number;
  String colour;
  Card (int _number, String _colour) {
    number = _number;
    colour = _colour;
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
    stroke(0);
    rect(x, y, cardWidth, cardHeight, 15);
    fill(255, 255, 255);
    stroke(255);
    ellipse(x+10, y+10, cardWidth-20, cardHeight-20);
    fill(0);
    text(number, x + (cardWidth/2), y + (cardHeight/2) + (textSize/4));
  }
}
