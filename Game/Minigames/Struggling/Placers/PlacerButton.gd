tool
extends Sprite

var _order_number := 1

func _enter_tree() -> void:
	_order_number = get_index() + 1
	$Label.text = str(_order_number)

func getData():
	return {
		"type": "button",
		"position": position / Vector2(1280.0, 720.0),
	}
