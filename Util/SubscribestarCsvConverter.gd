extends Control


func _on_Button_pressed():
	$VBoxContainer/TextEdit2.text = JSON.print(getData(), "\t", true)
	
func getData():
	var text = $VBoxContainer/TextEdit.text
	
	var lines = text.split("\n", false)
	#print(lines)
	if(lines.size() <= 0):
		return
	
	var fields = lines[0].split(";")
	#print(fields)
	
	var data = []
	lines.remove(0)
	
	for line in lines:
		var newData = {}
		
		
		var lineData = line.split(";")
		for _i in range(lineData.size()):
			if(_i >= fields.size()):
				continue
			
			var fieldName = fields[_i]
			newData[fieldName] = lineData[_i]
			
		data.append(newData)
	
	data.sort_custom(self, "sort_my")
	
	return data
	
func sort_my(a, b):
	if a["gross"] > b["gross"]:
		return true
	return false


func _on_Button2_pressed():
	var dateDict = OS.get_date()
	var dateStr = Util.dateToString(dateDict)
	
	var newText = "[center][b][url=https://subscribestar.adult/rahi]SubscribeStar[/url][/b]\nCompiled "+str(dateStr)+"\n\n"
	
	for entry in getData():
		newText += entry["nickname"]+" - "+entry["gross"]+"\n"
	newText += "\nThank you [color=red]<3[/color][/center]"
	
	$VBoxContainer/TextEdit2.text = newText


func _on_Button3_pressed():
	var data = getData()
	
	var dateDict = OS.get_date()
	var dateStr = Util.dateToString(dateDict)
	
	var newdata = []
	for entry in data:
		newdata.append({
			"nickname": entry["nickname"],
			"gross": entry["gross"],
			"tier": entry["tier"],
		})
	var result = {
		"dateString": dateStr,
		"entries": newdata,
	}
	
	$VBoxContainer/TextEdit2.text = JSON.print(result, "\t", true)
