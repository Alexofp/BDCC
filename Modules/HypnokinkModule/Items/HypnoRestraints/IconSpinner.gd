extends Sprite3D

var time := 0.0
export var distMult := 0.125
export var frequency := 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(self.global_translation.z < 0):
		modulate = Color.transparent #hide the behind version
	#else:
	#	modulate = Color.white

	time += delta
	self.translation = Vector3(sin(time * frequency) * distMult, self.translation.y, self.translation.z)
