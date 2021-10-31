import java.security.*;

void botPlay() {
  boolean ableToPlace = false;
  for (int x = 0; x<botHand.size(); x++) {
    if ((botHand.get(x).colour == placedCard.colour) || (botHand.get(x).number == placedCard.number)) {
      placeCard(botHand.get(x));
      botHand.remove(x);
      ableToPlace = true;
      botTurn = false;
      break;
    }
  }
  
  if (ableToPlace == false) {
    switch(botHand.size()) {
        case 9:
          // Draw guarenteed placeable card
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
          // Draw card normally
          botHand.add(generateCard());
      }
  }
}
