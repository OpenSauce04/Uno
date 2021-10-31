void botPlay() {
  for (int x = 0; x<botHand.size(); x++) {
    if ((botHand.get(x).colour == placedCard.colour) || (botHand.get(x).number == placedCard.number)) {
      placeCard(botHand.get(x));
      botHand.remove(x);
      break;
    }
  }
}
