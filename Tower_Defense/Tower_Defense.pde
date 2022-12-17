/*
Zi Qing Xiong
1-4
October 24, 2022
Project 2 - Tower Defense
*/

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int mode = 0;
final int INTRO = 1;
final int SETTING = 2;
final int MODES = 3;
final int GAME = 4;
final int BUILD = 5;
final int GAMEOVER = 6;
final int INSTRUCTIONS = 7;

//colours ------------------------------------------------------------------------------
color backgroundColour = #97CBF5;
color buttonBorder = #76ADD8;
color buttonBase = #D8F2FF;
color grassMode = #ADD87F;
color choicesGrass = #77A276;
color pathColour = #FAE4A9;

//music --------------------------------------------------------------------------------
Minim minim;
AudioPlayer main;

//mouse and keyboard -------------------------------------------------------------------
boolean mouseReleased;
boolean wasPressed;

//images -------------------------------------------------------------------------------
Image introImage;
Image catBase;

Image gunImage;
Image aoEImage;
Image sniperImage;
Image fighterImage;

Image blob1;
Image blob2;
Image blob3;

Image grinchy;

Image cat1;
Image cat2;
Image cat3;
Image cat4;
Image cat5;
Image cat6;
Image cat7;
Image cat8;
Image cat9;

Image catsLeft1;
Image catsLeft2;
Image catsLeft3;
Image catsLeft4;
Image catsLeft5;
Image catsLeft6;
Image catsLeft7;
Image catsLeft8;

Image map1;
Image map2;

Image extraCat;

//gifs ---------------------------------------------------------------------------------
Gif introGif;

//buttons ------------------------------------------------------------------------------
Button settingsIcon, bgmIcon, sfxIcon;
Button playButton;
Button nextWaveButton;
Button buildButton;

Button left;
Button right;
Button start;
Button map1Button;
Button map2Button;

Button mode1Button;
Button mode2Button;

Button gunButton;
Button aoEButton;
Button sniperButton;
Button warriorButton;

Button wipeout;

Button retryButton;

//objects ------------------------------------------------------------------------------
Node[] nodes = new Node[9];
Node[] nodes1 = new Node[9];
Node[] nodes2 = new Node[9];

ArrayList<Mob> mobs = new ArrayList<Mob>();
ArrayList<Tower> towers = new ArrayList<>();

ArrayList<Gun> guns = new ArrayList<Gun>();
ArrayList<AoE> aoes = new ArrayList<AoE>();
ArrayList<Sniper> snipers = new ArrayList<Sniper>();
ArrayList<Fighter> fighters = new ArrayList<Fighter>();

ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<BigBullet> bigBullets = new ArrayList<BigBullet>();
ArrayList<EnemyBullet> enemyBullets = new ArrayList<>();

//game ---------------------------------------------------------------------------------
int waveCount = 0;
int gameMode = 1;
int catCoins = 0;
boolean towerObtained = false;
int gameLives = 9;
boolean battleMode = false;

//others -------------------------------------------------------------------------------
PFont mainFont;
int currentSlide = 0;

//setup --------------------------------------------------------------------------------
void setup() {
  size(800, 500);
  background(backgroundColour);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);
  
  initializeVariables();
  makeButtons();
  makeNodes();
  makeImages();
  makeGifs();
  
  mode = INTRO;
}

//initialize variables -----------------------------------------------------------------
void initializeVariables() {
  
  //music ------------------------------------------------------------------------------
  minim = new Minim(this);
  
  //others -----------------------------------------------------------------------------
  mainFont = createFont("Milky Coffee.otf", 100);
  
}

//image creations ----------------------------------------------------------------------
void makeImages() {
  introImage = new Image("images/Wave.png", 400, 250, 800, 500);
  catBase = new Image("images/CatBase.png", 512, 340, 175, 175);
  
  gunImage = new Image("images/GunImage.png", 250, 250, 80, 80);
  aoEImage = new Image("images/AoEImage.png", 450, 250, 80, 80);
  sniperImage = new Image("images/SniperImage.png", 350, 360, 80, 80);
  fighterImage = new Image("images/FighterImage.png", 550, 360, 80, 80);
  
  blob1 = new Image("images/Blob1.png", 250, 290, 100, 100);
  blob2 = new Image("images/Blob2.png", 400, 310, 100, 100);
  blob3 = new Image("images/Blob3.png", 550, 290, 100, 100);
  
  grinchy = new Image("Cats/Cat1.png", 280, 360, 180, 180);
  cat1 = new Image("Cats/Cat1.png", 250, 250, 70, 70);
  cat2 = new Image("Cats/Cat2.png", 350, 250, 70, 70);
  cat3 = new Image("Cats/Cat3.png", 450, 250, 70, 70);
  cat4 = new Image("Cats/Cat4.png", 550, 250, 70, 70);
  
  cat5 = new Image("Cats/Cat5.png", 200, 360, 70, 70);
  cat6 = new Image("Cats/Cat6.png", 300, 360, 70, 70);
  cat7 = new Image("Cats/Cat7.png", 400, 360, 70, 70);
  cat8 = new Image("Cats/Cat8.png", 500, 360, 70, 70);
  cat9 = new Image("Cats/Cat9.png", 600, 360, 70, 70);
  
  extraCat = new Image("Cats/Cat9.png", 752, 370, 47, 47);
  
  catsLeft1 = new Image("images/CatLeft1.png", 700, 315, 150, 150);
  catsLeft2 = new Image("images/CatLeft2.png", 700, 315, 150, 150);
  catsLeft3 = new Image("images/CatLeft3.png", 700, 315, 150, 150);
  catsLeft4 = new Image("images/CatLeft4.png", 700, 315, 150, 150);
  catsLeft5 = new Image("images/CatLeft5.png", 700, 315, 150, 150);
  catsLeft6 = new Image("images/CatLeft6.png", 700, 315, 150, 150);
  catsLeft7 = new Image("images/CatLeft7.png", 700, 315, 150, 150);
  catsLeft8 = new Image("images/CatLeft8.png", 700, 315, 150, 150);
  
  map1 = new Image("images/Map1.png", 270, 270, 170, 170);
  map2 = new Image("images/Map2.png", 530, 270, 170, 170);
}

//gif creations ------------------------------------------------------------------------
void makeGifs() {
  //name x, y, w, h
  introGif = new Gif("introGif/frame_", "_delay-0.01s.gif", 630, 350, 330, 330, 3, 0.01);
}

//button creations ---------------------------------------------------------------------
void makeButtons() {
  //Button(x, y, w, h, cornerSize, baseColour, borderColour, highlightColour, text/image);
  settingsIcon = new Button(750, 40, 40, 40, 5, buttonBase, buttonBase, "set", 20, "settings");
  bgmIcon = new Button(700, 40, 40, 40, 5, buttonBase, buttonBase, "set", 20, "sfx");
  sfxIcon = new Button(650, 40, 40, 40, 5, buttonBase, buttonBase, "set", 20, "bgm");
  
  left = new Button(80, 280, 100, 200, 20, buttonBase, backgroundColour, "back", 30);
  right = new Button(720, 280, 100, 200, 20, buttonBase, backgroundColour, "next", 30);
  
  start = new Button(710, 40, 140, 50, 10, buttonBase, backgroundColour, "START", 30);
  mode1Button = new Button(270, 300, 200, 60, 20, buttonBase, backgroundColour, "normal mode", 30);
  mode2Button = new Button(530, 300, 200, 60, 20, buttonBase, backgroundColour, "battle mode", 30);
 
  playButton = new Button(310, 335, 250, 200, 30, buttonBase, buttonBorder, "PLAY", 70);
  
  nextWaveButton = new Button(700, 450, 150, 75, 10, buttonBase, buttonBorder, "Next wave", 25);
  buildButton = new Button(700, 150, 150, 75, 10, buttonBase, buttonBorder, "Build mode", 25);
  
  map1Button = new Button(270, 380, 200, 60, 20, buttonBase, buttonBorder, "map 1", 30);
  map2Button = new Button(530, 380, 200, 60, 20, buttonBase, buttonBorder, "map 2", 30);
  
  gunButton = new Button(660, 255, 70, 80, 10, buttonBase, buttonBorder, "gun", 20);
  aoEButton = new Button(740, 255, 70, 80, 10, buttonBase, buttonBorder, "AoE", 20);
  sniperButton = new Button(660, 345, 70, 80, 10, buttonBase, buttonBorder, "sniper", 20);
  warriorButton = new Button(740, 345, 70, 80, 10, buttonBase, buttonBorder, "fighter", 20);
  
  wipeout = new Button(530, 30, 100, 30, 2, buttonBase, buttonBorder, "wipeout", 20);
  
  retryButton = new Button(550, 350, 225, 150, 30, buttonBase, buttonBorder, "TRY \n AGAIN", 50);
}

//node creations -----------------------------------------------------------------------
void makeNodes() {
  nodes1[0] = new Node(-50, 200, 1, 0);
  nodes1[1] = new Node(100, 200, 0, 1);
  nodes1[2] = new Node(100, 400, 1, 0);
  nodes1[3] = new Node(250, 400, 0, -1);
  nodes1[4] = new Node(250, 100, 1, 0);
  nodes1[5] = new Node(500, 100, 0, 1);
  nodes1[6] = new Node(500, 200, -1, 0);
  nodes1[7] = new Node(350, 200, 0, 1);
  nodes1[8] = new Node(350, 350, 1, 0);
  
  nodes2[0] = new Node(-50, 200, 1, 0);
  nodes2[1] = new Node(100, 200, 0, -1);
  nodes2[2] = new Node(100, 50, 1, 0);
  nodes2[3] = new Node(500, 50, 0, 1);
  nodes2[4] = new Node(500, 150, -1, 0);
  nodes2[5] = new Node(300, 150, 0, 1);
  nodes2[6] = new Node(300, 450, -1, 0);
  nodes2[7] = new Node(150, 450, 0, -1);
  nodes2[8] = new Node(150, 350, 1, 0);
  
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = nodes1[i];
  }
}

//draw ---------------------------------------------------------------------------------
void draw() {
  clicks();
  if (mode == INTRO) 
    intro();
  else if (mode == SETTING) 
    setting();
  else if (mode == MODES)
    modes();
  else if (mode == GAME) 
    game();
  else if (mode == BUILD)
    build();
  else if (mode == GAMEOVER) 
    gameover();
  else if (mode == INSTRUCTIONS)
    instructions();
  else 
    println("Error: Mode = " + mode);
  
  icons();
}

//show buttons -------------------------------------------------------------------------
void buttonChange(Button buttonNew, int modeChange) {
  buttonNew.show();
  if (modeChange != 0 && buttonNew.getClicked()) {
    mode = modeChange;
  }
}

//icons --------------------------------------------------------------------------------
void icons() {
  //buttonChange(settingsIcon, 2);
  //sfxIcon.show();
  //bgmIcon.show();
  
  fill(255);
  textFont(mainFont);
  textSize(20);
  text("cat coins = $" + catCoins, 75, 20);
}
