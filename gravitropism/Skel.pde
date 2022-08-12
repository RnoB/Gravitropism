class Skel {
  
  float x,y;
  float C;
  float dC;
  float gC=0;
  float[] Cp=new float[Tm];
  float A;
  float ds;
  float s;
  float g;
  float w=10;
  float ws=0.25;
  float I=0;
  float d;
  float Am;
  float At;
  float Apa;
  float Cpa;
  float beta,gamma;
  
  Skel(float A0,float x0,float y0,float ds0,float s0,float g00,float C0,float beta0,float gamma0) {
    dC=0;
    gC=0;
    d=0;
    C=C0;
    A=A0;
    x=x0;
    y=y0;
    ds=ds0;
    s=s0;
    g0=g00;
    Am=0;
    At=Al;
    Apa=A0;
    Cpa=0;
    beta = beta0;
    gamma = gamma0;
    for (int i=0;i<Tm;i++) {
      Cp[T%Tm]=C;

    }
  }
  
  void croiss(int modec) {
    switch(modec) {
      case 0:
      g=1;
      break;
      case 1:
      g = g0;
      ds=ds*(1+g*dt);
      break;

      case 2:
      if (L-s<L0)
        g=g0;
      else g=0;
      
      ds=ds*(1+g*dt);
      break;   

    }
  }
  
  void sensib() {


 
      
      d=-beta*A-gamma*C;

    dC=d;
    C+=g*dC*dt;
    Cp[T%Tm]=C;
    
  }
  
  void evol(Skel Sm,int i) {

    Am=(A-Sm.A+C*ds)/dt;
    A=Sm.A+C*ds;
    A=testang(A);
    
    x=Sm.x+ds*sin(A);
    y=Sm.y+ds*cos(A); 
    
    s=Sm.s+ds;
    
      int du=T-int((L-s)/(v*dt));
      if (T>TmA){
      Apa=Apast[i][T%TmA];
      }
      if (T>TmC){
      Cpa=Cpast[i][T%TmC];
      }      
      if(du>0){
      At=Atip[du%Tm];

      }
  }
  
  
  void write() {
    
    Atxt.print(A + "\t");
    Ctxt.print(C + "\t");
    DCtxt.print(dC + "\t");
    dtxt.print(d + "\t");
    gtxt.print(g + "\t");
    stxt.print(s + "\t");
  }
  
  
}
  
  
  
