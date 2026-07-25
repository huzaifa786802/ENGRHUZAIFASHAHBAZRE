import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Circle, Rectangle, Polygon

# Create figure with specified resolution
fig, ax = plt.subplots(figsize=(16, 9), dpi=64)  # 16x9 inches at 64 dpi -> 1024x576 pixels
ax.set_xlim(0, 10)
ax.set_ylim(0, 10)
ax.set_xticks([])
ax.set_yticks([])
ax.set_frame_on(False)

# Background (Sky and Ground)
ax.add_patch(Rectangle((0, 0), 10, 10, color='orange'))  # Sky
ax.add_patch(Rectangle((0, 0), 10, 3, color='saddlebrown'))  # Ground
ax.add_patch(Polygon([[0, 3], [10, 3], [8, 5], [2, 5]], color='green'))  # Hill

# Sun
ax.add_patch(Circle((8, 8), 1.2, color='yellow', alpha=0.8))

# Clouds
clouds = [(2, 8.5), (6, 8.7)]
for cx, cy in clouds:
    ax.add_patch(Circle((cx, cy), 0.8, color='white'))
    ax.add_patch(Circle((cx + 0.6, cy + 0.2), 0.6, color='white'))
    ax.add_patch(Circle((cx - 0.6, cy + 0.2), 0.6, color='white'))

# Balloons
balloon_colors = ['red', 'blue', 'purple']
balloon_positions = [(1.5, 6), (8.5, 6), (3, 7)]
for (bx, by), color in zip(balloon_positions, balloon_colors):
    ax.add_patch(Circle((bx, by), 0.3, color=color))
    ax.plot([bx, bx], [by, by - 1], 'k-', linewidth=0.8)  # String

# Stick figures
stick_positions = [2, 3.5, 5, 6.5, 8]
for x in stick_positions:
    ax.plot([x, x], [4, 5.5], 'k-', linewidth=2)  # Body
    ax.plot([x - 0.5, x + 0.5], [5, 5.5], 'k-', linewidth=2)  # Arms
    ax.plot([x - 0.3, x + 0.3], [4, 3.5], 'k-', linewidth=2)  # Legs
    ax.add_patch(Circle((x, 5.8), 0.3, color='black'))  # Head

# Cheerful Life Text
text_box = Rectangle((3, 7), 4, 1, color='white', alpha=0.8)
ax.add_patch(text_box)
ax.text(5, 7.5, "CHEERFUL LIFE", fontsize=18, fontweight='bold', color='red', ha='center')

# Save the image in 1024x576 resolution
plt.savefig("cheerful_life_1024x576.png", dpi=64)

# Show the figure
plt.show()
