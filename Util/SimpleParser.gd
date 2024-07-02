extends Reference
class_name SimpleParser
# This is not a full blown scripting language, this is just a runtime substitute for godot's missing string interpolation

enum Token {WORD, DOT, OPENBRACKET, CLOSEBRACKET, COMMA, STRING, NUMBER, EOF}

# Finds {} expressions inside a string like {pc.say('meow')}
func getExpressionsFromText(text: String):
	var result = []
	var currentExpr = ""
	var currentText = ""
	
	var inExpr = false
	var inString = false
	var inString2 = false
	var escapedCharacter = false
	
	for letter in text:
		if(escapedCharacter):
			if(inExpr):
				currentExpr += letter
			else:
				currentText += letter
			escapedCharacter = false
			continue
		
		if(!escapedCharacter && !inExpr && letter == "\\"):
			escapedCharacter = true
			#currentExpr += letter
			continue
		
		if(!inExpr && letter == '{'):
			inExpr = true
			
			if(currentText != ""):
				result.append(["text", currentText])
				currentText = ""
			continue
		
		if(!escapedCharacter && inExpr && letter == "\\"):
			escapedCharacter = true
			currentExpr += letter
			continue
		
		if(!inString && inExpr && letter in ["'", "’", "‘"]):
			inString = true
		else:
			if(inString && inExpr && letter in ["'", "’", "‘"]):
				inString = false
				
		if(!inString2 && inExpr && letter == "\""):
			inString2 = true
		else:
			if(inString2 && inExpr && letter == "\""):
				inString2 = false
		
		if(inExpr && !inString && !inString2 && letter == '}'):
			result.append(["expr", currentExpr])
			currentExpr = ""
			inString = false
			inString2 = false
			escapedCharacter = false
			inExpr = false
			continue
		
		if(inExpr):
			currentExpr += letter
		else:
			currentText += letter
	
	if(currentText != ""):
		result.append(["text", currentText])
	
	return result

#input pc.say('meow', 123)
#output [ [WORD, "pc"], [DOT], [WORD, "say"], [OPENBRACKET], [STRING, "meow"], [COMMA], [NUMBER, 123], [CLOSEBRACKET], [EOF] ]
func getLexems(text: String):
	var tokens = []
	
	var pos = 0
	var textLen = text.length()
	
	while pos < textLen:
		if(Util.spaceCharacters.has(text[pos])):
			pos += 1
		elif(Util.digits.has(text[pos]) || text[pos] == '-'):
			var number = text[pos]
			pos += 1
			var hasDot = false
			
			while pos < textLen:
				if(text[pos] == '.' && !hasDot):
					hasDot = true
					number += text[pos]
					pos += 1
				elif(Util.digits.has(text[pos])):
					number += text[pos]
					pos += 1
				else:
					break
			
			if(number == '-'):
				number = '0'
			var numberActual
			if(hasDot):
				numberActual = float(number)
			else:
				numberActual = int(number)
			
			tokens.append([Token.NUMBER, numberActual])
		elif(Util.asciiletters.has(text[pos])):
			var word = text[pos]
			pos += 1
			
			while pos < textLen:
				if(Util.asciiletters.has(text[pos]) || Util.digits.has(text[pos]) || text[pos] == "_" || text[pos] == ":"):
					word += text[pos]
					pos += 1
				else:
					break
			
			tokens.append([Token.WORD, word])
		elif(text[pos] == "'"):
			var string = ""
			pos += 1
			
			while pos < textLen:
				if(text[pos] == "'"):
					pos += 1
					break
				
				if(text[pos] == '\\' && (pos+1)<textLen && text[pos+1] == '\''):
					string += '\''
					pos += 2
				else:
					string += text[pos]
					pos += 1
				
			tokens.append([Token.STRING, string])
		elif(text[pos] == "\""):
			var string = ""
			pos += 1
			
			while pos < textLen:
				if(text[pos] == "\""):
					pos += 1
					break
				
				if(text[pos] == '\\' && (pos+1)<textLen && text[pos+1] == '"'):
					string += '"'
					pos += 2
				else:
					string += text[pos]
					pos += 1
				
			tokens.append([Token.STRING, string])
		elif(text[pos] == "("):
			tokens.append([Token.OPENBRACKET])
			pos += 1
		elif(text[pos] == ")"):
			tokens.append([Token.CLOSEBRACKET])
			pos += 1
		elif(text[pos] == "."):
			tokens.append([Token.DOT])
			pos += 1
		elif(text[pos] == ","):
			tokens.append([Token.COMMA])
			pos += 1
		
		else:
			pos += 1
		
	tokens.append([Token.EOF])
	return tokens

# barebone interpetator with skipped AST generation
# no error handling but it's enough for me
func runLexems(lexems, overrides: Dictionary = {}):
	var pos = 0
	
	if(lexems[pos][0] == Token.EOF):
		return ""
	
	if(lexems[pos][0] == Token.WORD):
		var first = lexems[pos][1]
		pos += 1
		if(lexems[pos][0] == Token.EOF):
			return [true, callFunc(first, [])]
		elif(lexems[pos][0] == Token.OPENBRACKET):
			pos += 1
			var arguments = []
			
			if(lexems[pos][0] == Token.CLOSEBRACKET):
				pos += 1
				if(lexems[pos][0] == Token.EOF):
					return [true, callFunc(first, arguments)]
			
			elif(lexems[pos][0] == Token.STRING || lexems[pos][0] == Token.NUMBER):
				arguments.append(lexems[pos][1])
				pos += 1
				
				if(lexems[pos][0] == Token.COMMA):
					while(lexems[pos][0] == Token.COMMA):
						pos += 1
						
						if(lexems[pos][0] == Token.STRING || lexems[pos][0] == Token.NUMBER):
							arguments.append(lexems[pos][1])
						pos += 1
						
						if(lexems[pos][0] == Token.CLOSEBRACKET):
							pos += 1
							if(lexems[pos][0] == Token.EOF):
								return [true, callFunc(first, arguments)]
				elif(lexems[pos][0] == Token.CLOSEBRACKET):
					pos += 1
					if(lexems[pos][0] == Token.EOF):
						return [true, callFunc(first, arguments)]
			
		elif(lexems[pos][0] == Token.DOT):
			pos += 1
			if(lexems[pos][0] == Token.WORD):
				var second = lexems[pos][1]
				pos += 1
				
				if(lexems[pos][0] == Token.EOF):
					return [true, callObjectFunc(first, second, [], overrides)]
				elif(lexems[pos][0] == Token.OPENBRACKET):
					pos += 1
					var arguments = []
					
					if(lexems[pos][0] == Token.CLOSEBRACKET):
						pos += 1
						if(lexems[pos][0] == Token.EOF):
							return [true, callObjectFunc(first, second, arguments, overrides)]
					
					elif(lexems[pos][0] == Token.STRING || lexems[pos][0] == Token.NUMBER):
						arguments.append(lexems[pos][1])
						pos += 1
						
						if(lexems[pos][0] == Token.COMMA):
							while(lexems[pos][0] == Token.COMMA):
								pos += 1
								
								if(lexems[pos][0] == Token.STRING || lexems[pos][0] == Token.NUMBER):
									arguments.append(lexems[pos][1])
								pos += 1
								
								if(lexems[pos][0] == Token.CLOSEBRACKET):
									pos += 1
									if(lexems[pos][0] == Token.EOF):
										return [true, callObjectFunc(first, second, arguments, overrides)]
						elif(lexems[pos][0] == Token.CLOSEBRACKET):
							pos += 1
							if(lexems[pos][0] == Token.EOF):
								return [true, callObjectFunc(first, second, arguments, overrides)]
	return [false, "Error while executing the expression"]
			
func executeString(text: String, overrides: Dictionary = {}):
	var expressions = getExpressionsFromText(text)
	var result = ""
	for expr in expressions:
		if(expr[0] == "text"):
			result += expr[1]
		if(expr[0] == "expr"):
			var lexems = getLexems(expr[1])
			var exprResult = runLexems(lexems, overrides)
			if(exprResult[0]):
				result += exprResult[1]
			else:
				result += "!SYNTAX ERROR IN: "+expr[1]+"!"
	return result
			
func callFunc(_command: String, _args: Array):
	return "!callFunc "+_command+" "+str(_args)+"!"
	
func callObjectFunc(_obj: String, _command: String, _args: Array, _overrides: Dictionary = {}):
	return "!callObjectFunc "+_obj+"."+_command+" "+str(_args)+"!"
