import serial
import time
# Update to your COM port (e.g., "COM7" on Windows )
SERIAL_PORT = "COM7"
BAUD_RATE = 115200
ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1)
time.sleep(2)
print("Connected to ESP32-S3")
# Example: send two rows of text
row1 = "Huzaifa"
row2 = "Shahbaz"
ser.write((row1 + "\n").encode())
time.sleep(0.5)
ser.write((row2 + "\n").encode())
print("Sent text to ESP32-S3")
ser.close()