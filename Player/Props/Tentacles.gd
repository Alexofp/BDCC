extends Spatial

var isPlant = false

func setPlant():
	if(isPlant):
		return
	
	$TentaclesArmature/Skeleton/Tentacle.set_surface_material(0, preload("res://Player/Props/PlantTentacles.tres"))
	$DirectionalLight.visible = true
	$DirectionalLight2.visible = true
	
	isPlant = true

func setLatex():
	if(!isPlant):
		return
	
	$TentaclesArmature/Skeleton/Tentacle.set_surface_material(0, preload("res://Player/Props/LatexTentacles.tres"))
	$DirectionalLight.visible = false
	$DirectionalLight2.visible = false
	
	isPlant = false
