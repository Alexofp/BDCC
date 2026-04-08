extends Reference
class_name SexToyEffectEntry

var type:int = SexToyEffect.SEQUENCE
var group:int = SexToyGroup.Main

var curve:Curve = Curve.new()
var curveTime:float = 3.0

var sequence:Array = [1.0, 0.5, 0.7, 0.5, 1.0, 0.5] # [strength, time, strength, time, strength, time]
