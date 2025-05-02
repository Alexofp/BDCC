extends Object
class_name BreastsSize

enum {
	FOREVER_FLAT = -1,
	FLAT = 0,
	A = 1,
	B = 2,
	C = 3,
	D = 4,
	DD = 5,
	DDD = 6,
	G = 7,
	H = 8,
	I = 9,
	J = 10,
	K = 11,
	L = 12,
	M = 13,
	N = 14,
	O = 15,
}

static func getAll():
	return [FOREVER_FLAT, FLAT, A, B, C, D, DD, DDD, G, H, I, J, K, L, M, N, O]

static func breastSizeToString(bsize:int):
	return breastSizeToNameProcedural(bsize, "")
#	var names = {FOREVER_FLAT:"Forever flat", FLAT:"Flat", A:"A", B:"B", C:"C", D:"D", DD:"DD", DDD:"DDD", G:"G", H:"H", I:"I", J:"J", K:"K", L:"L", M:"M", N:"N", O:"O"}
#	#print(bsize," ",names[bsize])
#	if(names.has(bsize)):
#
#
#		return names[bsize]
#	if(bsize < -1):
#		return "Forever flat"
#	return "O+"

static func getAllSizesWithNames():
	var result = []
	for size in getAll():
		result.append([size, breastSizeToString(size)])
	return result

static func breastSizeToCupString(bsize:int):
	return breastSizeToNameProcedural(bsize)
#	var cupName = breastSizeToString(bsize)
#	if(bsize <= 0):
#		return cupName
#	if(bsize >= O):
#		return "O+ cup"
#	return cupName+"-cup"

static func breastSizeToMilkAmount(bsize:int):
	var amounts = {FOREVER_FLAT: 0.0, FLAT: 0.5, A: 1.0, B: 1.5, C: 3.0, D: 5.0, DD: 8.0, DDD: 10.0, G: 12.0, H: 15.0, I: 20.0, J: 25.0, K: 32.0, L: 40.0, M: 50.0, N: 65.0, O: 80.0}
	
	if(amounts.has(bsize)):
		return amounts[bsize]
	
	if(bsize <= 0):
		return 0.0
	
	return 100.0

static func breastSizeToBoneScale(bsize:int):
	var sizes = {FOREVER_FLAT: 1.0, FLAT: 1.0, A: 0.5, B: 0.6, C: 0.8, D: 1.0, DD: 1.1, DDD: 1.2, G: 1.3, H: 1.4, I: 1.5, J: 1.6, K: 1.7, L: 1.8, M: 1.9, N: 2.0, O: 2.1}
	
	if(sizes.has(bsize)):
		return sizes[bsize]
	
	if(bsize <= 0):
		return 1.0
	
	var lastKey = O
	return sizes[lastKey] + float(bsize - lastKey) / 10.0

# Flat | A-cup | B-cup | C-cup | D-cup | DD-cup | DDD-cup | G-cup | H-cup | I-cup | J-cup | K-cup | L-cup | M-cup | N-cup | O-cup | P-cup | Q-cup | R-cup | S-cup | T-cup | U-cup | V-cup | W-cup | X-cup | Y-cup | Z-cup | ZA-cup | ZB-cup | ZC-cup | ZD-cup | ZE-cup | ZF-cup | ZG-cup | ZH-cup | ZI-cup | ZJ-cup | ZK-cup | ZL-cup | ZM-cup | ZN-cup | ZO-cup | ZP-cup | ZQ-cup | ZR-cup | ZS-cup | ZT-cup | ZU-cup | ZV-cup | ZW-cup | ZX-cup | ZY-cup | ZZ-cup | ZZA-cup | ZZB-cup | ZZC-cup | ZZD-cup | ZZE-cup | ZZF-cup | ZZG-cup | ZZH-cup | ZZI-cup | ZZJ-cup ..........
static func breastSizeToNameProcedural(bsize:int, cupEnding:String="-cup"):
	if(bsize <= -1):
		return "Forever flat"
	if(bsize <= 0):
		return "Flat"
	
	var names:Dictionary = {A:"A", B:"B", C:"C", D:"D", DD:"DD", DDD:"DDD"}
	if(names.has(bsize)):
		return names[bsize]+cupEnding
	
	var base_char:int = ord('A')
	var cup_char_ind:int = (bsize)
	var finalCupLetter:String = ""
	while(cup_char_ind >= 26):
		cup_char_ind -= 26
		finalCupLetter += "Z"
	if(cup_char_ind > 0):
		finalCupLetter += char(base_char - 1 + cup_char_ind)
	return finalCupLetter + cupEnding
