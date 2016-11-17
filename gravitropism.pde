

int h=500;  //height
int w=500;  //width

int n=1000; //nombre d'éléments sur la ligne

float t=0;
float dt=.001;
float cp=10;
float tm=1./cp;//0.6;
float tmA=1.5;
float tmC=1.5;
float tvideo=2000*dt;
int T=0;
int Tm=int(tm/dt);
int TmA=int(tmA/dt);
int TmC=int(tmC/dt);
float L0=30;
float L=1*L0;
int fading=255;
float[] gr={-1,32,-1,32};
float[] grC={0,1,-1,1};
float[] grgC={0,20,-1,1};
int modec=0;
int wri=1;
int wrif=0;
float tlim=1*tvideo;

float v=L/tm;
float[] Atip= new float[Tm];
float Atip2;
float[][] Apast= new float[n][TmA];
float[][] Cpast= new float[n][TmC];
float Al=PI;
float A0=PI/2;

Skel[] skel = new Skel[n];


PrintWriter Ctxt;
PrintWriter Atxt;
PrintWriter DCtxt;
PrintWriter ptxt;
PrintWriter dtxt;
PrintWriter gtxt;
PrintWriter stxt;

PrintWriter Attxt;

void setup() {
  size(1000,1000);
  background(0);
  colorMode(HSB);
  smooth();
  

  
  float ds0=L/(float)n;
  float g0=1;
  if (wri==1)
  {
    Ctxt = createWriter("C.txt");
    Atxt = createWriter("A.txt");
    ptxt = createWriter("p.txt");
    DCtxt = createWriter("DC.txt");
    dtxt = createWriter("d.txt");
    gtxt = createWriter("g.txt");
    stxt = createWriter("s.txt");
    float ds=(float)L/(float)n;
    ptxt.print(dt + "\t"+ds+"\n");    
    ptxt.flush(); // Writes the remaining data to the file
    ptxt.close(); // Finishes the 
  }
  
  if (wri==2)
  {
    Attxt = createWriter("Atip040.txt");
  }
  

  for(int i=0; i<skel.length ; i++) {
    
    float y0=i*ds0*cos(A0);
    float x0=i*ds0*sin(A0);
    float s0=i*ds0;
   float C0=0;
    skel[i]= new Skel(A0,x0,y0,ds0,s0,g0,C0);
    if (wri==1)
    {
      skel[i].write();
    }
    
  fill(255,255);//fading);
  noStroke();
  rect(0,0,width,height);
  }
//fichier vidéo

//fichier vidéo               
}

void draw() {
  print(t);
  print('\n');
  noStroke();
  //strokeWeight(5);
  fill(255,fading);
  rect(0,0,width,height);
  
  aff();
  //affSC(.5,1);
  //affC();
  //affA();
  if (wri==1)
  {
    writ();
  }
  
  if (wri==2)
  {
    Attxt.print(t + "\t"+skel[skel.length-1].A+"\n");    
  }
  //affgC();
  //affSC(0.25,1); fading=0;
  sens();
  t+=dt;
  T++;
  
  if (t>tlim && wri==1)
  {
      Atxt.flush(); // Writes the remaining data to the file
      Atxt.close(); // Finishes the file
      Ctxt.flush(); // Writes the remaining data to the file
      Ctxt.close(); // Finishes the 
      DCtxt.flush(); // Writes the remaining data to the file
      DCtxt.close(); // Finishes the    
      dtxt.flush(); // Writes the remaining data to the file
      dtxt.close(); // Finishes th
      gtxt.flush(); // Writes the remaining data to the file
      gtxt.close(); // Finishes the
      stxt.flush(); // Writes the remaining data to the file
      stxt.close(); // Finishes the
      exit(); // Stops the program
  }
  
  if (t>tlim && wri==2)
  {
      Attxt.flush(); // Writes the remaining data to the file
      Attxt.close(); // Finishes the file

      exit(); // Stops the program
  }
  if (t<tvideo && wrif==1)  
  {saveFrame("./07/pic-####.png");}
}