import math
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
# True (standard) Lead concentrations in ppm (example data)
true_values = np.array([0.1, 0.5, 1.0, 2.0, 3.0, 5.0, 7.0, 10.0])
# Measured sensor readings in ppm (simulated experimental data)
measured_values = np.array([0.11, 0.48, 1.02, 2.1, 2.9, 5.2, 6.8, 9.8])
# --- Accuracy Calculations ---
mae = mean_absolute_error(true_values, measured_values)
rmse = np.sqrt(mean_squared_error(true_values, measured_values))
r2 = r2_score(true_values, measured_values)
# Per-sample accuracy
accuracy_percent = 100 * (1 - np.abs(measured_values - true_values) / true_values)
# Overall average accuracy
overall_accuracy = np.mean(accuracy_percent)
# --- Display Results ---
print("=== Lead Sensor Accuracy Analysis ===")
print(f"Mean Absolute Error (MAE): {mae:.4f} ppm")
print(f"Root Mean Square Error (RMSE): {rmse:.4f} ppm")
print(f"R² Score: {r2:.4f}")
print(f"Overall Accuracy: {overall_accuracy:.2f}%")
# --- Plot 1: Measured vs True ---
plt.figure(figsize=(10,5))
plt.subplot(1,2,1)
plt.plot(true_values, measured_values, 'o-', label='Measured')
plt.plot(true_values, true_values, 'k--', label='Ideal (y=x)')
plt.title('Lead Sensor Calibration Curve')
plt.xlabel('True Concentration (ppm)')
plt.ylabel('Measured Concentration (ppm)')
plt.legend()
plt.grid(True)
# --- Plot 2: Accuracy Percentage ---
plt.subplot(1,2,2)
plt.bar(range(len(true_values)), accuracy_percent, color='skyblue')
plt.axhline(y=overall_accuracy, color='r', linestyle='--', label=f'Avg Accuracy = {overall_accuracy:.2f}%')
plt.title('Per-Sample Accuracy (%)')
plt.xlabel('Sample Index')
plt.ylabel('Accuracy (%)')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()