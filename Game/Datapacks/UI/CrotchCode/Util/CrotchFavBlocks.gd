extends Node

var isLoaded:bool = false
const filepath = "user://codeblocks_fav.res"

var blocks = {}

signal onBlocksChanged

func emitBlocksChanged():
	emit_signal("onBlocksChanged")

func getBlocks(kind:String):
	loadIfNeeded()
	if(!blocks.has(kind)):
		return []
	return blocks[kind]

func saveBlock(kind:String, codeBlock):
	loadIfNeeded()
	if(!blocks.has(kind)):
		blocks[kind] = []
		
	var blockCopy = CrotchBlocks.createBlock(codeBlock.id)
	if(blockCopy == null):
		return
	blockCopy.loadData(codeBlock.saveData().duplicate(true))
		
	blocks[kind].append(blockCopy)
	saveToFile()

func removeBlock(kind:String, codeBlock):
	loadIfNeeded()
	if(!blocks.has(kind)):
		return false
	
	if(blocks[kind].has(codeBlock)):
		var _ok = blocks[kind].erase(codeBlock)
		saveToFile()
	

func saveData():
	var blocksData = {}
	for blocksKind in blocks:
		blocksData[blocksKind] = []
		
		for codeBlock in blocks[blocksKind]:
			blocksData[blocksKind].append({
				id = codeBlock.id,
				data = codeBlock.saveData(),
			})
	
	return {
		blocks = blocksData,
	}

func loadData(_data):
	blocks = {}
	var blocksAllData = loadVar(_data, "blocks", {})
	
	for blocksKind in blocksAllData:
		blocks[blocksKind] = []
		var blocksData = blocksAllData[blocksKind]
	
		for codeBlockData in blocksData:
			if(!(codeBlockData is Dictionary) || !codeBlockData.has("id") || !codeBlockData.has("data")):
				continue
			var blockID = codeBlockData["id"]
			var blockData = codeBlockData["data"]
			
			var newBlock = CrotchBlocks.createBlock(blockID)
			if(newBlock == null):
				continue
			newBlock.loadData(blockData)
			blocks[blocksKind].append(newBlock)

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func saveToFile():
	var newDatapackResource:CrotchFavBlocksResource = CrotchFavBlocksResource.new()
	newDatapackResource.version = 1
	newDatapackResource.data = saveData()
	var result = ResourceSaver.save(filepath, newDatapackResource)
	if(result == OK):
		return true
	return false

func loadFromFile():
	if(ResourceLoader.exists(filepath)):
		var newPackResource = ResourceLoader.load(filepath)
		
		if(newPackResource is CrotchFavBlocksResource):
			loadData(newPackResource.data)
			isLoaded = true
			return
	loadData({})
	isLoaded = true

func loadIfNeeded():
	if(!isLoaded):
		loadFromFile()
