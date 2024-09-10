extends "res://Game/Datapacks/UI/CrotchCode/CodeBlockBase.gd"

var anim := CrotchSlotAnim.new()

func getCategories():
	return ["Scene"]

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	_contex.playAnim(anim.animID, anim.animData)
	return true

func getTemplate():
	return [
		{
			type = "label",
			text = "Play",
		},
		{
			id = "anim",
			type = "anim",
			value = anim,
			expand=true,
		},
	]
	
func getSlot(_id):
	if(_id == "anim"):
		return anim

func shouldExpandTemplate():
	return true
