float [] DaysInMonth={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
String [] NameMonth={"January","February","March","April","May","June","July","August","September","October","November","December"};
String [] NameDays={"Monday","Tuesday","Weednesday","Thursday","Friday","Saturday","Sunday"};
float [] Vis_Fact={0.4, 0.45, 0.5, 0.55, 0.6};
float [][] Vis_Col={{255, 10, 200}, {0, 25, 255}, {0, 255, 50}, {255, 255, 25}, {255, 25, 0}};


String check(int val){
  if(val<10){
     return ( "0"+String.valueOf(val));
  }
  else{ 
     return(String.valueOf(val));
  }
  
}

int SakamotoAlgorithm(int y, int m,int d){
  int [] LeadNum={ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };
  if(m<3){
    y-=1;
  }
  return ((y + y / 4 - y / 100 + y / 400 + LeadNum[m - 1] + d) % 7); 
  
}

void setup() {
  size(900, 900);
  frameRate(1);
}
void draw() {

  clear();
  background(0);

  float ArcSrtP=radians(-90);
  float ColOfst=-75;

  String d,m,s,min,h, dayName;
  String txt1, txt2;
  
   
  
  
  d=check(day());
  m=check(month());
  s=check(second());
  min=check(minute());
  h=check(hour());
    
  dayName=NameDays[SakamotoAlgorithm(year(),month(),day())-1];

txt1=h+" : "+min+" : "+s;
txt2=d+" / "+m;

  println(dayName);
  println(txt2+" / "+year());



  textSize(18); // size offset 
  fill(255);
  text("Oriol Pascual Oliver", width-195, height-40);
  text("OPOTeK Clock", width-150, height-20); 




  //Setup
  noFill();
  strokeCap(ROUND);
  strokeWeight(3);
  //month

  stroke(Vis_Col[0][0]+ColOfst, Vis_Col[0][1]+ColOfst, Vis_Col[0][2]-75);
  ellipse(width/2, height/2, width*Vis_Fact[0], height*Vis_Fact[0]);
  //day

  stroke(Vis_Col[1][0]+ColOfst, Vis_Col[1][1]+ColOfst, Vis_Col[1][2]-75);
  ellipse(width/2, height/2, width*Vis_Fact[1], height*Vis_Fact[1]);
  //hour

  stroke(Vis_Col[2][0]+ColOfst, Vis_Col[2][1]+ColOfst, Vis_Col[2][2]-75);
  ellipse(width/2, height/2, width*Vis_Fact[2], height*Vis_Fact[2]);
  //minute

  stroke(Vis_Col[3][0]+ColOfst, Vis_Col[3][1]+ColOfst, Vis_Col[3][2]-75);
  ellipse(width/2, height/2, width*Vis_Fact[3], height*Vis_Fact[3]);
  //sec

  stroke(Vis_Col[4][0]+ColOfst, Vis_Col[4][1]+ColOfst, Vis_Col[4][2]-75);
  ellipse(width/2, height/2, width*Vis_Fact[4], height*Vis_Fact[4]);  


  //Arcs
  strokeWeight(10);
  stroke(255);
  //month
  stroke(Vis_Col[0][0], Vis_Col[0][1], Vis_Col[0][2]);
  arc(width/2, height/2, width*Vis_Fact[0], height*Vis_Fact[0], ArcSrtP, radians(map(month(), 0, 12, -90, 360-90)));

  //day
  stroke(Vis_Col[1][0], Vis_Col[1][1], Vis_Col[1][2]);
  arc(width/2, height/2, width*Vis_Fact[1], height*Vis_Fact[1], ArcSrtP, radians(map(day(), 0, DaysInMonth[month()-1], -90, 360-90)));

  //hour
  stroke(Vis_Col[2][0], Vis_Col[2][1], Vis_Col[2][2]);
  arc(width/2, height/2, width*Vis_Fact[2], height*Vis_Fact[2], ArcSrtP, radians(map(hour(), 0, 24, -90, 360-90))); //falla algo

  //minute
  stroke(Vis_Col[3][0], Vis_Col[3][1], Vis_Col[3][2]);
  arc(width/2, height/2, width*Vis_Fact[3], height*Vis_Fact[3], ArcSrtP, radians(map(minute(), 0, 60, -90, 360-90)));

  //sec
  stroke(Vis_Col[4][0], Vis_Col[4][1], Vis_Col[4][2]);
  arc(width/2, height/2, width*Vis_Fact[4], height*Vis_Fact[4], ArcSrtP, radians(map(second(), 0, 60, -90, 360-90)));


  // txt  

  textSize(width*40/1000); // size offset 1
    fill(255,255,255);
  text(txt2, width/2 -72, height/2 -106); 
    text(dayName+", "+NameMonth[month()+1], width/2 -164, height/2 -33); 
    text(year(), width/2+-55, height/2+126);
    textSize(width*56/1000); // size offset 1
  text(txt1, width/2+-150, height/2+52);
  
}
