# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.19] - 2022-12-05
### Added
- Random encounters overhaul! Old encounters with a few generic predefined npcs got replaced with new ones that use procedurally generated npcs. New encounters change depending on the npc's procedurally generated personality
- Sex engine! An initial implementation of it but already has too many features to list everything. All the important sex scenes will still be fully hand-written, only the random encounters with procedural npcs use the sex engine currently
- Sex engine supports vaginal/anal/oral sex, tribadism, drug use, condoms, bodywritings, bondage, violence. Player can be the dom that fully controls where the scene goes or a sub that is on a receiveing end and has to endure what the npc has in store for them or try to fight their decisions. Relatively easy to expand with more activities
- Procedural npcs. Guards, inmates, Nurses. Random name, gender, species, stats, attacks, equipment, personality, fetishes, likes/dislikes, etc. Should work with modded species out of the box
- Procedural npcs have a dynamic personality that will change after sex depending on many factors. An npc might become more subby or more mean for example
- New encounters menu where you can 'forget' procedural npcs and change some settings.
- 'Look for trouble' button in the 'Me' menu button. Forces an encounter if the current room has any that are possible
- Male chastity. Sometimes the guards will force a chastity cage on you. All the sex scenes got changed a bit to account for the chastity cage (Cage sprites by Max-Maxou)
- Forced permanent chastity cage. You choose this option during the character creator. Eliza will then force a chastity cage on you during the intro scene that you can never take off. Might be expanded in the future
- Captain, nurses and guards received their uniforms. Technically noone is nude anymore
- Mods can now specify a default portrait art for a modded character without creating an entire new imagepack

### Changed
- Penises look flacid when the characters have less than 50 lust. (Sprites by Max-Maxou)
- Skills are now grouped into a single 'Skills' tab instead of having one tab per skill, less clutter, easier to select on touch devices.
- Huge optimization of how npcs are processed. If the npc is not currently participating in any scene they are no longer being processed every tick. Unless they are pregnant. This should allow for pretty much unlimited amount of important/generated npcs without any lag
- Scrollbars are now more wide on android
- Cheat menu to spawn an item got changed to a better and easier to use one. Should be usable on android too

## [0.0.18] - 2022-10-26
### Added
- Main quest extended with new events/scenes. Help Tavi on her mission to escape the prison while getting into lots of kinky situations. This was the focus of this update ^^
- Jacki Northstar added as one of a characters with her permission ^^. Jacki's content will be focused around hard noncon stuff and corrupting her. For now there are 2 scenes + 1 encounter with her.
- Ability to force restraints onto NPCs! A radically new way to approach combat. Get 'Rigger' perk in bdsm skill tree to get this ability. Tie the npc up and exhaust them until they can't struggle anymore to win or just use gear to prevent them from using their most powerful attacks
- New minigame for struggling out of restraints, much simplier than the old one but less forgiving
- Cum stealing. Optional feature that allows you to exchange cum during tribbing, potentially allowing you to impregnate others as a dickless girl. Only one scene has tribbing option for now
- New perks in every skill tree
- Demon species. Based on a human but has horns and a special tail. Good for making hybrids with
- New debug panel that shows info about currently running scenes
- Map icons can change now, used for when you meet a character on that tile
- Mods can add new options to existing scenes
- Can steal drugs from the medical wing storage
- Experimental rollback feature. Can be enabled in the options. Allows you to undo any choice without making lots of quicksaves
- Loot tables expanded

### Changed
- Removed the check that prevented self-impregnation
- The way damage is displayed in fighting is changed. Now also shows how much damage was blocked

### Fixed
- Uniform/underwear shouldn't clip anymore when the pc has very big breasts
- Scrolling on touch devices should be less jerky

## [0.0.17] - 2022-09-19
### Added
- [Modding support!](https://github.com/Alexofp/BDCC/wiki) Mods can add pretty much anything, from a new item to a new quest. It's even possible to replace the game's files with modded ones, allowing for global modifications if someone dares to try that. Same mods should work both on desktop and android.
- A new quest that involves testing prototype panties that apparently have portals in them. Quest can be started in the mineshafts
- 4 sex scenes (+2 little intro ones) that are triggered when you get spotted during masturbation in public spots. They involve public use
- 3 new scenes in mental ward that explore a strange new drug that makes you 'partically-blind'
- Straitjacket, inmate uniforms and underwear are now visible on the player doll.
- Debug/cheat menu added. Enable it in the settings if you want, there is no punishment for using it.
- Added panel that displays the npc's artwork. 8 characters have portraits added with the ability to add more through mods. Artwork panel can be switched back to the old list in the options.
- Added a fox tail. (Sprite by Max-Maxou, first community addition ^^)
- Cum inflation. Character's belly will start looking bigger the more stuffed they are. Can be disabled in options
- Cum/milk particles. If a character has full breasts or their holes are stuffed with cum, their doll will sometimes visible leak. Just a visual effect
- Gles2/Gles3 renderer and 'forced software skinning' options added to the settings. It's generally recomended to use Gles3 on desktop and Gles2 on mobile/web. Tinker with these settings if your game doesn't work or doesn't display the player doll correctly.
- Little messages for when others spot you masturbating
- Being leashed is now a separate scene. Can skip it or watch your character being pulled somewhere one room at a time.
- Can make the option buttons bigger in the settings. Should be handy for touch devices.

### Changed
- Android now exports saves into the documents folder, allowing to actually backup your saves if you so desire
- Refactored the event system, it uses way cleaner code under the hood and should have less bugs
- Game flags are now grouped by module. An automatic save converter will upgrade old saves to use these new flags without losing progress

### Fixed
- Status effects from yoga/lifting weights now save/load correctly

## [0.0.16] - 2022-08-11
### Added
- 20+ new lewd scenes with all sorts of kinks, at least 100+ pages of text added
- Lust combat was completely overhauled, teasing got expanded a lot. Now you can gradually strip before the enemy and touch yourself in many different ways. The same system is now used for masturbation scene
- Npcs will sometimes react to your teases with unique dialogue
- Melee weapons. So far there is a stun baton and shiv. Stun baton can be used for damage or to stun enemies, shiv does high damage and causes bleeding. Melee weapons have very limited durability and are illegal, meaning they will be stripped during any search
- Some sliders change player's shape. Thickness slider makes the doll look more thick. Breasts/dick sliders work too. Belly will increases in size during pregnancy.
- Most of the restraints are now visible on the player. Cuffs will move the hands behind the back or make the player do hobble animation. The only restraints that aren't visible yet are buttplugs and the straitjacket
- Subscribestar subscribers are now displayed in the main menu, current list is fetched from github
- In most talking scenes you will see npc's doll standing near your doll
- Masturbation in public can cause you to be spotted. (no scenes for that yet, will be added in next update but the system is there)
- Player doll will be shown stuck in stocks during the stocks punishment scene
- Keyboard controls are added, they -should- work the same on any layout. Visibility of the keys on the buttons can be disabled in the options
- Gym content. Ability to lift weights and do yoga. Both give temporary bonuses.
- Rahi gym event
- Risha gym event
- Bully gang gym event
- Some strange dude is standing near gym. Convince him to get access to new area
- Underground club arena added. Climb the ranks and beat up others to earn credits/experience/have fun with them
- 8 fighters for the arena, each with unique scenes for when you lose/win against them
- Added ability to have buff arms in character creator
- Added bulldog head and ears in character creator
- Added horse species in character creator
- Added feline and horse dicks
- Added lots of new hair
- Added ability to change your hair in bathrooms
- Dev tool to quickly create character dolls
- Your crime is displayed on the 'me' screen
- Option to show names of characters before their speech
- Memories. Some scenes will attach little temporary memories to locations that are visible when you visit them later
- 3 new perks
- An option to show lengths in inches or cm+inches
- An option to make it so the first tap only shows the description of an action and second one actually does it. Only works on touch devices

### Changed
- Player doll is completely redone, now using rigged flat 3d models under the hood.
- Cum lover experience is added automatically when you receive a creampie or cum inside others. Or when you walk around with cum on you
- Buttons in the struggling minigame give more leeway on easier difficulties

### Fixed
- Tooltips when hovering over the bodyparts are fixed and working again
- Main text panel shouldn't scroll anymore when you pan the player doll panel on touch devices

## [0.0.15] - 2022-06-12
### Added
- Android port!
- Ability to choose what items do you wanna loot after winning a fight
- New osu-like minigame for struggling out of restraints. Needs balancing
- UI scaling for screens with big resolutions. Can be toggled off in the settings

## [0.0.14] - 2022-06-04
### Added
- Pregnancy! You can get pregnant and give birth in the nursery. There you can also track all your kids. Can't interact with them (and will never be able to, is an adult game). Other characters give birth automatically when the time is right (you will be notified)
- Menstrual cycle simulation for you and non-playable female characters. You can go into heat and ovulate (if you have a pussy ofc). Each eggcell/ovum inside your womb is simulated and tracked. This allows to be pregnant from two differnet people at the same time for example. NPCs use the same systems for impregnation calculations.
- Birth control pills, breeder pills, heat pills, pregnancy testers
- Pregnancy settings were added to the options screen where you can adjust how long the menstrual cycle and pregnancy are
- Ability to pick starting perks. So far they're all pregnancy related. If you have an old save file a button to pick them is added to your "Me" menu
- Condoms. You will be able to use them in certain scenes. They will alter the scene slightly unless I'm lazy. Condoms can break unless disabled in options
- Some Rahi content. To start it give her an apple, sleep and meet her.
- Rahi shower event, first sex scenes with Rahi are added
- Semen inside other characters/heat/pregnancy are now tracked and shown as a status effect, same as player.
- Lots of new icons for status effects and perks
- Tavi shower single-time random event, watersports related (fully optional)
- Added a scene of fucking with Nova if you beat her at greenhouses
- Added scenes for Rahi and Nova of them reacting to getting pregnant
- Nova can now be found in the yard. Added a petplay scene with Nova
- Added 2 scenes of non-con sex in stocks. One female-only, one universal
- Late stages of pregnancy cause lactation

### Changed
- Pink inmates are now called lilacs because I like the name
- Vendomats now use item tags rather than a hardcoded list of items.
- Mentioned Mekyro on the credits screen

### Fixed
- Tallymarks and bodywritings should now save/load correctly. No more Error:Badzone1

## [0.0.13bugfix3] - 2022-05-10
### Fixed
- Some text fixes

## [0.0.13bugfix2] - 2022-05-09
### Fixed
- Kinda fixed the gagged speech breaking my string interpolation system

## [0.0.13bugfix1] - 2022-05-09
### Fixed
- Fixed crash when certain scenes tried to milk the player without a penis

## [0.0.13] - 2022-05-09
### Added
- Initial release
- Intro scene where the player gets put into a prison
- 2 quests for the Tavi route
- Basic prison activities
- 2 soft bad-ends that can be expanded with more scenes
- Turn-based fighting
- Initial player customization

[Unreleased]: https://github.com/Alexofp/BDCC/compare/0.0.19...main
[0.0.19]: https://github.com/Alexofp/BDCC/compare/0.0.18...0.0.19
[0.0.18]: https://github.com/Alexofp/BDCC/compare/0.0.17...0.0.18
[0.0.17]: https://github.com/Alexofp/BDCC/compare/0.0.16...0.0.17
[0.0.16]: https://github.com/Alexofp/BDCC/compare/0.0.15...0.0.16
[0.0.15]: https://github.com/Alexofp/BDCC/compare/0.0.14...0.0.15
[0.0.14]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix3...0.0.14
[0.0.13bugfix3]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix2...v0.0.13bugfix3
[0.0.13bugfix2]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix1...v0.0.13bugfix2
[0.0.13bugfix1]: https://github.com/Alexofp/BDCC/compare/v0.0.13...v0.0.13bugfix1
[0.0.13]: https://github.com/Alexofp/BDCC/releases/tag/v0.0.13