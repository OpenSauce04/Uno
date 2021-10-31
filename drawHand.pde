void drawPlayerHand(ArrayList<Card> cards) {
  for (int x = 0; x < cardNo; x++) {
    cards.get(x).drawCard((width/max(cardNo, 7)) * x + (cardPadding/2), height - int(cardHeight) + int(cardHeight)/5); // Draw the card itself
    text(x+1, (width/max(cardNo, 7)) * x + (cardPadding/2) + (cardWidth/2), height - int(cardHeight) + int(cardHeight)/5 - 10); // Draw the number pressed to use the card
  }
  
  if (placedCardAnimTimer > 0 || botTurn || win || lose) {
    fill(255, 130);
    rect(0, (height/5)*3, width, (height/5)*2); // Makes the player's cards slightly transparent when they are unable to play
  }
}

void drawBotHand(ArrayList<Card> cards) {
  for (int x = 0; x < botHand.size(); x++) {
    cards.get(x).drawCardMystery((width/max(botHand.size(), 7)) * x + (cardPadding/2), -int(cardHeight)/5); // Draw the card itself
  }
  
   if (!botTurn || win || lose) {
    fill(255, 130);
    rect(0, 0, width, (height/5)*2); // Makes the player's cards slightly transparent when they are unable to play
  }
}
