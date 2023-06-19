extends MeshInstance
class_name MeshInstanceWithPattern

export var pattern_start:Vector2
export var pattern_size:Vector2 = Vector2(1.0, 1.0)
export(String, "head", "hair", "ears", "horns", "body", "arms", "breasts", "penis", "vagina", "anus", "tail", "legs") var bodypartSlot:String
export(Texture) var customOverlay = null
export(Texture) var customSkinPattern = null
export(Texture) var customAlbedo = null
var partRef
var fancyMaterial
var defaultOverlay = preload("res://Player/Player3D/Skins/defaultoverlay.png")

var materialWithSkin = preload("res://Player/Player3D/Skins/MaterialForPartWithSkin.tres")

func getPart():
	if(partRef == null):
		return null
	return partRef.get_ref()

func getDoll():
	var thePart = getPart()
	if(thePart == null):
		return null
	return thePart.getDoll()

func _ready():
	var albedoTexture
	if(customAlbedo != null):
		albedoTexture = customAlbedo
	else:
		var current_material = get_surface_material(0)
		albedoTexture = current_material.albedo_texture
	
	
	fancyMaterial = materialWithSkin.duplicate()
	if(customSkinPattern == null):
		fancyMaterial.set_shader_param("pattern_start", pattern_start / 2048.0 * 256.0)
		fancyMaterial.set_shader_param("pattern_size", pattern_size / 2048.0 * 256.0)
	else:
		fancyMaterial.set_shader_param("pattern_start", pattern_start)
		fancyMaterial.set_shader_param("pattern_size", pattern_size)
	fancyMaterial.set_shader_param("texture_albedo", albedoTexture)
	if(customOverlay != null):
		fancyMaterial.set_shader_param("texture_customOverlay", customOverlay)
	set_surface_material(0, fancyMaterial)

func updateMaterial():
	var theDoll = getDoll()
	if(theDoll != null):
		var skinData = theDoll.getSkinDataByID(bodypartSlot)
		if(skinData != null):
			#fancyMaterial = materialWithSkin.duplicate()
			if(customSkinPattern != null):
				fancyMaterial.set_shader_param("texture_pattern", customSkinPattern)
			elif(skinData.has("skin")):
				var theSkin = GlobalRegistry.getSkin(skinData["skin"])
				if(theSkin != null):
					fancyMaterial.set_shader_param("texture_pattern", theSkin.getPatternTexture())
			
			if(skinData.has("r")):
				fancyMaterial.set_shader_param("pattern_red_color", skinData["r"])
			else:
				fancyMaterial.set_shader_param("pattern_red_color", Color.white)
			if(skinData.has("g")):
				fancyMaterial.set_shader_param("pattern_green_color", skinData["g"])
			else:
				fancyMaterial.set_shader_param("pattern_green_color", Color.white)
			if(skinData.has("b")):
				fancyMaterial.set_shader_param("pattern_blue_color", skinData["b"])
			else:
				fancyMaterial.set_shader_param("pattern_blue_color", Color.white)
			#print(skinData)
