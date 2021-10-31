void placeCard(Card inputCard) {
  previousPlacedCard = placedCard;
  placedCard = inputCard;
  placedCard.dontScale = true;
  placedCardAnimTimer = 60;
}