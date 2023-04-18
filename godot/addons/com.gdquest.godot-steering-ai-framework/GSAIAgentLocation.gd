# Represents an agent with only a location and an orientation.
# @category - Base types
class_name GSAIAgentLocation

signal position_changed(old_position: Vector3, new_position: Vector3)
signal orientation_changed(old_orientation: float, new_orientation: float)

# The agent's position in space.
var position: Vector3 = Vector3.ZERO:
    set(p):
        if p != position:
            position_changed.emit(position, p)
        position = p


# The agent's orientation on its Y axis rotation.
var orientation: float = 0.0:
    set(o):
        if o != orientation:
            orientation_changed.emit(orientation, o)
        orientation = o