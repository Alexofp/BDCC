extends SceneBase

var bodyId: String

func onInduction(_args = []):
	GM.main.setFlag("HypnokinkModule.SoftOptIn", true)
	GM.pc.addEffect(StatusEffect.UnderHypnosis)
	GM.pc.addEffect(StatusEffect.Suggestible, [30])
	processTime(10*60)
	bodyId = _args[0]
	
func afterInduction():
	runScene(bodyId)

func saveData():
	var data = .saveData()
	data["bodyId"] = bodyId
	
	return data

func loadData(data):
	.loadData(data)
	bodyId = SAVE.loadVar(bodyId, "bodyId", null)
