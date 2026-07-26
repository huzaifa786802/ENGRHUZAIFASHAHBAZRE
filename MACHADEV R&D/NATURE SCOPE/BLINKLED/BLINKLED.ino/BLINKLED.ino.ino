#include <Arduino.h>
// Define LED pin (on most ESP32-S3 boards, built-in LED is GPIO 2)
const int ledPin = 2;
void setup() {
  pinMode(ledPin, OUTPUT);
}
void loop() {
  digitalWrite(ledPin, HIGH);   // Turn LED ON
  delay(2000);                  // Wait 2 seconds
  digitalWrite(ledPin, LOW);    // Turn LED OFF
  delay(2000);                  // Wait 2 seconds
}