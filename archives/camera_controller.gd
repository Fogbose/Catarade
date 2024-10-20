# camera_controller.gd
extends Camera2D

# Sensibilité du zoom et de la caméra
var zoom_sensitivity = 0.1
var move_sensitivity = 500.0

# Zoom de la caméra avec la molette de la souris
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom *= 1 - zoom_sensitivity
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom *= 1 + zoom_sensitivity

# Déplacement de la caméra avec les touches fléchées
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= move_sensitivity * delta
	if Input.is_action_pressed("ui_down"):
		position.y += move_sensitivity * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= move_sensitivity * delta
	if Input.is_action_pressed("ui_right"):
		position.x += move_sensitivity * delta
