ArrayList<Card> generateHand() {
  ArrayList<Card> returnvar = new ArrayList<Card>();
  for (int x=0; x<7; x++) {
    returnvar.add(generateCard());
  }
  return returnvar;
  // 7 Cards
}
