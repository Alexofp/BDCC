extends Spatial

var tween1
var tween2

func _ready():
	randomColorTween()
	randomColorTween2()

func tweenModuleTo(theSprite:Sprite3D, targetColor:Color, howLong, theTween, callbackfunc):
	if(theTween):
		theTween.kill()
	theTween = create_tween()
	theTween.tween_property(theSprite, "modulate", targetColor, howLong).set_delay(0.5)
	theTween.tween_callback(self, callbackfunc)

func randomColorTween():
	tweenModuleTo($Lines1, Color.from_hsv(RNG.randf_range(0.0, 1.0), 1.0, 1.0), RNG.randf_range(0.5, 1.5), tween1, "randomColorTween")
func randomColorTween2():
	tweenModuleTo($Lines2, Color.from_hsv(RNG.randf_range(0.0, 1.0), 1.0, 1.0), RNG.randf_range(0.5, 1.5), tween2, "randomColorTween2")
