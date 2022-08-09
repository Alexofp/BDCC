extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) var viewportPath
var viewport:Viewport

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_node(viewportPath)
	call_deferred("init_texture")


func init_texture():
	if(viewport == null):
		return
	#var renderTexture = ViewportTexture.new()
	#renderTexture.viewport_path = viewportPath
	#texture = renderTexture
	
	
	viewport.size = getPixelSize()
	#var camera:Camera2D = viewport.get_node("Camera2D")
	#camera.custom_viewport = viewport
	#viewport.size = rect_size
	#texture.viewport_path = get_path_to($Viewport)

func getPixelSize():
	var globalRect = get_global_rect()
	var newSize
	
	if(is_nan(globalRect.position.x) || is_nan(globalRect.position.y) || is_nan(globalRect.size.x) || is_nan(globalRect.size.y)):
		if(viewport == null):
			return Vector2(32, 32)
		return viewport.size
	
	if(get_viewport().is_size_override_enabled()):
		newSize = globalRect.size / get_viewport().get_size_override() * get_viewport().size
	else:
		newSize = globalRect.size
	
	return Vector2(round(newSize.x), round(newSize.y))
	#return Vector2(round(currentWindowSize.x/2), round(currentWindowSize.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(str(viewport.get_node("Camera2D").get_camera_screen_center()))
	#var currentWindowSize = OS.window_size

	#print(get_viewport().is_size_override_enabled()," ", currentWindowSize)
	#print(get_global_rect()," ",getPixelSize()," curWin:",currentWindowSize)

func _notification(what):
	if(viewport == null):
		return
	
	if what == NOTIFICATION_RESIZED:
		viewport.size = getPixelSize()#rect_size

func _input(event):
	if(viewport != null):
		var globalTrans = get_global_transform().affine_inverse()
		
		#var newevent = event.xformed_by(globalTrans.affine_inverse())
		
		var scale_xf:Transform2D = Transform2D.IDENTITY
		scale_xf = globalTrans.scaled(Vector2(1.0,1.0) / get_viewport().get_size_override() * get_viewport().size)
		#scale_xf = scale_xf.translated(camera.get_camera_screen_center())
		
		var newevent = event.xformed_by(scale_xf)
		
		viewport.input(newevent)

