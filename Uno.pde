int cardPadding = 1;
float cardWidth;
float cardHeight;
int textSize = 60;

Card card = new Card(36,"yellow");
void setup() {
  size(1200,800);
  frameRate(60);
  ellipseMode(CORNER);
  textAlign(CENTER);
  textSize(textSize);

  cardWidth = width/7 - cardPadding;
  cardHeight = cardWidth*1.4;
}

void draw() {
  card.drawCard(100,100);
}
