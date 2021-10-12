int cardPadding = 20;
float cardWidth;
float cardHeight;
int cardNo = 7; // Used for the number of cards; exclusively used for scaling purposes and has a minimum value of 7
int textSize = 60;
Card placedCard = generateCard();
Card[] playerHand = generateHand();
void setup() {
  size(1200, 800);
  frameRate(60);
  ellipseMode(CORNER);
  textAlign(CENTER);
  textSize(textSize);

  cardWidth = width/cardNo - cardPadding;
  cardHeight = cardWidth * 1.4;
}

void draw() {
  background(255);
  drawHand(playerHand);
  fill(200);
  stroke(0);
  placedCard.drawCard(int(width/2 - cardWidth/2), int(height/2 - cardHeight/2));
}
