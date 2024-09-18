extends Reference
class_name DialogueParser

# I LIKE WRITING BAD PARSERS, SUE ME

# Lexer tokens
enum {
	L_RAWTEXT,
	L_START, #[[
	L_END, #]]
	L_STRING, # any text
	L_EQUALS, # =
	L_OR, # |
	L_SEPARATOR, # ;
	L_EOF,
	L_BADTOKEN,
}

func tokenToString(t) -> String:
	var tokenType = t
	if(t is Array):
		tokenType = t[0]
	if(tokenType == L_RAWTEXT):
		return "L_RAWTEXT:'"+t[1]+"'"
	elif(tokenType == L_START):
		return "L_START"
	elif(tokenType == L_END):
		return "L_END"
	elif(tokenType == L_STRING):
		return "L_STRING:'"+t[1]+"'"
	elif(tokenType == L_EQUALS):
		return "L_EQUALS"
	elif(tokenType == L_OR):
		return "L_OR"
	elif(tokenType == L_SEPARATOR):
		return "L_SEPARATOR"
	elif(tokenType == L_EOF):
		return "L_EOF"
	elif(tokenType == L_BADTOKEN):
		return "L_BADTOKEN"
	return "ERROR??"

var curI:int = 0
var text:String = ""

func getLexems(theText:String) -> Array:
	text = theText
	curI = 0
	
	var result:Array = []
	
	var curRawText:String = ""
	while(canPeek()):
		var c:String = readNext()
		
		if((c == "[" && peekNext() == "[") || (c == "_" && peekNext() == "[" && peekNext(1) == "[")):
			if(curRawText != ""):
				result.append([L_RAWTEXT, curRawText])
				curRawText = ""
			
			var curString:String = ""
			var _skip = readNext()
			if(c == "_"):
				_skip = readNext()
				result.append([L_START, true])
			else:
				result.append([L_START, false])
			# ]] ; | =
			while(canPeek()):
				c = readNext()
				
				if(c == "]" && peekNext() == "]"):
					if(curString != ""):
						result.append([L_STRING, curString])
						curString = ""
						
					_skip = readNext()
					result.append([L_END])
					break
				elif(c in [";", "|", "="]):
					if(curString != ""):
						result.append([L_STRING, curString])
						curString = ""
					
					if(c == ";"):
						result.append([L_SEPARATOR])
					elif(c == "|"):
						result.append([L_OR])
					elif(c == "="):
						result.append([L_EQUALS])
				else:
					curString += c
		else:
			curRawText += c
	
	if(curRawText != ""):
		result.append([L_RAWTEXT, curRawText])
		curRawText = ""
	result.append([L_EOF])
	
	return result

func canPeek() -> bool:
	return curI < text.length()

func readNext() -> String:
	if(!canPeek()):
		return ""
	curI += 1
	return text[curI - 1]

func peekNext(howMuch:int = 0) -> String:
	if((curI+howMuch) >= text.length()):
		return ""
	return text[curI + howMuch]


var errored:bool = false
var tokens:Array
var resultString:String
func processString(theText:String, _allowedTags:Dictionary, _replaceMents:Dictionary) -> String:
	if(!_replaceMents.has("_")):
		_replaceMents["_"] = [""]
	errored = false
	tokens = getLexems(theText)
	resultString = ""
	curI = 0
	
	while(canPeekToken()):
		var t = readNextToken()
		
		if(t[0] == L_RAWTEXT):
			resultString += t[1]
		elif(t[0] == L_START):
			var checkEmpty:bool = t[1]
			var possible:Dictionary = {}
			
			while(canPeekToken()):
				t = readNextToken()
				
				# kind=bro
				if(t[0] == L_STRING && peekNextToken()[0] == L_EQUALS && peekNextToken(1)[0] == L_STRING):
					var possibleName:String = t[1]
					t = readNextToken()
					t = readNextToken()
					if(!possible.has(possibleName)):
						possible[possibleName] = []
					possible[possibleName].append(t[1])
					
					t = peekNextToken()
					if(t[0] == L_END):
						pass
					elif(t[0] == L_SEPARATOR):
						var _skip = readNextToken()
					elif(t[0] == L_OR && peekNextToken(1)[0]==L_STRING):
						while(peekNextToken()[0] == L_OR && peekNextToken(1)[0]==L_STRING):
							t = readNextToken()
							t = readNextToken()
							
							possible[possibleName].append(t[1])
					
				# bro
				elif(t[0] == L_STRING):
					if(!possible.has("")):
						possible[""] = []
					possible[""].append(t[1])
					
					t = peekNextToken()
					if(t[0] == L_END):
						pass
					elif(t[0] == L_SEPARATOR):
						var _skip = readNextToken()
					elif(t[0] == L_OR && peekNextToken(1)[0]==L_STRING):
						while(peekNextToken()[0] == L_OR && peekNextToken(1)[0]==L_STRING):
							t = readNextToken()
							t = readNextToken()
							
							possible[""].append(t[1])

					
				elif(t[0] == L_END):
					# Add text here
					var foundEntry:bool = false
					for key in _allowedTags.keys():
						if(possible.has(key)):
							var toAdd:String = RNG.pick(possible[key])
							toAdd = checkReplacement(toAdd, _replaceMents)
							if(toAdd != "" && checkEmpty):
								resultString += " "
							resultString += toAdd
							foundEntry = true
							break
					if(!foundEntry && possible.has("")):
						var toAdd:String = RNG.pick(possible[""])
						toAdd = checkReplacement(toAdd, _replaceMents)
						if(toAdd != "" && checkEmpty):
							resultString += " "
						resultString += toAdd
						foundEntry = true
					#possible.clear()
					break
				elif(t[0] == L_SEPARATOR):
					pass
				else:
					throwError(t, "Expected String or ]]")
		elif(t[0] == L_EOF):
			break
		else:
			throwError(t, "Expected Raw-text, [[ or EOF")
	
	return resultString

func checkReplacement(theText:String, replacements:Dictionary):
	if(replacements.has(theText)):
		return RNG.pick(replacements[theText])
	elif(theText.begins_with("C_")):
		theText = theText.substr(2)
		
		if(replacements.has(theText)):
			theText = RNG.pick(replacements[theText])
		if(theText.length() > 0):
			theText[0] = theText[0].to_upper()
		return theText
	return theText

func throwError(token, errorText:String):
	errored = true
	errorText = "Token: "+tokenToString(token)+" "+errorText
	Log.printerr("[DialogueParser error]: "+errorText)
	resultString += "[color=red]"+errorText+"[/color]"
	
	# Skipping to the next raw text
	var skipToken = peekNextToken()
	while(canPeekToken() && !(skipToken[0] in [L_RAWTEXT, L_EOF])):
		skipToken = readNextToken()
		skipToken = peekNextToken()
	
func canPeekToken() -> bool:
	return curI < tokens.size()

func readNextToken():
	if(!canPeekToken()):
		return [L_BADTOKEN]
	curI += 1
	return tokens[curI - 1]

func peekNextToken(howMuch:int = 0):
	if((curI+howMuch) >= tokens.size()):
		return [L_BADTOKEN]
	return tokens[curI + howMuch]
