extends ColorRect

var colour = Color.white
var radius = 10.0
var offset = 90.0
var size = 45
var number = 0 

func _ready() -> void:
	number = RNG.randi_range(1, 6)

func _draw():
	match number:
		1:
			draw_circle(Vector2(offset + 0, offset + 0), radius, colour)
		2:
			draw_circle(Vector2(offset + size, offset - size), radius, colour)
			draw_circle(Vector2(offset - size, offset + size), radius, colour)
		3:
			draw_circle(Vector2(offset + 0, offset + 0), radius, colour)
			draw_circle(Vector2(offset + size, offset - size), radius, colour)
			draw_circle(Vector2(offset - size, offset + size), radius, colour)
		4:
			draw_circle(Vector2(offset - size, offset - size), radius, colour)
			draw_circle(Vector2(offset - size, offset + size), radius, colour)
			draw_circle(Vector2(offset + size, offset - size), radius, colour)
			draw_circle(Vector2(offset + size, offset + size), radius, colour)
		5:
			draw_circle(Vector2(offset + 0, offset + 0), radius, colour)
			draw_circle(Vector2(offset - size, offset - size), radius, colour)
			draw_circle(Vector2(offset - size, offset + size), radius, colour)
			draw_circle(Vector2(offset + size, offset - size), radius, colour)
			draw_circle(Vector2(offset + size, offset + size), radius, colour)
		6:
			draw_circle(Vector2(offset + size, offset - 0), radius, colour)
			draw_circle(Vector2(offset - size, offset + 0), radius, colour)
			draw_circle(Vector2(offset - size, offset - size), radius, colour)
			draw_circle(Vector2(offset - size, offset + size), radius, colour)
			draw_circle(Vector2(offset + size, offset - size), radius, colour)
			draw_circle(Vector2(offset + size, offset + size), radius, colour)
		_:
			draw_circle(Vector2(offset + 0, offset + 0), 0, colour)
