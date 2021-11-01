void drawPlayerHand(ArrayList<Card> cards) {
  for (int x = 0; x < playerCardNo; x++) {
    cards.get(x).drawCard((width/max(playerCardNo, 7)) * x + (cardPadding/2), height - int(playerCardHeight) + int(playerCardHeight)/5); // Draw the card itself
    text(x+1, (width/max(playerCardNo, 7)) * x + (cardPadding/2) + (playerCardWidth/2), height - int(playerCardHeight) + int(playerCardHeight)/5 - 10); // Draw the number pressed to use the card
  }
  
  if (placedCardAnimTimer > 0 || botTurn || win || lose) {
    fill(255, 130);
    rect(0, (height/5)*3, width, (height/5)*2); // Makes the player's cards slightly transparent when they are unable to play
  }
}

void drawBotHand(ArrayList<Card> cards) {
  for (int x = 0; x < botCardNo; x++) {
    cards.get(x).drawCardMystery((width/max(botCardNo, 7)) * x + (cardPadding/2), -int(playerCardHeight)/5); // Draw the card itself
  }
  
  if (!botTurn || win || lose) {
    fill(255, 130);
    rect(0, 0, width, (height/5)*2); // Makes the player's cards slightly transparent when they are unable to play
  }
}
