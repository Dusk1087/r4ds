# Constants
speed_knots <- 180          # Final speed in knots
time_seconds <- 2           # Total time for the catapult stroke
weight_lbs <- 66000         # Aircraft weight in pounds
g_to_m_per_s2 <- 9.81       # Acceleration due to gravity in m/s^2
knots_to_mps <- 0.514444    # Conversion factor from knots to m/s
lbs_to_kg <- 0.453592       # Conversion factor from pounds to kilograms

# Derived values
speed_mps <- speed_knots * knots_to_mps       # Final speed in m/s
weight_kg <- weight_lbs * lbs_to_kg           # Weight in kilograms
acceleration_mps2 <- speed_mps / time_seconds # Constant acceleration in m/s^2

# Calculate constant force and g-force
force_newtons <- weight_kg * acceleration_mps2       # Constant force in Newtons
g_force <- force_newtons / (weight_kg * g_to_m_per_s2) # Constant g-force

# Generate time points
time_values <- seq(0, time_seconds, length.out = 100)  # 100 time points

# Plot Force (Newtons) vs Time
plot(
  time_values, rep(force_newtons, length(time_values)), type = "l", col = "blue", lwd = 2,
  main = "Force vs Time During Catapult Launch (Newtons)",
  xlab = "Time (seconds)", ylab = "Force (Newtons)"
)
grid()

# Plot G-Force vs Time
plot(
  time_values, rep(g_force, length(time_values)), type = "l", col = "red", lwd = 2,
  main = "G-Force vs Time During Catapult Launch",
  xlab = "Time (seconds)", ylab = "G-Force"
)
grid()
