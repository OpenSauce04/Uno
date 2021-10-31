import java.security.*; // Used for custom error throw just in case something goes really wrong

int botHesitation = 0; // The number of frames the bot will wait before making another move

void botPlay() {
  if (max(botHesitation, 0) == 0) {
    boolean ableToPlace = false;
    for (int x = 0; x<botHand.size(); x++) { // Go through the bot's entire hand
      if ((botHand.get(x).colour == placedCard.colour) || (botHand.get(x).number == placedCard.number)) { // If the currently inspected card is placeable: Place it
        placeCard(botHand.get(x));
        botHand.remove(x);
        ableToPlace = true;
        botTurn = false;
        break;
      }
    }

    if (ableToPlace == false) { // The bot has no cards it can place: Pick up
      switch(botHand.size()) {
          case 9:
            // Pull guarenteed placeable card
            botHand.add(generateCard());
            if (round(random(1)) == 1) {
              botHand.get(9).colour = placedCard.colour;
            } else {
              botHand.get(9).number = placedCard.number;
            }
            break;
          case 10:
            throw new InvalidParameterException("The pickup algorithm screwed up; This message should never appear");
          default:
            // Pull card normally
            botHand.add(generateCard());
        }
        botHesitation = 50;
    }
  } else { // The bot is still waiting for it's hesitation window to be over
    botHesitation--;
  }
}
