extends Reference
class_name CombatAnimBase

const REACTION_HURT := 0
const REACTION_NOTHING := 1

var id:String = ""
var animName:String = ""
var animNameKnockedDown:String = ""

var animTime:float = 2.0
var animTimeKnockedDown:float = -1.0

var fadeIn:float = 0.25
var fadeOut:float = 0.25

var transitionTo:String = "IDLE"
var isLooped:bool = false

var hitDelay:float = 0.3
var hitDelayKnockedDown:float = -1.0
var hitReaction:int = REACTION_HURT
