void drawHand(Card[] cards) {
  for (int x=0; x<cards.length; x++) {
    cards[x].drawCard((width/7)*x + (cardPadding/2), height - int(cardHeight) - 100);
  }
}
