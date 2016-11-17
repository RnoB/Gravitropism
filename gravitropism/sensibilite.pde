void sens() {
  //skel[0].A=A0*exp(-t/1);
  if (T<Tm) {
    Atip[T]=skel[skel.length-1].A;
  }
  else {
    Atip[T%Tm]=skel[skel.length-1].A;
  }
  Atip2=skel[skel.length-1].A;
  for(int i=1; i<skel.length ; i++) {
    
    //skel[i].I=sensint(i);
    skel[i].croiss(modec);
    skel[i].sensib();
    skel[i].evol(skel[i-1],i);
    Apast[i][T%TmA]=skel[i].A;
    Cpast[i][T%TmC]=skel[i].C;
    gradC(i);
    grid(i);
  }
  L=skel[skel.length-1].s;

  
}



float testang(float A) {
  float B;
  if (abs(A)>PI) {
    B=A-(A/abs(A))*2*PI;
  }
  else {
    B=A;
  }
  return B;
}



float sensint(int i) {
   
  float I=0;
  
  for (int j=0;j<i+1;j++) {
    
    I+=skel[i].C*skel[j].ds;
    //I+=skel[j].C*exp(-(skel[i].s-skel[j].s));

 
  }
  return I;
}

void gradC(int i) {
  if (i>1 && i<skel.length-1) {
  skel[i].gC=(skel[i+1].dC-skel[i-1].dC)/(skel[i+1].s-skel[i-1].s);
  }
}
  
