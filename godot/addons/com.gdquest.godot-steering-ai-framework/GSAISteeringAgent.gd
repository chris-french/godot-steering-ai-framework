# Adds velocity, speed, and size data to `GSAIAgentLocation`.
#
# It is the character's responsibility to keep this information up to date for
# the steering toolkit to work correctly.
# @category - Base types

class_name GSAISteeringAgent extends GSAIAgentLocation

signal linear_velocity_changed(old_val: Vector3, new_val: Vector3)
signal angular_velocity_changed(old_val: float, new_val: float)
signal bounding_radius_changed(old_val: float, new_val: float)


# The amount of velocity to be considered effectively not moving.
var zero_linear_speed_threshold: float = 0.01

# The maximum speed at which the agent can move.
var linear_speed_max: float = 0.0

# The maximum amount of acceleration that any behavior can apply to the agent.
var linear_acceleration_max: float = 0.0

# The maximum amount of angular speed at which the agent can rotate.
var angular_speed_max: float = 0.0

# The maximum amount of angular acceleration that any behavior can apply to an
# agent.
var angular_acceleration_max: float = 0.0

# Current velocity of the agent.
var linear_velocity: Vector3 = Vector3.ZERO:
    set(v):
        if v != linear_velocity:
            linear_velocity_changed.emit(linear_velocity, v)
        linear_velocity = v

# Current angular velocity of the agent.
var angular_velocity: float = 0.0:
    set(v):
        if v != angular_velocity:
            angular_velocity_changed.emit(angular_velocity, v)
        angular_velocity = v

# The radius of the sphere that approximates the agent's size in space.
var bounding_radius: float = 0.0:
    set(v):
        if v != bounding_radius:
            bounding_radius_changed.emit(bounding_radius, v)
        bounding_radius = v

# Used internally by group behaviors and proximities to mark the agent as already
# considered.
var is_tagged := false
