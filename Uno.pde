int cardPadding = 20;
float cardWidth;
float cardHeight;
int cardNo;
int textSize = 60;
Card placedCard = generateCard();
ArrayList<Card> playerHand = generateHand();
void setup() {
  size(1200, 800, P2D);
  frameRate(60);
  ellipseMode(CORNER);
  textAlign(CENTER);
  textSize(textSize);
}

void draw() {
  cardNo = playerHand.size();
  cardWidth = width/max(cardNo, 7) - cardPadding;
  cardHeight = cardWidth * 1.4;

  background(255);
  drawHand(playerHand);
  fill(200);
  stroke(0);
  placedCard.drawCard(int(width/2 - cardWidth/2), int(height/2 - cardHeight/2));
}

void keyReleased() {
  try {
    int(str(key));
    if ( (playerHand.get(int(str(key))-1).colour == placedCard.colour) || (playerHand.get(int(str(key))-1).number == placedCard.number) ) {
      placedCard = playerHand.get(int(str(key))-1);
      playerHand.remove(int(str(key))-1);
    }
  } catch(Exception e) {print(e);}
  if (key==' ') {
    playerHand.add(generateCard());
  }
}
