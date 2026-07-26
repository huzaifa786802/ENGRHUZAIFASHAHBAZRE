import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import pandas as pd
class RestaurantSatisfactionNN:
    """
    Multi-layer Perceptron for predicting restaurant customer satisfaction
    Network Architecture:
    - Input Layer: 2 neurons (Duration stayed, Tip received)
    - Hidden Layer (Box A): 3 neurons with sigmoid activation
    - Hidden Layer (Box B): 2 neurons with sigmoid activation  
    - Output Layer: 1 neuron with sigmoid activation (satisfaction probability)
    """
    def __init__(self, learning_rate=0.01, epochs=1000):
        self.learning_rate = learning_rate
        self.epochs = epochs
        # Network architecture
        self.input_size = 2    # Duration stayed, Tip received
        self.hidden1_size = 3  # Box A
        self.hidden2_size = 2  # Box B
        self.output_size = 1   # Satisfaction (ŷ)
        # Initialize weights and biases
        self.initialize_parameters()
        # Store training history
        self.cost_history = []
    def initialize_parameters(self):
        """Initialize weights and biases using Xavier initialization"""
        np.random.seed(42)  # For reproducibility
        # Weights between layers
        self.W1 = np.random.randn(self.input_size, self.hidden1_size) * np.sqrt(2.0/self.input_size)
        self.b1 = np.zeros((1, self.hidden1_size))
        self.W2 = np.random.randn(self.hidden1_size, self.hidden2_size) * np.sqrt(2.0/self.hidden1_size)
        self.b2 = np.zeros((1, self.hidden2_size))
        self.W3 = np.random.randn(self.hidden2_size, self.output_size) * np.sqrt(2.0/self.hidden2_size)
        self.b3 = np.zeros((1, self.output_size))
    def sigmoid(self, z):
        """Sigmoid activation function"""
        # Clip z to prevent overflow
        z = np.clip(z, -500, 500)
        return 1 / (1 + np.exp(-z))
    def sigmoid_derivative(self, z):
        """Derivative of sigmoid function"""
        s = self.sigmoid(z)
        return s * (1 - s)
    def forward_propagation(self, X):
        """Forward pass through the network"""
        # Input to Hidden Layer 1 (Box A)
        self.z1 = np.dot(X, self.W1) + self.b1
        self.a1 = self.sigmoid(self.z1)
        # Hidden Layer 1 to Hidden Layer 2 (Box B)
        self.z2 = np.dot(self.a1, self.W2) + self.b2
        self.a2 = self.sigmoid(self.z2)
        # Hidden Layer 2 to Output
        self.z3 = np.dot(self.a2, self.W3) + self.b3
        self.a3 = self.sigmoid(self.z3)
        return self.a3
    def compute_cost(self, y_true, y_pred):
        """Compute binary cross-entropy cost"""
        m = y_true.shape[0]
        # Add small epsilon to prevent log(0)
        epsilon = 1e-15
        y_pred = np.clip(y_pred, epsilon, 1 - epsilon)
        cost = -np.sum(y_true * np.log(y_pred) + (1 - y_true) * np.log(1 - y_pred)) / m
        return cost
    def backward_propagation(self, X, y):
        """Backward pass - compute gradients"""
        m = X.shape[0]
        # Output layer gradients
        dz3 = self.a3 - y
        dW3 = np.dot(self.a2.T, dz3) / m
        db3 = np.sum(dz3, axis=0, keepdims=True) / m
        # Hidden layer 2 gradients  
        da2 = np.dot(dz3, self.W3.T)
        dz2 = da2 * self.sigmoid_derivative(self.z2)
        dW2 = np.dot(self.a1.T, dz2) / m
        db2 = np.sum(dz2, axis=0, keepdims=True) / m
        # Hidden layer 1 gradients
        da1 = np.dot(dz2, self.W2.T)
        dz1 = da1 * self.sigmoid_derivative(self.z1)
        dW1 = np.dot(X.T, dz1) / m
        db1 = np.sum(dz1, axis=0, keepdims=True) / m
        return dW1, db1, dW2, db2, dW3, db3
    def update_parameters(self, dW1, db1, dW2, db2, dW3, db3):
        """Update parameters using gradient descent"""
        self.W1 -= self.learning_rate * dW1
        self.b1 -= self.learning_rate * db1
        self.W2 -= self.learning_rate * dW2
        self.b2 -= self.learning_rate * db2
        self.W3 -= self.learning_rate * dW3
        self.b3 -= self.learning_rate * db3
    def train(self, X, y, verbose=True):
        """Train the neural network"""
        for epoch in range(self.epochs):
            # Forward propagation
            y_pred = self.forward_propagation(X)
            # Compute cost
            cost = self.compute_cost(y, y_pred)
            self.cost_history.append(cost)
            # Backward propagation
            dW1, db1, dW2, db2, dW3, db3 = self.backward_propagation(X, y)
            # Update parameters
            self.update_parameters(dW1, db1, dW2, db2, dW3, db3)
            # Print progress
            if verbose and epoch % 100 == 0:
                print(f"Epoch {epoch}, Cost: {cost:.4f}")
    def predict(self, X):
        """Make predictions"""
        predictions = self.forward_propagation(X)
        return (predictions > 0.5).astype(int)
    def predict_proba(self, X):
        """Return prediction probabilities"""
        return self.forward_propagation(X)
    def accuracy(self, X, y):
        """Calculate accuracy"""
        predictions = self.predict(X)
        return np.mean(predictions == y)
    def plot_cost_history(self):
        """Plot training cost over epochs"""
        plt.figure(figsize=(10, 6))
        plt.plot(self.cost_history)
        plt.title('Training Cost Over Time')
        plt.xlabel('Epoch')
        plt.ylabel('Cost (Binary Cross-Entropy)')
        plt.grid(True)
        plt.show()
    def visualize_decision_boundary(self, X, y, resolution=100):
        """Visualize decision boundary for 2D input"""
        if X.shape[1] != 2:
            print("Decision boundary visualization only works for 2D input")
            return
        plt.figure(figsize=(12, 5))
        # Create mesh
        x_min, x_max = X[:, 0].min() - 0.5, X[:, 0].max() + 0.5
        y_min, y_max = X[:, 1].min() - 0.5, X[:, 1].max() + 0.5
        xx, yy = np.meshgrid(np.linspace(x_min, x_max, resolution),np.linspace(y_min, y_max, resolution))
        # Make predictions on mesh
        mesh_points = np.c_[xx.ravel(), yy.ravel()]
        Z = self.predict_proba(mesh_points)
        Z = Z.reshape(xx.shape)
        # Plot decision boundary
        plt.subplot(1, 2, 1)
        plt.contourf(xx, yy, Z, levels=50, alpha=0.8, cmap='RdYlBu')
        plt.colorbar(label='Satisfaction Probability')
        # Scatter plot of data points
        satisfied = (y.ravel() == 1)
        plt.scatter(X[satisfied, 0], X[satisfied, 1], c='green', marker='o', label='Satisfied', edgecolors='black', s=100)
        plt.scatter(X[~satisfied, 0], X[~satisfied, 1], c='red', marker='x', label='Not Satisfied', s=100)
        plt.xlabel('Duration Stayed (normalized)')
        plt.ylabel('Tip Received (normalized)')
        plt.title('Decision Boundary')
        plt.legend()
        # Plot cost history
        plt.subplot(1, 2, 2)
        plt.plot(self.cost_history)
        plt.title('Training Cost')
        plt.xlabel('Epoch')
        plt.ylabel('Cost')
        plt.grid(True)
        plt.tight_layout()
        plt.show()
# Generate synthetic restaurant data for demonstration
def generate_restaurant_data(n_samples=1000):
    """Generate synthetic restaurant customer data"""
    np.random.seed(42)
    # Features: Duration stayed (minutes), Tip received ($)
    duration = np.random.normal(45, 15, n_samples)  # Mean 45 min, std 15 min
    tip = np.random.normal(8, 4, n_samples)         # Mean $8, std $4
    # Ensure positive values
    duration = np.maximum(duration, 10)
    tip = np.maximum(tip, 0)
    # Create satisfaction labels (higher duration and tip = more likely satisfied)
    # Add some noise to make it realistic
    satisfaction_score = (duration - 30) * 0.02 + (tip - 5) * 0.15 + np.random.normal(0, 0.3, n_samples)
    satisfaction = (satisfaction_score > 0).astype(int)
    X = np.column_stack([duration, tip])
    y = satisfaction.reshape(-1, 1)
    return X, y
# Example usage and competition-ready code
if __name__ == "__main__":
    print("=== Restaurant Customer Satisfaction Neural Network ===\n")
    # Generate sample data
    X, y = generate_restaurant_data(1000)
    # Normalize features
    scaler = StandardScaler()
    X_normalized = scaler.fit_transform(X)
    # Split data
    X_train, X_test, y_train, y_test = train_test_split(
        X_normalized, y, test_size=0.2, random_state=42
    )
    print(f"Training data shape: {X_train.shape}")
    print(f"Test data shape: {X_test.shape}")
    print(f"Satisfaction rate: {np.mean(y)*100:.1f}%\n")
    # Initialize and train neural network
    nn = RestaurantSatisfactionNN(learning_rate=0.1, epochs=1000)
    print("Training Neural Network...")
    nn.train(X_train, y_train, verbose=True)
    # Evaluate model
    train_accuracy = nn.accuracy(X_train, y_train)
    test_accuracy = nn.accuracy(X_test, y_test)
    print(f"\nFinal Results:")
    print(f"Training Accuracy: {train_accuracy*100:.2f}%")
    print(f"Test Accuracy: {test_accuracy*100:.2f}%")
    # Make sample predictions
    sample_customers = np.array([[60, 12], [20, 3], [80, 15], [30, 1]])  # duration, tip
    sample_normalized = scaler.transform(sample_customers)
    predictions = nn.predict_proba(sample_normalized)  
    print(f"\nSample Predictions:")
    for i, (customer, prob) in enumerate(zip(sample_customers, predictions)):
        duration, tip = customer
        satisfaction_prob = prob[0] * 100
        print(f"Customer {i+1}: {duration}min stay, ${tip} tip -> {satisfaction_prob:.1f}% satisfaction probability")
    # Visualize results
    print(f"\nPlotting results...")
    nn.plot_cost_history()
    nn.visualize_decision_boundary(X_test, y_test)
    # Component identification (based on the network diagram)
    print(f"\n=== Network Components Identification ===")
    print(f"w₁₁⁽¹⁾: Weight from 'Duration stayed' to 1st neuron in Box A")
    print(f"Σ: Summation function in each neuron")  
    print(f"f: Activation function (sigmoid)")
    print(f"Red circles: Input layer neurons")
    print(f"Orange circles: Hidden layer neurons") 
    print(f"Green circle: Output neuron (ŷ)")
    print(f"Box A: First hidden layer (3 neurons)")
    print(f"Box B: Second hidden layer (2 neurons)")
    print(f"ŷ: Final output (satisfaction prediction)")