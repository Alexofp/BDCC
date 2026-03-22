extends RigidBody

onready var tentacle_egg:MeshInstance = $TentacleEgg/TentacleEgg

const matPlant := preload("res://Player/Props/EggPlantMat.tres")
const matWhite := preload("res://Player/Props/EggWhiteMat.tres")
const matLatex := preload("res://Player/Props/LatexTentacles.tres")

func setPlant():
	tentacle_egg.set_surface_material(0, matPlant)

func setWhite(_color:Color = Color.white):
	var theMat := matWhite.duplicate()
	theMat.albedo_color = _color
	tentacle_egg.set_surface_material(0, theMat)

func setLatex():
	tentacle_egg.set_surface_material(0, matLatex)
