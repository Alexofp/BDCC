extends Node

var enabled:bool = false

var backends:Dictionary
var toys:Array

const BackendsFolder := "res://Util/SexToySupport/Backends/"

var rareTimer:float = 0.0

func _ready():
	if(true):
		return
	loadBackendByFolderName("ButtplugIO")

func setEnabled(_e:bool):
	enabled = _e

func addBackend(_backend):
	add_child(_backend)
	backends[_backend.id] = _backend

func loadBackendByFolderName(_folder:String):
	var _theScenePath:String = BackendsFolder.plus_file(_folder).plus_file(_folder+".tscn")
	
	var theScene:PackedScene = load(_theScenePath)
	if(!theScene):
		return
	addBackend(theScene.instance())

func _process(_delta:float):
	rareTimer += _delta
	if(rareTimer > 1.0):
		rareTimer = 0.0
		
		for backendID in backends:
			backends[backendID].processRare(1.0)

func saveData() -> Dictionary:
	return {
		enabled = enabled,
	}

func loadData(_data:Dictionary):
	enabled = SAVE.loadVar(_data, "enabled", false)
