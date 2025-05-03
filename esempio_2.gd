extends Node2D

var line: Line2D
var points := [
	Vector2(100, 100),
	Vector2(340, 120),
	Vector2(200, 200),
	Vector2(140, 220),
	Vector2(100, 100)
]

var current_segment := 0
var t := 0.0
var speed := 700.0  # pixel al secondo

func _ready():
	line = Line2D.new()
	line.width = 3
	line.default_color = Color(1, 1, 0)
	add_child(line)
	line.add_point(points[0])  # punto iniziale
	set_process(true)

func _process(delta):
	if current_segment >= points.size() - 1:
		set_process(false)
		return

	var p0 = points[current_segment]
	var p1 = points[current_segment + 1]

	t += (speed * delta) / p0.distance_to(p1)
	var interpolated = p0.lerp(p1, t)
	line.add_point(interpolated)

	if t >= 1.0:
		current_segment += 1
		t = 0.0
