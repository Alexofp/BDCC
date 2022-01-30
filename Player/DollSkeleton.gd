extends Skeleton2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var posLeft = $Hip/LLeg.global_position
	var posRight = $Hip/RLeg.global_position
	print(str(posLeft)+" "+str(posRight))
	
	var difference = posLeft - posRight
	print(str(difference))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
