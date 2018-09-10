// "avoid the wedge over time - "game" - version 1 september 9, 2018, Daniel J Heller


int t;

int speed;

int c;

long score;

String[] pithys = {"", "", "a stitch in time saves nine", "time waits for no one", "just in time", "the time to act is now", "time heals all wounds", "party time!", "", ""};

void setup() {

  size(displayWidth, displayHeight);

  t = 0;

  c = 0;

  score = 0;

  speed = 1;
}


void draw() {



  if ( c > 9000 ) {

    startOver();
  }


  if ( c == 8000 ) {


    score = score + 100000000000L;
  }


  if ( t == displayHeight/2 ) {

    score = score + 10;
  }

  noStroke();

  //background(200, 200, 0);

  background(0, 0, 200);

  if ( t > displayHeight + 300) {

    speed = -speed;
  }

  triangle(displayWidth/2, displayHeight/2, 

    0, t, displayWidth, t);

  t = t + speed;

  c = c + 1;

  if (mousePressed) {
    t = t - 2*Math.abs(speed);
  }

  if (t < displayHeight && t > 0 && t%500 == 0) {

    score = score + c + (int)(speed/10);
  }

  //fill(0);

  textSize(44);

  text("speed: " + speed, 50, 50);

  text("time: " + (int)(c/1000), displayWidth/2 - 25, 50);

  text("score: " + score, displayWidth/2 + 300, 50);

  for (int i=1; i<((int)c/1000)+1; i++) {

    text(pithys[i], 50, 50 + i*80);
  }
}

void keyPressed() {

  if (key == 'r') {
    startOver();
  }

  if (key == 's') {
    speed = speed * 2;
  }
}

void startOver() {

  t = 0;

  c = 0;

  score = 0;

  speed = 1;
}
