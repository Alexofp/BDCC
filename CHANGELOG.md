# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
## [0.1.0] - 2023-10-06
### Added
- Tavi's route is finished! That makes the game completable from start to the end. Will you finally escape the prison? Who knows ^^. Complete her route and find out in one of the 3 endings that are all drastically different. At least 250+ pages/80k+ words of new content in this update
- [Visible chains!](https://github.com/Alexofp/BDCC/assets/14040378/117c5fbb-bef3-434f-a9fa-ac08bc876271) Visible chains and leashes been added in most scenes that mention them ^^. (Original mod by PeteTimesSix)
- Masochism skill for Tavi. Includes a little puzzle-like minigame where you have to cause Tavi just enough pain. Don't choke her too much :p
- Petplay skill for Tavi. Train Tavi to become a cute puppy.
- Optional Watersports skill for Tavi. Lots of golden opportunities there..
- Ability to let Tavi sleep with you. Comes with 6 lewd scenes and ability to deny her in each
- New activities to do with Tavi: Showering and Milking. With lots of options ^^
- Special 'magic tricks' scene that unlocks when Tavi's corruption is at 200%. Lets her grow a few things ^^
- A unique Tavi+Rahi scene that happens if both Rahi and Tavi have their petplay skill maxxed out. Complete with very lewd unique animation.
- A way to see your starting perks in the skills panel. ([Pull request by PeteTimesSix](https://github.com/Alexofp/BDCC/pull/27))
- Lots of new animations. Getting on all fours got better transitions. Better hug animation
- Choking added to procedural sex. With ability to turn it into choke-fuck (animated)
- Ability to put breast pumps on dynamic npcs during procedural sex. They can do it to you too if you're lactating ^^
- Breast groping and 2 versions of breast feeding (dom -> sub and vice versa) added to procedural sex. With animations that automatically adjust based on the breast size/muzzle length.

### Fixed
- Can't keep the stocks anymore if you unlock them with a restraints key
- Typos and bugs

## [0.0.24] - 2023-08-08
### Added
- [Skins!](https://cdn.discordapp.com/attachments/1007588662009155704/1121481683095527445/image.png) White paper dolls finally got their colors and they look fancy. Can be disabled in the settings if you prefer the old look.
- Tavi’s route is expanded! Tavi has a new foolproof plan of escape and she needs your help. 200+ pages/60k+ words of text, pretty much a novel. Next update will probably complete this route to the end, making the whole game completable! (But not done, 2 other routes planned)
- All static npcs have a skin defined for them. All dynamic npcs have a random skin and colors.
- [Support for custom skins! Click me to find out how to draw your own.](https://github.com/Alexofp/BDCC/wiki/Making-skins) Installing custom skins is as easy as putting them into the custom_skins folder.
- Change your skin and colors at any time using the Mirror in the bathrooms. Useful for old saves.
- Cum overlay. If a character is covered in any fluids, they will be visible on their doll. Changes depending on the amount of fluids.
- Jiggle physics. Breasts, bellies and butts now jiggle slightly. Can be configured/disabled in the options.
- The scene of having your holes healed by Eliza got an animation.
- The scene where you encounter the latex alien during the mental ward content got an animation (A great one!)
- 3 new procedural sex activities added: Rimming sub, Getting rimmed by the sub, Feetplay.
- You can now choose the weight multipliers for each goal in the encounter settings. Rimming and feetplay have low weights by default, meaning NPCs will do them rarely to you.
- Sex activity editor. A very complicated tool but useful if you know GDScript. Some examples in the AssetsSource folder

### Changed
- Gender distribution of player character’s kids now follows the distribution in the encounter settings
- Pose doesn’t change randomly if you select the ‘continue fucking’ option during procedural sex.
- Status effects now check if they should be added or removed instead of the BaseCharacter class, making adding new status effects through mods much easier.
- Adding new attacks to the player’s arsenal through mods is now way easier.
- Old dynamic npcs will randomly receive newly added fetishes now.

### Fixed
- If you skip the journey when you are leashed, you will be teleported to your destination now. ([Fix by Niel](https://github.com/Alexofp/BDCC/pull/17))
- Fixed fetishes that require bodyparts not generating for the dynamic npcs.
- Character creator shows the exact name of the bodypart now. (fixes the anus with womb option not being displayed visibly)

## [0.0.23] - 2023-06-13
### Added
- First accepted code contribution! The npc 'forget' menu got replaced with a fancy UI-based one that also allows you preview the npc or even meet them. ([Pull request by Firi](https://github.com/Alexofp/BDCC/pull/10))
- Second accepted code contribution! Fertility skill with 10 new perks designed for mothers ^^. ([Pull request by Firi](https://github.com/Alexofp/BDCC/pull/14))
- The final Arena battle against Avy is finished! It won't be that simple.. Because it's an entire quest! Will you become the new Grand Champion or will Avy The Unbeatable keep the throne to herself forever?
- Lots of new Rahi scenes that train her skills. Below are all the new stuff, pages upon pages of it (This is probably the last time I focus on Rahi for an update x3)
- Rahi's petplay is expanded with puppy training. Can take Rahi on walkies around the prison now
- Choking punishment for Rahi. If you go too far - you might make Rahi forget one of her skills entirely.. allowing you to experience the content of that skill again
- Rahi can join you in your bed when you go to sleep.
- 8 morning scenes where Rahi wakes you up with sex. Can be toggled on or off
- Exhibitionism skill for Rahi got a lot of scenes. From you training her to be more 'confident' to parading her around the station naked
- Cuddle reward where you cuddle Rahi. Has a few sex scenes and also ability to collect Rahi's milk with breast pumps
- Rahi pregnancy content. 2 scenes, one for the first time and one repeatable. Happens when you approach her when she is ready to give birth (you will be notified).
- New perk for the BDSM skill that really rewards perfect hits during the struggling minigame
- Learned perks can now be toggled off and on at any point
- Slutwall. Slut. Wall.
- The procedural sex now has more poses for the penetrative sex. Allfours/Standing/Missionary/Full-nelson for fucking someone and Cowgirl/Reverse cowgirl for riding someone. A random pose is chosen but you can switch them on the fly
- You can now meet pregnant procedural npcs and help them give birth
- Developer commentary for scenes. If you enable it in the options the \[DC] button will now appear for scenes that have commentary written for them. The commentary are little snippets of text that give you more insight about how I write
- Imagepacks now support layered images, ability to define art for procedural npcs and also ability to attach art to any scene

### Changed
- If you manage to resist Npc's attempts of putting bdsm gear on you during sex, they will eventually give up
- Names for breast sizes and also milk amount got adjusted to be slightly more realistic. Slightly.
- New imagepacks are sorted to be first now

### Fixed
- Npcs shouldn't be able to give birth mid-scene anymore
- Npcs shouldn't be processed twice when you meet them anymore
- More bugs that I don't remember..

## [0.0.22bugfix1] - 2023-04-19
### Added
- A few petplay scenes with Rahi
- Translator can now translate buttons and their descriptions

### Fixed
- The issue that made Tavi's main quest stuck after getting the drugs/door code
- Npc's status effects are now being processed too. Fixes Rahi's sore nipples not going away

## [0.0.22] - 2023-04-13
### Added
- Rahi's content got expanded into a full little story line. At least 200 pages/70k words of scenes (a novel worth of text) all about the brown kitty. It's fully completable from start to the end but the middle part is still missing some content. Since the part 1. This took all the time
- 4 'intro' story scenes and 8 main story scenes that will reveal why Rahi is the way she is. 2 endings
- Give Rahi tasks, reward or punish her, train Rahi's skills to make her better at various lewd activities. For now I consider the dominance and anal skills to be mostly complete but the others have some fun things to do too. This will be the focus of part 2
- Built-in auto translator. A very experimental feature. Don't expect to work well or work at all. Doesn't translate the buttons. Doesn't work in web builds
- Computer hacking minigame now has a built-in tutorial that explains you what to do. It will also spoil you the command if you're really stuck. Debug menu now has the option to skip this minigame
- You can now use strapons if you have a chastity cage. The cage will be hidden because of how the skeleton works.

### Fixed
- Crash when you pick the drink options during chastity content

## [0.0.21] - 2023-02-24
### Added
- Tavi's route is extended. ~100 pages of text. Help her try to contact the syndicate, find out more about her backstory. And more.
- A semi-realistic computer hacking minigame that can be encountered during Tavi's content.
- Get an ability to experience wooden horse torture during Tavi's content
- A little encounter with a nurse android named Nur-A
- Cum economy update! The way fluids are handled got heavily refactored. Collect fluids using a plastic bottle, a breast pump or by keeping used condoms. You can drink them or throw at your enemies using condoms. All of the interactions will have different effects depending on the fluids involved.
- The selling price of a plastic bottle depends on the fluids inside it.
- Breast pump. Allows you to milk your breasts. Breast pump mk2, the advanced version, milks you passively when worn.
- A perk that allows you to keep used condoms after procedural sex or written scenes if they were involved.
- All strapons now can be supplied with fluids. They will automatically 'cum' using these fluids when the sub cums.
- The strapons that npcs put on can have cum lube in it. Or real cum with a very small chance
- Horsecock dildo toy that can bought from The Announcer or by finding it during Tavi's content. Can be supplied with fluids that will be automatically 'injected' inside you when you ride it
- Procedural sex now supports stocks. Added a few encounters into the stocks punishment that triggers them.
- Npcs that like bodywritings might add a tallymark on you after each load. The lust damage from the perk got capped at 50%
- Built-in Mod manager. Can be enabled in the options. Allows you to manage your mods.
- Mod browser. Can be opened from the mod manager. Allows you to download mods straight from the game. I curate the mod list personally
- The BDCC.pck file now automatically gets generated and updated on Android when needed. First-time launch might be slower because of that
- A few new perks. Melee weapons damage, instant restraint escape, fluid experimenter
- The struggling minigame is different if you're blindfolded.
- Scene converter got a major overhaul. You can now write branching, add code that runs when picking an action and more without leaving google docs. Scene converter can now 'preview' scenes. You can even pick which savefile you wanna preview the scene on.
- Kait got her portrait
- Skills button only gets 'highlighted' with \[!\] if you can unlock new perks in that skill tree

## [0.0.20] - 2023-01-10
### Added
- Sex animations! Almost every lewd scene now includes an animation for the dolls. Procedural sex included
- Struggling out of restraints is now animated
- Forced male chastity content. Experience what it's like to wear permanent chastity cage over 7 lewd scenes (28k words/76 pages) with Eliza and optional cameos of 5 other characters. You will have a huge choice at the end of this little storyline. Scenes trigger every 5 days
- Strapons. Strapons can now be used inside the procedural sex by you or npcs. Strapons can be bought from The Announcer
- Procedural npcs now drop loot (oops, I forgot that when coding them)
- Encounter settings have been greately expanded. You can now choose the distribution of genders, species and restrict sertain activities from happening to you during procedural sex
- You can get wounded or have your holes painfull stretched during rough activities inside the procedural sex. These status effects won't go away until you get yourself healed by Eliza or by sleeping (sleeping won't help if you got wounded twice in a row)
- Can ask Eliza to heal you inside the cryopod
- Buffs tab inside the skills menu. Shows what buffs your character currently has and their source (equipped item, status effect or perk). Useful to see if the perks are actually working
- You can choose to keep the restraints on the procedural npc if you won the fight
- Mods can extend the game's core functions with GameExtenders. GameExtenders can subscribe to some events like player's updates and run code. Should lessen the need to override the core files of the game inside mods. Still an experimental feature

### Changed
- The function that updates player's status effects shouldn't run multiple times in a row anymore. General optimization

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

[Unreleased]: https://github.com/Alexofp/BDCC/compare/0.1.0...main
[0.1.0]: https://github.com/Alexofp/BDCC/compare/0.0.24...0.1.0
[0.0.24]: https://github.com/Alexofp/BDCC/compare/0.0.23...0.0.24
[0.0.23]: https://github.com/Alexofp/BDCC/compare/0.0.22bugfix1...0.0.23
[0.0.22bugfix1]: https://github.com/Alexofp/BDCC/compare/0.0.22...0.0.22bugfix1
[0.0.22]: https://github.com/Alexofp/BDCC/compare/0.0.21...0.0.22
[0.0.21]: https://github.com/Alexofp/BDCC/compare/0.0.20...0.0.21
[0.0.20]: https://github.com/Alexofp/BDCC/compare/0.0.19...0.0.20
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
