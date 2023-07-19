extends MeshInstance
class_name MeshInstanceWithPattern

export var pattern_start:Vector2
export var pattern_size:Vector2 = Vector2(1.0, 1.0)
export(String, "head", "hair", "ears", "horns", "body", "arms", "breasts", "penis", "vagina", "anus", "tail", "legs") var bodypartSlot:String
export(Texture) var customOverlay = null
export(Texture) var customSkinPattern = null
export(Texture) var customAlbedo = null
export(bool) var showCumLayer = true
export(Vector2) var cumLayerScale = Vector2(1.0, 1.0)
export(String) var custonSkinVariant = ""
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
	if(!OPTIONS.shouldUseAdvancedShaders()):
		return
	
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
		fancyMaterial.set_shader_param("cum_scale", Vector2(5.0, 5.0) * cumLayerScale)
	else:
		fancyMaterial.set_shader_param("pattern_start", pattern_start)
		fancyMaterial.set_shader_param("pattern_size", pattern_size)
		fancyMaterial.set_shader_param("cum_scale", Vector2(0.5, 0.5) * cumLayerScale)
	fancyMaterial.set_shader_param("texture_albedo", albedoTexture)
	if(customOverlay != null):
		fancyMaterial.set_shader_param("texture_customOverlay", customOverlay)
	fancyMaterial.set_shader_param("random_shift", RNG.randf_range(0.0, 1000.0))
	set_surface_material(0, fancyMaterial)

func updateMaterial():
	if(!OPTIONS.shouldUseAdvancedShaders()):
		return
	
	var theDoll = getDoll()
	if(theDoll != null):
		if(showCumLayer && theDoll.getCumAmount() > 0):
			fancyMaterial.set_shader_param("cum_transparency", 1.0)
			fancyMaterial.set_shader_param("cum_amount", theDoll.getCumAmount())
			fancyMaterial.set_shader_param("cum_color", theDoll.getCumColor())
		else:
			fancyMaterial.set_shader_param("cum_transparency", 0.0)
			fancyMaterial.set_shader_param("cum_amount", 0)
		
		var skinData = theDoll.getSkinDataByID(bodypartSlot)
		if(skinData != null):
			#fancyMaterial = materialWithSkin.duplicate()
			if(skinData.has("partskin") && skinData.has("partid")):
				var theSkin = GlobalRegistry.getPartSkin(skinData["partid"], skinData["partskin"])
				if(theSkin != null):
					var thePatternTexture = theSkin.getPatternTexture()
					if(thePatternTexture != null):
						if(thePatternTexture is Dictionary):
							if(thePatternTexture.has(custonSkinVariant)):
								fancyMaterial.set_shader_param("texture_pattern", thePatternTexture[custonSkinVariant])
							elif(customSkinPattern != null):
								fancyMaterial.set_shader_param("texture_pattern", customSkinPattern)
						else:
							fancyMaterial.set_shader_param("texture_pattern", thePatternTexture)
					elif(customSkinPattern != null):
						fancyMaterial.set_shader_param("texture_pattern", customSkinPattern)
			elif(customSkinPattern != null):
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
