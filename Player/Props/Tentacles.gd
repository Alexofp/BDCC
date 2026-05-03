extends Spatial

var isPlant = false

onready var animation_player = $AnimationPlayer
onready var animation_player3 = $TentaclesAnims3/AnimationPlayer
onready var tentacle_tiny = $TentaclesTiny/TentaclesArmature/Skeleton/TentacleTiny
onready var tentacle = $TentaclesArmature/Skeleton/Tentacle

func _ready():
	setBig()
	tentacle.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	tentacle_tiny.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	setPlant()
	
func setPlant():
	if(isPlant):
		return
	
	tentacle.set_surface_material(0, preload("res://Player/Props/PlantTentaclesCustom.tres"))
	tentacle_tiny.set_surface_material(0, preload("res://Player/Props/PlantTentaclesCustom.tres"))
	
	isPlant = true

func setLatex():
	if(true):
		return
	if(!isPlant):
		return
	
	tentacle.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	tentacle_tiny.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	
	isPlant = false

func setTiny():
	tentacle.visible = false
	tentacle_tiny.visible = true

func setBig():
	tentacle.visible = true
	tentacle_tiny.visible = false

func setSceneOptions(_args:Dictionary):
	if(_args.has("plant") && _args["plant"]):
		setPlant()
	else:
		setLatex()
	
	if(_args.has("tentaclesLess") && _args["tentaclesLess"]):
		setTiny()
	else:
		setBig()
	
	#setPlant()
	#setTiny()
