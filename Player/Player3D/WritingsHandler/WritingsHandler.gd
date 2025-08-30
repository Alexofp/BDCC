extends Node
class_name WritingsHandler

onready var viewport = $"%Viewport"
onready var update_timer = $"%UpdateTimer"
onready var layers = $"%Layers"

#TODO: A single viewport?

var mesh

func setData(_mesh):
	mesh = _mesh
	triggerUpdate()


func triggerUpdate():
	if(!update_timer.is_stopped()):
		return
	update_timer.start(RNG.randf_range(0.1, 0.2))

func doUpdate():
	viewport.size = Vector2(256, 256)
	Util.delete_children(layers)
	var _theData := getWritingsData()
	var _zones := getZonesInfo()
	
	if(!_theData.empty()):
		for zone in _zones:
			if(!_theData.has(zone)):
				continue
			var dataInfo:Array = _theData[zone]
			var zoneInfo:WritingZoneInfoNode = _zones[zone]
			for writingInfo in dataInfo:
				var newLabel:Label = Label.new()
				newLabel.text = writingInfo[0]
				layers.add_child(newLabel)
				newLabel.rect_position = zoneInfo.pos + Vector2(0.0, RNG.randf_range(0.0, 100.0))
	
	viewport.render_target_update_mode = Viewport.UPDATE_ONCE
	mesh.fancyMaterial.set_shader_param("texture_writings", viewport.get_texture())

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
