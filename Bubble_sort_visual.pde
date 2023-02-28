FloatList values;
int num = 30;
int res;
int current;
int noswap;

void setup(){
  size(1000,600);
  res = width/num;
  colorMode(HSB);
  values = new FloatList();
  for (int i = 0; i<num; i++){
    values.append(i*height/num);
  }
  values.shuffle();
  current = 0;
  noswap = 0;
}

void draw(){
  //draw current 
  background(0);
  for (int i = 0; i < num; i ++){
    float hue = map(values.get(i),0,height,0,255);
    stroke(hue,255,255);//hue based on height, saturation and brightness set to max
    strokeWeight(res);
    line(i*res+res/2,height,i*res+res/2,height-values.get(i));
  }
  
  //bubble sort
  if(values.get(current) > values.get(current + 1)){//swap
    float temp = values.get(current);
    values.set(current, values.get(current + 1));
    values.set(current+1, temp);
    noswap = 0;
  }else{
    noswap ++; 
  }
  
  current ++;
  if (current == num-1){
    current = 0; //reset to start for next pass
  }
  
  
  if (noswap == num){
    println("sorted");
    noLoop();//if fully sorted stop 
  }
  
  //delay(10);
}
