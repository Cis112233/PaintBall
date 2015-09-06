int screenh=540;
int screenw=360;
int points=0;
int choice=0;
int highScore=0;
float ballsize;
int clk=0;
int clrv;
float Timer=0;
float sc=1;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
boolean randomClrGen=false;
boolean bd=false;
boolean dead=false;
color bclr;
String mode="Menu";

void setup(){//run once
//size(screen.height,screen.width);
pushMatrix();
scale(screenw/360,screenh/540);
size(screenw,screenh);
ballsize=10;
points=0;
 a=loadImage("Blue1.png");
 b=loadImage("Red1.png");
 c=loadImage("Yellow1.png");
 d=loadImage("Green1.png");
 e=loadImage("Background.png");
 noLoop();
}

void draw(){
if(clk!=0)print("Click"+clk);
  clk=0;
  if(mode=="Menu"){
  image(e,0,0);
  fill(0,255,0);
  textSize(25);
  text("High Score: "+highScore,10,500);
  rect(0,90,1000,50);
  rect(0,190,1000,50);
  textSize(50);
  fill(0);
  text("Play",140,130);
  text("Credits",100,230);
  if(mouseY>90&&mouseY<140&&mode=="Menu")mode="GS";
  
  }
  if(mode=="Credits"){
  image(e,0,0);
  fill(0,255,0);
  text("Credits:",30,30);
  }
  if(mode=="GS"){
    image(e,0,0);
    dead=false;
    ballsize=10;
    bd=false;
    points=0;
    sc=1;
    clk=0;
    choice=0;
    Timer=0;
    mode="Game";
  }
  if(mode=="Game"){
 // frameRate(10);
image(e,0,0); 
image(a,315,0);
image(b,0,0);
image(c,0,0);
image(d,0,495);
if(points>highScore)highScore=points;
  if(randomClrGen==false){
  clrv=round(random(1,4));
  randomClrGen=true;
  }
  if(clrv==1){
  bclr=color(255,80,64);
}
  if(clrv==2){
  bclr=color(42,216,158);
}
  if(clrv==3){
  bclr=color(77,166,255);
}
  if(clrv==4){
  bclr=color(229,230,50);
}
  if(bd==false){
  fill(bclr);
  ellipse(screenw/2,screenh/2,ballsize,ballsize);

}
  if(dead==false){
ballsize=ballsize+sc;
}
  if(ballsize>=(sc+25)*5){
dead=true;
mode="Menu";
//print("dead by time");
}
  fill(255);
  textSize(20);
  text("Score:"+points,screenw/2-40,40);
  if(mouseX<45&&mouseY>45&&mouseY<495&&clrv==4){
  choice=4;
  clk=0;
  print(1);
}
  if(mouseX>45&&mouseY<45&&mouseX<315&&clrv==1){
  choice=1;
  clk=0;
 print(1); 
}
  if(mouseX>315&&mouseY>45&&mouseY<495&&clrv==3){
  choice=3;
  clk=0;
  print(1);
}
  if(mouseX>45&&mouseY>495&&mouseX<315&&clrv==2){
  choice=2;
  clk=0;
  print(1);
}
  if(choice>0&&choice==clrv){
  Timer=0;
  ballsize=10;
  clk=0;
  points=points+1;
  print(points);
  sc=sc+0.1;
  randomClrGen=false;
  choice=0;
}
  if(choice>0&&choice!=clrv){
  mode="Menu";
  dead=true;
  print("dead");
}
}
loop();
}
