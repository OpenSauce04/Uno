void placeCard(Card inputCard) { // Overwrites the placed card and triggers the card placement animation
  previousPlacedCard = placedCard;
  placedCard = inputCard;
  placedCard.dontScale = true;
  placedCardAnimTimer = 60;
}