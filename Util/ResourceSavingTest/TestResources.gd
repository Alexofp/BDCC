extends Control



func _on_Button_pressed():
	var newTestRes:TestResource = TestResource.new()
	
	newTestRes.someName = "HAHA"
	#newTestRes.anTexture = load("res://Util/ResourceSavingTest/testres.png")
	#newTestRes.dataaa = newTestRes.anTexture.get_data()
	newTestRes.testDic = {"SOME FIELD": "YAAA TEXT", "somenum": 10.69, "imageinhere": load("res://Util/ResourceSavingTest/testres.png").get_data()}

	var result = ResourceSaver.save("user://MYTEST.tres", newTestRes,  ResourceSaver.FLAG_COMPRESS)
	assert(result == OK)


func _on_Button2_pressed():
	var newTestRes:TestResource = ResourceLoader.load("user://MYTEST.tres")

	print(newTestRes.someName)
	var imText = ImageTexture.new()
	imText.create_from_image(newTestRes.data)
	$TextureRect.texture = imText
