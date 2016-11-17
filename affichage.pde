void aff() {
 for(int i=0; i<skel.length-1; i++){
   int c=affcol(skel[i].C,.1);
   //int c=affcol2(skel[i].g);
   
   //if (L-skel[i].s>L0) c=212;
   //else c=43;
   strokeWeight(10);
   stroke(c,255,160,180);
   line(int((skel[i].x-gr[0])*width/(gr[1]-gr[0])),height-int((skel[i].y-gr[2])*height/(gr[3]-gr[2])),int((skel[i+1].x-gr[0])*width/(gr[1]-gr[0])),height-int((skel[i+1].y-gr[2])*height/(gr[3]-gr[2])));
 
   }
}

int affcol(float C,float sca) {
  int clim=180;
  int c=clim-int(abs(C*255/sca));
  if (c<0) c=0;
  if (c>clim) c=clim;
  return c;
}

int affcol2(float g) {
  int c;
if (g==1) {c=40;}
else {c=180;} 
  return c;
}


void affC() {
 for(int i=0; i<skel.length-1; i++){
   int c=affcol(skel[i].g,1);
   stroke(c,255,255,255);
   line(int((skel[i].s-grC[0])*width/(grC[1]-grC[0])),height-int((-skel[i].C-grC[2])*height/(grC[3]-grC[2])),int((skel[i+1].s-grC[0])*width/(grC[1]-grC[0])),height-int((-skel[i+1].C-grC[2])*height/(grC[3]-grC[2])));
   if (grC[1]<skel[skel.length-1].s) grC[1]=skel[skel.length-1].s;
   }
}

void affA() {
 for(int i=0; i<skel.length-1; i++){
   int c=affcol(skel[i].g,1);
   stroke(c,255,255,255);
   line(int((skel[i].s-grC[0])*width/(grC[1]-grC[0])),height-int((-skel[i].A-grC[2])*height/(grC[3]-grC[2])),int((skel[i+1].s-grC[0])*width/(grC[1]-grC[0])),height-int((-skel[i+1].A-grC[2])*height/(grC[3]-grC[2])));
   
   if (grC[1]<skel[skel.length-1].s) grC[1]=skel[skel.length-1].s;
   }
   stroke(120,255,255,255);
   line(0,height-int((0-grC[2])*height/(grC[3]-grC[2])),width,height-int((0-grC[2])*height/(grC[3]-grC[2])));
}
void affgC() {
 for(int i=0; i<skel.length-1; i++){
   int c=affcol(skel[i].g,1);
   stroke(c,255,255,255);
   line(int((skel[i].s-grgC[0])*width/(grgC[1]-grgC[0])),height-int((skel[i].d-grgC[2])*height/(grgC[3]-grgC[2])),int((skel[i+1].s-grgC[0])*width/(grgC[1]-grgC[0])),height-int((skel[i+1].d-grgC[2])*height/(grgC[3]-grgC[2])));
   if (grC[1]<skel[skel.length-1].s) grC[1]=skel[skel.length-1].s;
   }
}
void affSC(float sca,float sca2) {
 for(int i=0; i<skel.length-1; i++){
   int c=affcol(skel[i].C,sca);
   stroke(c,255,255,255);
   line(int((L-skel[i].s-grC[0])*width/(grC[1]-grC[0])),T/sca2,int((L-skel[i+1].s-grC[0])*width/(grC[1]-grC[0])),T/sca2);
   }
}

void writ() {
 Atxt.print("\n");
 Ctxt.print("\n");
 DCtxt.print("\n");
 dtxt.print("\n");
 gtxt.print("\n");
 stxt.print("\n");
 for(int i=0; i<skel.length-1; i++){
   skel[i].write();
   }
}  

void grid(int i) {
  if (gr[0]>skel[i].x) gr[0]=skel[i].x-0.1;
  if (gr[1]<skel[i].x) gr[1]=skel[i].x+0.1;
  if (gr[2]>skel[i].y) gr[2]=skel[i].y-0.1;
  if (gr[3]<skel[i].y) gr[3]=skel[i].y+0.1;
  if (grC[2]>-skel[i].C) grC[2]=-skel[i].C-0.01;
  if (grC[3]<-skel[i].C) grC[3]=-skel[i].C+0.01;
}