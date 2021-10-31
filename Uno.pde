int cardPadding = 20;
float cardWidth, cardHeight, defaultCardWidth, defaultCardHeight; // The default card height and width are used exclusively for the placed card
float t;
int cardNo; // "Card Number")
int textSize = 60;
Card placedCard = generateCard();
Card previousPlacedCard = placedCard; // Used exclusively for the card placement animation
int placedCardAnimTimer = 0; // Fadeout timer used for placement animation and for bot behaviour delay; Unit is frames
ArrayList<Card> playerHand = generateHand();
ArrayList<Card> botHand = generateHand();
boolean win = false;
boolean lose = false;
boolean botTurn = false;
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
  drawPlayerHand(playerHand);
  drawBotHand(botHand);
  fill(200);
  stroke(0);
  if (botHand.size()==0) {
    lose = true;
  }
  if ((cardNo != 0)) {
    if (!lose) {
      placedCard.drawCard(int(width/2 - defaultCardWidth/2), int(height/2 - defaultCardHeight/2));
    }
  } else {
    win = true;
  }
  previousPlacedCard.drawCardPlacementAnim(int(width/2 - defaultCardWidth/2), int(height/2 - defaultCardHeight/2));
  
  if (botTurn && placedCardAnimTimer <= -60) {
    botPlay();
  }
  if (win && !lose) {
    fill(0);
    text("You Win!", width/2, height/2);
  } else {
    if (lose) {
      fill(150, 0, 0);
      text("You Lose!", width/2, height/2);
    }
  }
}

void keyReleased() {
  if (!win && !lose && !botTurn && placedCardAnimTimer <= 0) { // If the player should be able to actually control the game
    try {
      if (int(str(key)) != 0) {
        if ( (playerHand.get(int(str(key))-1).colour == placedCard.colour) || (playerHand.get(int(str(key))-1).number == placedCard.number) ) {
          placeCard(playerHand.get(int(str(key))-1));
          playerHand.remove(int(str(key))-1);
          botTurn = true;
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
    } catch(Exception e) {print(e+'\n');} // The player pressed the key for a card that they don't have; Do nothing 
    if (key==' ') { // Pick up a card
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

    //if (key=='`') { // Debug stuff ignore this
    //  playerHand.remove(0);
    //}
    //if (key=='#') {
    //  botHand.remove(0);
    //}
  }
}
