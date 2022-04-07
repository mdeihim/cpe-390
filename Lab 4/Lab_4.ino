void setup() {
  // put your setup code here, to run once:
  pinMode(A0, INPUT);
  pinMode(A10, INPUT);

  Serial.begin(9600);
  analogReadResolution(12);
}

void loop() {
  // put your main code here, to run repeatedly:
   while (analogRead(A10) < 3783) {
    Serial.print("\n");
    Serial.print(analogRead(A10));
   }
   Serial.print("end1");
   long t0 = micros();
   while (analogRead(A0) < 3772) {
    Serial.print("\n");
    Serial.print(analogRead(A0));
   }
   Serial.print("end2");
   long t1 = micros();
   if (t1 > t0) {
    uint64_t long elapsed = t1 - t0;
    Serial.print("\n");
    Serial.print(elapsed);
    delay(2000);
   }
   else {
    Serial.print("\n");
    Serial.print("error");
    delay(2000);
   }
}
