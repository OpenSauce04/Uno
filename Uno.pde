int cardPadding = 20;
float cardWidth, cardHeight, defaultCardWidth, defaultCardHeight;
float t;
int cardNo;
int textSize = 60;
Card placedCard = generateCard();
ArrayList<Card> playerHand = generateHand();
ArrayList<Card> botHand = generateHand();
boolean win = false;
void setup() {
  size(1200, 800, P2D);
  frameRate(60);
  ellipseMode(CORNER);
  textAlign(CENTER);
  textSize(textSize);
  
  defaultCardWidth = width/max(cardNo, 7) - cardPadding;
  defaultCardHeight = defaultCardWidth * 1.4;
  placedCard.dontScale = true;
}

void draw() {
  cardNo = playerHand.size();
  cardWidth = width/max(cardNo, 7) - cardPadding;
  cardHeight = cardWidth * 1.4;

  background(255);
  drawHand(playerHand);
  fill(200);
  stroke(0);
  if (cardNo != 0) {
    placedCard.drawCard(int(width/2 - defaultCardWidth/2), int(height/2 - defaultCardHeight/2));
  } else {
    win = true;
  }

  if (win) {
    fill(0);
    text("You Win!", width/2, height/2);
  }
}

void keyReleased() {
  if (!win) {
    try {
      int(str(key));
      if (int(str(key)) != 0) {
        if ( (playerHand.get(int(str(key))-1).colour == placedCard.colour) || (playerHand.get(int(str(key))-1).number == placedCard.number) ) {
          placedCard = playerHand.get(int(str(key))-1);
          placedCard.dontScale = true;
          playerHand.remove(int(str(key))-1);
        }
      } else { // 0 key = 10th card
        if (key!=' ') {
          if ( (playerHand.get(10-1).colour == placedCard.colour) || (playerHand.get(10-1).number == placedCard.number) ) {
            placedCard = playerHand.get(10-1); // 10-1 is just being used for readability
            placedCard.dontScale = true;
            playerHand.remove(10-1);
          }
        }
      }
    } catch(Exception e) {print(e);}
    if (key==' ') {
      switch(cardNo) {
        case 9:
          // Draw guarenteed placeable card
          playerHand.add(generateCard());
          if (round(random(1)) == 1) {
            playerHand.get(9).colour = placedCard.colour;
          } else {
            playerHand.get(9).number = placedCard.number;
          }
          break;
        case 10:
          // Draw no card
          break;
        default:
          // Draw card normally
          playerHand.add(generateCard());
      }
    }
    if (key=='`') {
      playerHand.remove(0);
    }
  }
}
