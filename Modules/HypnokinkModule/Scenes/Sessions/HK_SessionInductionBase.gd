extends SceneBase
class_name HK_SessionInductionBase

var bodyId: String

func onInduction(_args = []):
	GM.pc.addEffect(HK_StatusEffect.UnderHypnosis)
	GM.pc.addEffect(HK_StatusEffect.Suggestible, [30])
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
