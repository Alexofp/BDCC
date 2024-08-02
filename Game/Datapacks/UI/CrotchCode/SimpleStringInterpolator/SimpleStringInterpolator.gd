extends Reference
class_name SimpleStringInterpolator

const LEX_TEXT = 0
const LEX_EOF = 1
const LEX_START = 2
const LEX_END = 3
const LEX_IF = 4
const LEX_ELSE = 5
const LEX_VAR = 6
const LEX_STRING = 7
const LEX_UNEXPECTED = 8

static func lexToStr(LEX):
	if(LEX == LEX_TEXT):
		return "LEX_TEXT"
	if(LEX == LEX_EOF):
		return "LEX_EOF"
	if(LEX == LEX_START):
		return "LEX_START"
	if(LEX == LEX_END):
		return "LEX_END"
	if(LEX == LEX_IF):
		return "LEX_IF"
	if(LEX == LEX_ELSE):
		return "LEX_ELSE"
	if(LEX == LEX_VAR):
		return "LEX_VAR"
	if(LEX == LEX_STRING):
		return "LEX_STRING"
	if(LEX == LEX_UNEXPECTED):
		return "BAD_CHARACTER"
	return "ERROR"

const STATE_NORMAL = 0
const STATE_STARTED = 1
const STATE_GOT_VARORSTRING = 2
const STATE_GOT_IF = 3
const STATE_GOT_IF_VAR = 4
const STATE_GOT_IF_VAR_ELSE = 5
const STATE_GOT_IF_VAR_ELSE_VARORSTRING = 6

func process(_text:String, variablesObject) -> String:
	var _lexems = getLexems(_text)
	
	var result:String = ""
	
	var state = STATE_NORMAL
	
	var firstVarLex = null
	var secondVarLex = null
	var thirdVarLex = null
	
	while(!_lexems.empty()):
		var curLexData = _lexems[0]
		_lexems.pop_front()
		var curLex = curLexData[0]
		
		if(state == STATE_NORMAL):
			if(curLex == LEX_TEXT):
				result += curLexData[1]
			elif(curLex == LEX_EOF):
				break
			elif(curLex == LEX_START):
				state = STATE_STARTED
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex)))
		elif(state == STATE_STARTED):
			if(curLex in [LEX_STRING, LEX_VAR]):
				firstVarLex = curLexData
				state = STATE_GOT_VARORSTRING
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: variable or string")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
		elif(state == STATE_GOT_VARORSTRING):
			if(curLex == LEX_END):
				if(firstVarLex[0] == LEX_STRING):
					result += firstVarLex[1]
				elif(firstVarLex[0] == LEX_VAR):
					var varName = firstVarLex[1]
					if(variablesObject.hasInterpolatorVar(varName)):
						result += str(variablesObject.getInterpolatorVar(varName))
					else:
						result += insertError("VARIABLE NOT DEFINED: "+str(varName))
						while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
							_lexems.pop_front()
						state = STATE_NORMAL
				state = STATE_NORMAL
			elif(curLex == LEX_IF):
				state = STATE_GOT_IF
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: if or }}")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
		elif(state == STATE_GOT_IF):
			if(curLex == LEX_VAR):
				secondVarLex = curLexData
				state = STATE_GOT_IF_VAR
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: variable")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
		elif(state == STATE_GOT_IF_VAR):
			if(curLex == LEX_END):
				var varName = secondVarLex[1]
				if(variablesObject.hasInterpolatorVar(varName)):
					if(variablesObject.getInterpolatorVar(varName)): # if var is truthy
						if(firstVarLex[0] == LEX_STRING):
							result += firstVarLex[1]
						elif(firstVarLex[0] == LEX_VAR):
							var varNameFirst = firstVarLex[1]
							
							if(variablesObject.hasInterpolatorVar(varNameFirst)):
								result += str(variablesObject.getInterpolatorVar(varNameFirst))
							else:
								result += insertError("VARIABLE NOT DEFINED: "+str(varNameFirst))
								while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
									_lexems.pop_front()
								state = STATE_NORMAL
				else:
					result += insertError("VARIABLE NOT DEFINED: "+str(varName))
					while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
						_lexems.pop_front()
					state = STATE_NORMAL
				state = STATE_NORMAL
			elif(curLex == LEX_ELSE):
				state = STATE_GOT_IF_VAR_ELSE
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: else or }}")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
		elif(state == STATE_GOT_IF_VAR_ELSE):
			if(curLex in [LEX_STRING, LEX_VAR]):
				thirdVarLex = curLexData
				state = STATE_GOT_IF_VAR_ELSE_VARORSTRING
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: variable or string")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
		elif(state == STATE_GOT_IF_VAR_ELSE_VARORSTRING):
			if(curLex == LEX_END):
				var varName = secondVarLex[1]
				
				if(variablesObject.hasInterpolatorVar(varName)):
					if(variablesObject.getInterpolatorVar(varName)):
						if(firstVarLex[0] == LEX_STRING):
							result += firstVarLex[1]
						elif(firstVarLex[0] == LEX_VAR):
							var varNameFirst = firstVarLex[1]
							
							if(variablesObject.hasInterpolatorVar(varNameFirst)):
								result += str(variablesObject.getInterpolatorVar(varNameFirst))
							else:
								result += insertError("VARIABLE NOT DEFINED: "+str(varNameFirst))
								while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
									_lexems.pop_front()
								state = STATE_NORMAL
					else:
						if(thirdVarLex[0] == LEX_STRING):
							result += thirdVarLex[1]
						elif(thirdVarLex[0] == LEX_VAR):
							var varNameThird = thirdVarLex[1]
							
							if(variablesObject.hasInterpolatorVar(varNameThird)):
								result += str(variablesObject.getInterpolatorVar(varNameThird))
							else:
								result += insertError("VARIABLE NOT DEFINED: "+str(varNameThird))
								while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
									_lexems.pop_front()
								state = STATE_NORMAL
				else:
					result += insertError("VARIABLE NOT DEFINED: "+str(varName))
					while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
						_lexems.pop_front()
					state = STATE_NORMAL
				state = STATE_NORMAL
			else:
				result += insertError("Unexpected token: "+str(lexToStr(curLex))+". Expected: }}")
				while(_lexems.size() > 0 && _lexems[0][0] != LEX_TEXT && _lexems[0][0] != LEX_EOF): # Skip all garbage
					_lexems.pop_front()
				state = STATE_NORMAL
			
	return result

func insertError(errorText):
	return "[color=red]!SYNTAX_ERROR: "+str(errorText)+"![/color]"
	
var curI:int
var curText:String
func getLexems(text:String) -> Array:
	if(text == ""):
		return [[LEX_EOF]]
	var result = []
	
	curText = text
	curI = 0
	
	var savedNormalText:String = ""
	var savedVarText:String = ""
	
	var varchars = Util.letters_chars+Util.numbers_chars+["_"]
	
	while(curChar() != ""):
		var c = curChar()
		
		if(c == "\\" && peekNext() == "{"): # Escaping { in case you need it
			savedNormalText += readNext()
		elif(c == "{" && peekNext() == "{"):
			# Variable/if expression began
			if(savedNormalText != ""): # Flush generic text into the result
				result.append([LEX_TEXT, savedNormalText])
				savedNormalText = ""
			
			skipNext()
			skipNext() # Skip the second {
			result.append([LEX_START])
			
			# We're inside the {{ }} block
			while(curChar() != ""):
				c = curChar()
				
				if(c == "}" && peekNext() == "}"):
					# Found the end tag
					if(savedVarText != ""):
						result.append([LEX_VAR, savedVarText])
						savedVarText = ""
					
					result.append([LEX_END])
					skipNext()
					break
				
				if(c == "\""):
					skipNext()
					result.append([LEX_STRING, readString()])
				elif(c == "i" && peekNext() == "f" && !(peekNext(2).to_lower() in varchars)):
					skipNext()
					#skipNext()
					result.append([LEX_IF])
				elif(c == "e" && peekNext() == "l" && peekNext(2) == "s" && peekNext(3) == "e" && !(peekNext(4).to_lower() in varchars)):
					skipNext()
					skipNext()
					skipNext()
					#skipNext()
					result.append([LEX_ELSE])
				elif(c.to_lower() in Util.letters_chars):
					result.append([LEX_VAR, readVar()])
				elif(c in [" ", "\t", "\n", "\r"]):
					pass
				else:
					result.append([LEX_UNEXPECTED, c])
				
				
				skipNext()
				
		else:
			savedNormalText += c
		
		skipNext()
	
	if(savedNormalText != ""):
		result.append([LEX_TEXT, savedNormalText])
		savedNormalText = ""
	result.append([LEX_EOF])
	return result
	
func curChar() -> String:
	if(curI >= curText.length()):
		return ""
	return curText[curI]

func readNext() -> String:
	curI += 1
	if(curI >= curText.length()):
		return ""
	return curText[curI]
	
func skipNext():
	curI += 1
	
func peekNext(howFar:int = 1) -> String:
	if((curI+howFar) >= curText.length()):
		return ""
	return curText[curI + howFar]

func readString() -> String:
	var result = ""
	
	while(curChar() != ""):
		var c = curChar()
		
		if(c == "\""):
			return result
		else:
			result += c
		
		skipNext()
	
	return result

func readVar() -> String:
	var result = ""
	
	while(curChar() != ""):
		var c = curChar()
		
		result += c
		
		var nextC = peekNext().to_lower()
		if(!(nextC in Util.letters_chars) && !(nextC in Util.numbers_chars) && nextC != "_"):
			return result
		
		skipNext()
	
	return result
