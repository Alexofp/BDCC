extends FluidProduction
class_name PeeProduction

var pisser = null

func _init(character):
    pisser = character

func getCapacity() -> float:
    var mult: float = 1.0
    var pc = getCharacter()
    if(pc != null):
        mult += pc.getCustomAttribute(BuffAttribute.PissCapacityMult)

    return 500 * mult

func getProductionSpeedPerHour() -> float:
    if(!shouldProduce()):
        return 0.0

    var mult = 1.0
    var pc = getCharacter()
    if(pc != null):
        mult += pc.getCustomAttribute(BuffAttribute.PissProductionMult)
    
    # The variance is arbitrary. It just felt weird always producing
    # 100ml per hour.
    var produced = (100 + RNG.randf_range(-30, 30)) * mult
    return produced

func getFluidSource():
    return FluidSource.Pissing

func getFluidType():
    return "Piss"

func getCharacter():
    return pisser