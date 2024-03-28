extends SlaveTypeBase

func _init():
	id = SlaveType.Submissive

func getVisibleName():
	return "Submissive"

func getVisibleDesc():
	return "Turn your slave into an obedient sub and get an ability to make them serve you"

func getEnslaveText(_npc):
	return "[say=pc]You're gonna serve me, like a good {npc.boy}.[/say]"

# F- F  F+ D- D  D+ C- C  B- B  A- A  S- S  S+ S++
# 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
func getTrainText(_npc, _skillLevel):
	if(_skillLevel == 0):
		return "Your slave doesn’t know anything about the art of submission. So you start slowly, by explaining some of the basic things and seeing how {npc.he} reacts to it. The main thing that {npc.he} must realize.. is that {npc.he} doesn’t really have a choice.. but you’re not gonna tell {npc.him} that."
	if(_skillLevel == 1):
		return "You explain to your slave that {npc.he} {npc.isAre} now your sub, your submissive. You explain that any sub’s purpose is.. serving. Serving their master, owner or mistress. Serving their dominant. Serving can take many forms, sexual or not. You explain that {npc.his} body belongs to you. Ideally, the mind should too."
	if(_skillLevel == 2):
		return "You teach your slave how {npc.he} should present {npc.his} body to you. You tell {npc.him} that {npc.he} should stand completely still, hands by sides, gaze directed forward. You step around {npc.him}, making sure {npc.he} {npc.isAre} doing as told."
	if(_skillLevel == 3):
		return "Most important thing about being a sub.. obeying. A sub only has to obey the words of a dom to be a good sub, listen to dom’s orders and do their best to fulfill them. Yes, a sub doesn’t have freedom. A normal kind of freedom. They have some different. You train your sub to see if they understand what you mean."
	if(_skillLevel == 4):
		return "You teach your slave the most basic pose. Kneeling. It might be a simple gesture. But it shows so much. Lowering yourself to your knees is a symbol of a willingly exchanging power with the dom. You show your sub all the possible variations of kneeling too like Nadu and Humble."
	if(_skillLevel == 5):
		return "You explain to your slave how much great BDSM gear there is around. Wearing it proudly is the sub's purpose. And the collar is the main piece of that. It shows that you belong to someone else. BDSM toys could be used to restrict.. but also to bring pleasure."
	if(_skillLevel == 6):
		return "You feel like it's worth repeating the lesson that subs are here to serve the doms. But it’s not that simple, the doms also take responsibility to treat the sub fairly, to look after them. You train your sub by giving them lots of simple orders and seeing how well {npc.he} does them."
	if(_skillLevel == 7):
		return "You teach your sub that BDSM is a balance of pleasure and pain. Rewards and punishments. Obeying and leading. And that sometimes a punishment can be a reward. Sometimes pain can bring pleasure. Suffering can feel good.. if you’re doing it for your owner. You test how much pain your sub is ready to endure for you."
	if(_skillLevel == 8):
		return "You train your sub to receive humiliation better. Sometimes you will call your sub a whore or a dirty slutty fucktoy.. Sometimes you will spit on them, hurt them, degrade them, force them. Sometimes it's a just punishment that is designed to make the sub show what they did wrong. And sometimes, you will do it out of love."
	if(_skillLevel == 9):
		return "You teach your sub to embrace the chains that they are wearing. You grab {npc.his} chain leash and parade {npc.him} around the cell, making sure {npc.he} {npc.isAre} catching up by tugging on the leash."
	if(_skillLevel == 10):
		return "BDSM is not just about pain and chains. You show your sub that there is space and the right time for stuff like sex too. You train your sub by ordering {npc.him} to masturbate in front of you, making sure to control when and how {npc.he} cums. And if {npc.he} cums at all."
	if(_skillLevel == 11):
		return "Today you give your slave another lesson in submission by making {npc.him} get on all fours and then act like your footrest. While you’re resting your legs on {npc.his} back, you explain {npc.him} that you can combine elements of degradation, humiliation and serving to tug on the most hidden sub’s strings."
	if(_skillLevel == 12):
		return "An even more humiliating lesson, you order your sub to kneel before you and then kiss your foot. You explain that a true submissive shouldn’t see this as something bad, for them it's just one way they can show their devotion to their owner."
	if(_skillLevel == 13):
		return "After so many humiliating lessons, you decide to share a little secret with your sub. In a proper D/s relationship, the submissive is always in control. They are the one who decides how much of their freedom they are willingly to give away. And they are the one who can take it back at any point. And the fact that your sub has been doing all of that means that {npc.he} wants to be yours. Pain is pleasure. Humiliation is praise. Dirty words are compliments."
	if(_skillLevel == 14):
		return "Today you just train your sub a little, giving {npc.him} orders and rewarding or punishing appropriately. During that, you tell {npc.him} that {npc.he} doesn’t need to think. All {npc.he} has to do is.. just obey. Follow your words and let them be {npc.his} chains and padlocks. While communication is the key."
	if(_skillLevel == 15):
		return "There is not much new you can teach your slave. {npc.He} {npc.isAre} pretty much a perfect submissive now! But you still go through some old lessons and practice the art of obedience with {npc.him}."
		
	return .getTrainText(_npc, _skillLevel) 


func getUnlockHints(_npc):
	return [
		{
			unlocksAt = 2,
			name = "Bondage helper",
			text = "Your sub can now help unlock one of your restraints per day",
		},
		{
			unlocksAt = 4,
			name = "Showering the owner",
			text = "Your sub can now shower you",
		},
		{
			unlocksAt = 7,
			name = "Massage",
			text = "Your sub can now perform a special massage on you which feels almost as a good yoga exercise",
		},
		{
			unlocksAt = 10,
			name = "Better showering",
			text = "Your sub can clean you inside too now and take care of your lustness",
		},
		{
			unlocksAt = 15,
			name = "Slave helper",
			text = "You can now order your sub to give another one of your slaves a shower or help bring them to the nursery for a child birth",
		},
	]
