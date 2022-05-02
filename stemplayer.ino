const int bassPin = 2;
const int vocalPin = 3;
const int instrPin = 4;
const int drumPin = 5;

int buttonState = 0;    
int buttonState2 = 0;        
int buttonState3 = 0;      
int buttonState4 = 0;

byte arbitraryCode1 = 97;
byte arbitraryCode2 = 98;
byte arbitraryCode3 = 99;
byte arbitraryCode4 = 96;

void setup() {
  pinMode(bassPin, INPUT);
  pinMode(vocalPin, INPUT);
  pinMode(instrPin, INPUT);
  pinMode(drumPin, INPUT);
  Serial.begin(9600);
}

void loop() {

  if (digitalRead(bassPin)) {
    Serial.write(arbitraryCode1);
    delay(500);
  }

  if (digitalRead(vocalPin)) {
    Serial.write(arbitraryCode2);
    delay(500);
  } 

  if (digitalRead(instrPin)) {
    Serial.write(arbitraryCode3);
    delay(500);
  } 

  if (digitalRead(drumPin)) {
    Serial.write(arbitraryCode4);
    delay(500);
  } 

}
