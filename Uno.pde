int cardPadding = 20;
float cardWidth;
float cardHeight;
int textSize = 60;
Card[] playerHand = {new Card(1, "red"), new Card(3, "yellow")};
void setup() {
  size(1200,800);
  frameRate(60);
  ellipseMode(CORNER);
  textAlign(CENTER);
  textSize(textSize);

  cardWidth = width/7 - cardPadding;
  cardHeight = cardWidth*1.4;
}

void draw() {
  drawHand(playerHand);
}
