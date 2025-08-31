extends Node
class_name WritingsHandler

onready var viewport = $"%Viewport"
onready var update_timer = $"%UpdateTimer"
onready var layers = $"%Layers"

const WritingsFont = preload("res://Fonts/BodyWritingsFont.tres")
const EmptyTexture = preload("res://Player/Player3D/Skins/defaultoverlay.png")

#TODO: A single viewport?

var meshTextureSize:Vector2
const meshTextureSizeDiv:int = 1

var mesh

func setData(_mesh):
	mesh = _mesh
	meshTextureSize = mesh.albedoTextureSize / meshTextureSizeDiv
	triggerUpdate()


func triggerUpdate():
	if(!update_timer.is_stopped()):
		return
	update_timer.start(RNG.randf_range(0.1, 0.2))

func doUpdate():
	viewport.size = meshTextureSize#Vector2(256, 256)
	Util.delete_children(layers)
	var _theData := getWritingsData()
	var _zones := getZonesInfo()
	
	var _isLookingLeft:bool = isLookingLeft()
	var scaleRightMod:float = 1.0 if _isLookingLeft else -1.0
#	if(isLookingLeft()):
#		layers.rect_scale = Vector2(1.0, 1.0)
#		layers.rect_position = Vector2(0.0, 0.0)
#	else:
#		layers.rect_scale = Vector2(-1.0, 1.0)
#		layers.rect_position = Vector2(layers.rect_size.x, 0.0)
	var shouldRender:bool = false
	
	if(!_theData.empty()):
		for zone in _zones:
			var dataZone:int = zone
			if(!_isLookingLeft):
				dataZone = WritingZoneInfoNode.OPPOSITE[zone] if WritingZoneInfoNode.OPPOSITE.has(zone) else zone
			
			if(!_theData.has(dataZone)):
				continue
			var dataInfo:Array = _theData[dataZone]
			var zoneInfo:WritingZoneInfoNode = _zones[zone]
			if(_isLookingLeft && !zoneInfo.showLeft):
				continue
			if(!_isLookingLeft && !zoneInfo.showRight):
				continue
			
			var maxWritings:int = zoneInfo.maxWritings
			
			var vbox:VBoxContainer = VBoxContainer.new()
			layers.add_child(vbox)
			vbox.rect_position = zoneInfo.pos#(zoneInfo.pos + Vector2(RNG.randf_range(-zoneInfo.posSpread, zoneInfo.posSpread), RNG.randf_range(-zoneInfo.posSpread, zoneInfo.posSpread)))/meshTextureSizeDiv
			vbox.rect_rotation = zoneInfo.rot + RNG.randf_range(-zoneInfo.rotSpread, zoneInfo.rotSpread)
			vbox["custom_constants/separation"] = -5.0
			vbox.rect_scale = Vector2(zoneInfo.scale, zoneInfo.scale)
			
			var _i:int = 0
			for writingInfo in dataInfo:
				if(_i >= maxWritings):
					break
				var newLabel:Label = Label.new()
				newLabel.align = Label.ALIGN_CENTER
				newLabel["custom_fonts/font"] = WritingsFont
				newLabel["custom_colors/font_color"] = Color.black
				newLabel.text = writingInfo[0]
				vbox.add_child(newLabel)
				shouldRender = true
				
				#newLabel.rect_position.x = RNG.randf_range(-60.0, 60.0)
				#newLabel.rect_rotation = RNG.randf_range(-30.0, 30.0)
#				newLabel.rect_position = (zoneInfo.pos + Vector2(RNG.randf_range(-zoneInfo.posSpread, zoneInfo.posSpread), RNG.randf_range(-zoneInfo.posSpread, zoneInfo.posSpread)))/meshTextureSizeDiv
#				newLabel.rect_rotation = zoneInfo.rot + RNG.randf_range(-zoneInfo.rotSpread, zoneInfo.rotSpread)
#				newLabel.rect_pivot_offset = newLabel.rect_size / 2.0
#				newLabel.rect_position -= newLabel.rect_pivot_offset
#				newLabel.rect_scale.x = scaleRightMod
				_i += 1
			
			call_deferred("fixVbox", vbox, scaleRightMod)
			#vbox.rect_pivot_offset = vbox.get_rect().size / 2.0
			#vbox.rect_position -= vbox.rect_pivot_offset
			#vbox.rect_scale.x = scaleRightMod
	if(shouldRender):
		viewport.size = meshTextureSize
		viewport.render_target_update_mode = Viewport.UPDATE_ONCE
		var theTexture:ViewportTexture= viewport.get_texture()
		theTexture.flags = theTexture.FLAG_FILTER
		mesh.fancyMaterial.set_shader_param("texture_writings", theTexture)
	else:
		#viewport.size = Vector2(0, 0)
		mesh.fancyMaterial.set_shader_param("texture_writings", EmptyTexture)

func fixVbox(vbox:VBoxContainer, scaleRightMod:float):
	vbox.rect_pivot_offset = vbox.get_rect().size / 2.0
	vbox.rect_position -= vbox.rect_pivot_offset
	vbox.rect_scale.x = abs(vbox.rect_scale.x) * scaleRightMod
	call_deferred("randomizeLabels", vbox)
	#for labelA in vbox.get_children():
	#	var newLabel:Label = labelA
	#	newLabel.rect_rotation = RNG.randf_range(-20.0, 20.0)
	#	newLabel.rect_position.x = RNG.randf_range(-60.0, 60.0)

func randomizeLabels(vbox:VBoxContainer):
	for labelA in vbox.get_children():
		var newLabel:Label = labelA
		newLabel.rect_rotation = RNG.randf_range(-3.0, 3.0)
		newLabel.rect_position.x = RNG.randf_range(-10.0, 10.0)

func _on_UpdateTimer_timeout():
	doUpdate()

func updateFacing():
	triggerUpdate()

# Right = texture needs to be mirrored. Left = no mirror
func isLookingLeft() -> bool:
	var theDoll = mesh.getDoll()
	return !theDoll.isFacingRight

func getWritingsData() -> Dictionary:
	return mesh.getDoll().writingsData

func getZonesInfo() -> Dictionary:
	return mesh.writingZoneInfos
