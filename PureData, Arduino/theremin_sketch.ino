void setup() {

Serial.begin(9600);

}

void loop() {

int sensorValue = analogRead(A0);
int serialValue = sensorValue / 2;
Serial.write(serialValue);

}