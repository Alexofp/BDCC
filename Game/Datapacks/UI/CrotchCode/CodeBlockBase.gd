extends Reference

var id = "error"

func execute():
	pass

func getValue():
	return execute()

func getTemplate():
	return [
		{
			type = "label",
			text = "MEOW",
		},
	]

func getSlot(_id):
	return null
