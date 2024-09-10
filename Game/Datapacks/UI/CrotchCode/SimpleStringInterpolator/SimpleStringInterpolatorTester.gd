extends Control


func _on_TestButton_pressed():
	var theText = $VBoxContainer/TextEdit.text
	
	var interpolator = SimpleStringInterpolator.new()
	
	var result = interpolator.getLexems(theText)
	var processedResult = []
	for lexemData in result:
		lexemData[0] = SimpleStringInterpolator.lexToStr(lexemData[0])
		processedResult.append(lexemData)
	$VBoxContainer/RichTextLabel.text = str(processedResult)
	
	var vars = {
		"testBool": true,
		"testText": "MEOW meow Meow!",
		"testNumber": 123.123,
	}
	$VBoxContainer/RichTextLabel2.bbcode_text = interpolator.process(theText, vars)
