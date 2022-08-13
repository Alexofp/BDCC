extends Reference
class_name MyProjectSettings

# Reason for this class is that default ProjectSettings.save_custom() saves literally every setting while we only need these 2

const settingsPath = "user://override.cfg"

var driverName = "GLES3"
var forceSoftwareSkinning = false

func setDriverName(newDriverName:String):
	if(!(newDriverName in ["GLES2", "GLES3"])):
		return false
	driverName = newDriverName
	return true

func setForceSoftwareSkinning(newForce:bool):
	forceSoftwareSkinning = newForce

func _init():
	driverName = ProjectSettings.get_setting("rendering/quality/driver/driver_name")
	forceSoftwareSkinning = ProjectSettings.get_setting("rendering/quality/skinning/force_software_skinning")
	
func save():
	var text = "config_version=4\n"
	text += "[rendering]\n"
	text += "quality/driver/driver_name=\""+driverName+"\"\n"
	if(forceSoftwareSkinning):
		text += "quality/skinning/force_software_skinning=true\n"
	else:
		text += "quality/skinning/force_software_skinning=false\n"
	
	var file = File.new()
	file.open(settingsPath, file.WRITE_READ)
	file.store_string(text)
	file.close()

func resetToDefault():
	var dir = Directory.new()
	if(dir.file_exists(settingsPath)):
		dir.remove(settingsPath)
