Card generateCard() {
   return new Card(
      int(random(8))+1, 
      new String[] {"red", "green", "blue", "yellow"}[int(random(4))]
   );
}
