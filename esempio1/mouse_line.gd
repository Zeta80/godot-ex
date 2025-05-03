extends Node2D
@onready var line_2d: Line2D = $Line2D

var pressed := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var allDot = get_parent().get_node("GridDot").get_children()
	for dot in allDot:
		dot.connect("Mouse_enter", Callable(self, "addPointDot"))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	updateMouseState()
	if pressed:
		line_2d.add_point(get_global_mouse_position())

func addPointDot(nome, posizione):
	line_2d.add_point(posizione)
	if pressed:
		print(nome, posizione)



func updateMouseState():
	if Input.is_action_pressed("click"):
		pressed = true
	else:
		pressed = false
		line_2d.clear_points()
