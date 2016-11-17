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
  
  Skel(float A0,float x0,float y0,float ds0,float s0,float g0,float C0) {
    dC=0;
    gC=0;
    d=0;
    C=C0;
    A=A0;
    x=x0;
    y=y0;
    ds=ds0;
    s=s0;
    g=g0;
    Am=0;
    At=Al;
    Apa=A0;
    Cpa=0;
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
      g=1;
      ds=ds*(1+g*dt);
      break;
      case 2:
 
      g=1/(1+exp(L-L0-s));
      ds=ds*(1+g*dt);
      break;
      case 3:
      g=1+(1+sin(t*w))/2;
      ds=ds*(1+g*dt);
      break;
      case 4:
      g=1+(1/(1+exp(L-10-s)))*((1+sin(t*w))/2);
      
      ds=ds*(1+g*dt);
      break;
      case 5:
      g=((1+cos(t*w-(L-s)*ws))/2);
      
      ds=ds*(1+g*dt);
      break;
      case 6:
      g=0.3+(4/(1+exp(L-L0-s))+1/(1+exp(L-2*L0-s)))/2;
      
      ds=ds*(1+g*dt);
      break;
      case 7:
      g=(1/(1+exp((L-10-s)/5))+1/(1+exp(L-3-s)));//*((1+sin(t*w-(L-s)*ws))/2);
      
      ds=ds*(1+g*dt);
      break;
      case 8:
      if (L-s<L0)
        g=1;
      else if (L-s<2*L0) g=0;
      else g=0;
      
      ds=ds*(1+g*dt);
      break;   
      case 9:
      float c=0.2;
      float sAT=0.1;
      float sA=L-c*t%L;

      
      if (s<sA && s>sA-sAT)
      g=1;
      else
      g=0;
      break;
      case 10:
       if (s>L-L0){
         float  w2=2*PI*50;
         g=1+(1+sin(t*w2))/2;
         ds=ds*(1+g*dt);}
      else g=0;
      break;
    }
    if (modec>0) g=g;
  }
  
  void sensib() {
    //C+=2*(A*(1+cos(t*w))/(2*PI)-C*(1+sin(t*w))/2)*dt*g;
    //C+=(A/PI-C)*dt*g;
   // C+=(A/PI-Cp[T%Tm])*dt*g;
    //C+=100*(A/(L*PI)-C/L)*dt*g;
    //C+=(A*(1+cos(t*w))-I*(1+sin(t*w)))*dt*g/(2*PI);
    float m=3;
    float n=m;
    int p=100;
    //d=-pow((L-L0+s),m)/pow(L0,m)*A-0*(pow((L-L0+s),n)/pow(L0,n))*C-0*pow((L-L0+s),p)/pow(L0,m)*Am;
    //d=(1+A*A)*(1-C*C)*(-A-C);
    //d=pow(s/L,m)*(-4*A-1*C);

    //d=-(Atip2);//+1*A);
    
    //if (round((t-(L-s)/cp)/dt)%Tm<0) d=0;
    //else d=-Atip[round((t-(L-s)/cp)/dt)%Tm];
    
    //d=-(.1)*sin(A)-C;
    
    //d=1.*(-0+(L-s)*10)*sin(A)+0.*C;
    //d=-exp(-(A-PI/2));
    //d=-0.3*(At-Al)-C-A;
    //d=-0.1*(At-Al)-pow(((L-s)/L),m)*A-pow(((L-s)/L),n)*C;
    //d=-At;
    //d=-(0.25+pow(((s)/L),m))*A-3*(0.25+pow(((s)/L),n))*C;
    //d=(PI/2+atan((s-5)/4))*(-A-3*C)/6;
    
    //d=((-pow(s/L,m)*2*A-pow(s/L,n)*C));
    //d=-(1*(s/L)+2)*A-(3*(s/L))*C;
    //d=-Apa-0.25*Cpa;
    //float c=0.5;
    //float tprop=0.1;
    //float sprop=c*t%L;
    //if (L-s-sprop<0 && (L-s-sprop)>-tprop){
      
      d=-A-0.25*C;
  //}
    //d=10*(-2*(At-3)-0.3*C-1*A);
    //d=-1*Apa-0.10*Cpa-(At-1.5);
    //d=-2*Apa-0*Cpa-0.3*At;
    //d=-A;
    //d=-Apa-Cpa-0.9*sin(t*1);
    //d=-(At-Al)-3*A-C;
    
    
    
    //d=4*((-0.5*pow(s/L,m)*6*A-3*pow(s/L,n)*C));
    
    //d=((0.01+pow(s/L,m))/1.01)*(-A-(1./4)*C);
    //d=-exp(-(L-s)/m)*A-exp(-(L-s)/n)*C-0*exp(-(L-s)/p)*Am;
    //d=-exp(-(s)/m)*A-exp(-(s)/n)*C-0*exp(-(L-s)/p)*Am;
    //d=(1/(1-(s/L)+1))*(-A-C)-0*pow(s,p)/pow(L,m)*Am;
    //d=(-(2*s+1)*A-(1*s+2)*C);
   //d=-A-C; 
   //d=-1;
    dC=d;
    //dC=g*d*(1-pow(C,2));
    C+=g*dC*dt+((.3*(L-s)/L0)*sin(A)-C)*dt;
    Cp[T%Tm]=C;
    //C+=g*dC*dt*(1-pow(C,2));
    
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
  
  
  
