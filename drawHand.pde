void drawHand(ArrayList<Card> cards) {
  for (int x = 0; x < cardNo; x++) {
    cards.get(x).drawCard((width/max(cardNo, 7)) * x + (cardPadding/2), height - int(cardHeight) + int(cardHeight)/5); // Draw the card itself
    text(x+1, (width/max(cardNo, 7)) * x + (cardPadding/2) + (cardWidth/2), height - int(cardHeight) + int(cardHeight)/5 - 10); // Draw the number pressed to use the card
  }
}
