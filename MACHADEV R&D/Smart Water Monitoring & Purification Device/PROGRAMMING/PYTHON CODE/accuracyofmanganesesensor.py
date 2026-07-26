import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
# Step 1: True and Measured Data (example dataset)
true_values = np.array([0.12, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55])  # mg/L (reference)
measured_values = np.array([0.11, 0.16, 0.19, 0.26, 0.28, 0.36, 0.41, 0.44, 0.52, 0.54])  # sensor readings
# Step 2: Accuracy Calculation per sample
def accuracy_percent(measured, true):
    abs_error = np.abs(measured - true)
    accuracy = 100 * (1 - (abs_error / true))
    accuracy = np.clip(accuracy, 0, 100)  # ensure values stay within 0–100%
    return accuracy
accuracy_values = accuracy_percent(measured_values, true_values)
# Step 3: Performance Metrics
mae = mean_absolute_error(true_values, measured_values)
rmse = np.sqrt(mean_squared_error(true_values, measured_values))
r2 = r2_score(true_values, measured_values)
avg_accuracy = np.mean(accuracy_values)
# Step 4: Print Results
print("📊 Manganese Sensor Accuracy Analysis")
print("--------------------------------------")
print(f"Mean Absolute Error (MAE): {mae:.4f} mg/L")
print(f"Root Mean Square Error (RMSE): {rmse:.4f} mg/L")
print(f"R² Score: {r2:.4f}")
print(f"Average Accuracy: {avg_accuracy:.2f}%")
# Step 5: Graph Visualization
plt.figure(figsize=(10,6))
# Plot measured vs true
plt.plot(true_values, label="True (Reference)", marker='o', linewidth=2)
plt.plot(measured_values, label="Measured (Sensor)", marker='s', linewidth=2)
plt.title("Manganese Sensor Measurement Accuracy", fontsize=14)
plt.xlabel("Sample Number")
plt.ylabel("Manganese Concentration (mg/L)")
plt.legend()
plt.grid(True)
plt.show()
# Plot accuracy per sample
plt.figure(figsize=(10,5))
plt.bar(range(1, len(accuracy_values)+1), accuracy_values, color='teal', alpha=0.7)
plt.axhline(y=avg_accuracy, color='red', linestyle='--', label=f'Average Accuracy = {avg_accuracy:.2f}%')
plt.title("Per-Sample Accuracy Percentage of Manganese Sensor", fontsize=14)
plt.xlabel("Sample Number")
plt.ylabel("Accuracy (%)")
plt.legend()
plt.grid(axis='y', linestyle='--', alpha=0.6)
plt.show()