#include <SPI.h>
#include <MFRC522.h>

#define RST_PIN         15          
#define SS_PIN          5       

MFRC522 mfrc522(SS_PIN, RST_PIN);  

int vrx = 34;
int vry = 35;
int sw = 32;
int led = 2 ;
int flag = 0;
void setup() {
   Serial.begin(9600);   
  while (!Serial);    
  SPI.begin();      
  mfrc522.PCD_Init();   
  delay(4);      
  mfrc522.PCD_DumpVersionToSerial(); 
  Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));
 pinMode(led,OUTPUT);
 pinMode(vrx,INPUT);
 pinMode(vry,INPUT);
 pinMode(sw,INPUT_PULLUP);
}

void loop() {
    if(digitalRead(sw)==LOW && flag == 0){
    digitalWrite(led,HIGH);
    flag = 1;
    delay(3);
  }
   else if(digitalRead(sw)==HIGH&& flag == 1){
    digitalWrite(led,LOW);
    flag = 0;
    delay(3);
  }
int x = map(analogRead(vrx),0,4095,-10,10);
int y = map(analogRead(vry),0,4095,-10,10);
if(x!=-1 && x!= -2 && x<0){
  Serial.write("Esquerda\n");
}
else if (x!= 1 && x!=2 && x>0){
Serial.write("Direita\n");
}
   if(y!=-1 && y!=-2 && y<0){
  Serial.write("Cima\n");
}
else if (y!=-1 && y!=2 && y>0){
Serial.write("Baixo\n");
}
delay(10);

  if ( ! mfrc522.PICC_IsNewCardPresent()) {
    return;
  }

  // Select one of the cards
  if ( ! mfrc522.PICC_ReadCardSerial()) {
    return;
  }
  
  String content= "";
  byte letter;
  for (byte i = 0; i < mfrc522.uid.size; i++) 
  {
     content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
     content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase();
  if (content.substring(1) == "A3 58 DE 11") 
  {
    Serial.write("boladefogo\n");
    delay(1500);
  }
 else if (content.substring(1) == "63 3F B1 A8"){
    Serial.write("furacao\n");
    delay(1500);
  }
   else if (content.substring(1) == "B9 CB 9C B2"){
    Serial.write("trovoada\n");
    delay(1500);
  }
   else if (content.substring(1) == "E9 67 92 B2"){
    Serial.write("tempestade\n");
    delay(1500);
  }
 else   {
    Serial.println("Cartao nao reconhecido");
    delay(3000);
  }
} 
