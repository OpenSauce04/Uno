void drawHand(ArrayList<Card> cards) {
  for (int x = 0; x < cardNo; x++) {
    cards.get(x).drawCard((width/max(cardNo, 7)) * x + (cardPadding/2), height - int(cardHeight) + int(cardHeight)/5);
  }
}
