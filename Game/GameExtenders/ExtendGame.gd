extends Object
class_name ExtendGame

# This is a simple system that allows you to inject code into the game's objects

enum {
	pcUpdateNonBattleEffects,
	pcProcessBattleTurn,
	pcBeforeFightStarted,
	pcAfterFightEnded,
	pcProcessTime,
	pcHoursPassed,
	
	npcUpdateNonBattleEffects,
	npcProcessBattleTurn,
	npcBeforeFightStarted,
	npcAfterFightEnded,
	npcProcessTime,
	npcHoursPassed,
	
	saveLoadData,
}

const enumToFunctionName = {
	pcUpdateNonBattleEffects: "pcUpdateNonBattleEffects",
	pcProcessBattleTurn: "pcProcessBattleTurn",
	pcBeforeFightStarted: "pcBeforeFightStarted",
	pcAfterFightEnded: "pcAfterFightEnded",
	pcProcessTime: "pcProcessTime",
	pcHoursPassed: "pcHoursPassed",
	
	npcUpdateNonBattleEffects: "npcUpdateNonBattleEffects",
	npcProcessBattleTurn: "npcProcessBattleTurn",
	npcBeforeFightStarted: "npcBeforeFightStarted",
	npcAfterFightEnded: "npcAfterFightEnded",
	npcProcessTime: "npcProcessTime",
	npcHoursPassed: "npcHoursPassed",
}
