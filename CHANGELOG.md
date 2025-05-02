# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
## [0.1.8] - 2025-05-02
### Added
- Transformations! All sorts of weird drugs began popping up all around the prison. Weird drugs that seem to possess transformative properties..
- Become Eliza's lab assistant! A whole new gameplay-oriented storyline about helping Eliza with this drug problem. A sane man would choose to get rid of this contraband as soon as possible. But not Eliza.. To start your journey of becoming her assistant, choose the 'Research' option when talking to Eliza.
- [Kidlat](https://github.com/user-attachments/assets/3f74a9d7-5947-476e-8b5c-d030b4fe6ee6)! Welcome the new guest character, a very cute soft kitty. You will run into her during the exploration of a new zone. She has a wholesome questline attached to her. Will you help her help you? Just don't touch her loaf, it's not for sale.
- Drug den! Explore the hidden layer of the BDCC prison.. countless abandoned maintenance corridors that got turned into a full-blown multi-floored drug den dungeon.. Loot stashes, fight junkies, raid their make-shift drug laboratories.. and earn science points. You will get access to this roguelike zone during Eliza's storyline!
- Chemistry Lab! As Eliza's assistant, you will get access to her personal lab. Make drugs, unlock upgrades using science points, get access to prototypes. Help Eliza to fill out the transformation drug database. Each tf drug that you find and bring to her, you will be able to make yourself! Trust me, there is a lot to do.
- Transformation system! Over 20+ TF drugs. Morph into different species (including modded ones), change your gender/skin/etc. I've designed it with a few goals in mind. Gradual transformation: things will happen over time rather than instantly and all at once. Composability: you can have several TFs happening at once (unless they're completely incompatible). Full control: no change is permanent, the game will always 'remember' how your character looked originally. If you want to undo the transformations, eat a blue pill or find Eliza. But you can also make the transformations permanent by eating a red pill.. or getting force-fed one (can be toggled in options). Dynamic npc support: drugs work with both, the player and dynamic npcs. The transformative effects can even happen during sex.
- Eliza's mother. A new character that has an optional small lewd/wholesome storyline with soft incest themes. Becomes available if you complete Eliza's storyline.
- Nursery bounty board. Will be unlocked as part of Eliza's storyline. This board will show tasks that you can complete in order to receive credits and science points.
- New milking scenes with Eliza. Complete with new hot animations.
- 3 new sex poses: one new cowgirl variant, one pose of fucking someone against the wall, one pose of fucking someone on the floor.
- PregExpac mod by AverageAce integrated into the game. It has new scenes and also adds lots of little pregnancy-related touches in existing content.
- 2 new hairs. New feline tail. New skin from me. +5 new skins from AverageAce!
- You can now refuse when other npcs try to help with your restraints ([Pull request by keerifox](https://github.com/Alexofp/BDCC/pull/148))
- Fullscreen toggle. Press 'Alt+Enter' to switch between windowed and fullscreen mode. Your selection will be remembered between launches. You can also limit the game's maximum fps in the options.
- New bing auto-translator. Ability to choose the order of translators (if one translator fails, the next one in the list will be used). ([Pull request by CKRainbow](https://github.com/Alexofp/BDCC/pull/157))
- Experimental global registry cache. Speeds up game loading by at least 50% after it has been opened at least once before. If this breaks things, launch the game with '-noRegistryCache' or '-resetRegistryCache' command line options
- Better modding support for custom pawn types. Custom pawn types can now be made to persue the same goals/tasks as built-in types.
- Mods can contain datapacks inside them. (Patch by Fox2Code)
- Ability to make the game semi-portable. If you create a folder named 'BDCCData' near the .exe, the game will use it to store all of its data/saves/etc. ([Pull request by Merith](https://github.com/Alexofp/BDCC/pull/142))

### Changed
- Breast cup sizes are now procedural rather than a fixed list. Enjoy your M-cups (M stands for Milky)
- Save info cache. The game will now cache info about your saves rather than reading each one each time that info is needed. This should greatly speed up the 'Load game' menu (after it has been opened at least once).
- Sensitivity doesn't increase your arousal gain linearly anymore. 200% sensitivity will increase the arousal gain modifier only by about 30% now. This should help against you orgasming too fast.
- Can tweak the amount of space between codeblocks inside the datapack scene editor now. ([Pull request by PosionFox](https://github.com/Alexofp/BDCC/pull/137))
- Mods menu can be controlled with a keyboard ([Pull request by CheeseyCake92](https://github.com/Alexofp/BDCC/pull/158))

### Fixed
- Npcs should stop fucking you if achieving orgasm is no longer possible (fixed for real-real now).
- Npcs won't randomly tie you up anymore if you have the 'Tie Up' sex goal disabled.
- Slider-related skeleton bones (thickness, breast size) are now only scaled on 2 axis rather than all 3. This -should- help against most clipping.
- For the web build, added a browser-based text field fallback option in case you are unable to interact with Godot's text fields using your browser. This option can be enabled in the options (last one in the Other section)
- Skins menu won't reset the current page each time you switch to a new skin anymore. ([Pull request by keerifox](https://github.com/Alexofp/BDCC/pull/156))
- An extremely high amount of bug and typo fixes that were reported by the community! Too many to list.. I should have kept a list.. Thank you ^^.

## [0.1.7] - 2024-12-20
### Added
- Blacktail Market! A secret new place where you can sell your slaves for credits. Unlocked during the new storyline
- New storyline! Meet [Luxe and Mirri](https://github.com/user-attachments/assets/62d0802f-9e8f-4fdf-8fe5-b3ea758766d1), a pair of very evil characters. And that's all that this changelog is gonna tell you ^^. But it's all obviously centered around the new slave auction. This content can trigger once you have at least one slave who has fully submitted to you, can't miss it. Contains 80k+ words, a hecking novel-sized addition (I dare you to complete it in one day). 3 possible endings (and 2 small bad-endings).
- Blacktail Market can be upgraded to help you earn even more credits. Some upgrades have very interesting unlock requirements.
- Slave auction minigame. You, the player, will take a role of a slave presenter. Emphasize good traits of your slaves, avoid hitting the bidders' dislikes, fuel the bidding wars for as long as possible! A lot of work went into it, it should be a very fun minigame.
- New storyline has new unique sex animations.
- New vag/anal sex poses for the sex engine: 2 new ones for riding (lotus, standing), 4 ones for fucking (Mating press, raised leg, standing against a wall, pinned against a wall). Some are only available if there is a logical wall nearby. Lotus pose supports making out.
- 69 added to sex engine! Supports every combination of bits
- Sensitivity system for the sex engine! Your private bits will now gradually get more or less sensitive from sexual acts. This simulates 2 things, a negative and a positive. Negative: long non-stop sex will be less and less stimulating until you just can't even cum anymore. Positive: If you avoid overstimulating the private bits, they will get more and more sensitive instead. This allows you to 'train' them. For example, you can train someone to orgasm easily from anal or nipple stimulation (their default sensitivity has been nerfed quite a lot to simulate reality). Letting someone's arousal fade (denying them) will temporary raise their sensitivity. To avoid overstimulating someone, you can use the new 'pause' actions during sex
- Plugs/chastity cages/lube/some status effects all have sensitivty-related buffs/debuffs now.
- Lube can be used in the sex engine, including by npcs.
- 2 new skins (Fur-girl and Lux). 2 new hairs (ponytail-4 and a mane). New feline ears.
- Many skins for existing ears (by AverageAce)
- Support for asymmetrical bodyparts in mods (by CanInBad)
- Setting to disable/alter the auto-leveling of the pawns.
- Slave candy

### Changed
- Lust plays a lesser role in arousal gain (from 90% debuff to ~40%). For example, this means that it's possible to make someone cum from anal even if they hate anal sex (with the help of the new sensitivity system)
- Engine updated to Godot Engine 3.6
- Pawns code have been refactored, now allowing to define new pawn types through mods.
- Game should auto-rotate with the phone (but always stay in landscape mode)

### Fixed
- Npc gave birth to 0 kids thing.
- Walking around with a slave should no longer sometimes queue an interaction with random pawns.
- SlutLocks shouldn't generate impossible tasks anymore for sure..
- Some crashes like the game checking how stuffed the throat of a headless npc is.
- Typos found by CKRainbow, ScottVictorHalley, Friskygote, whalekys, klorpa and more.

## [0.1.6] - 2024-09-18
### Added
- A brand new Interaction System that makes the prison feel truly alive. All the dynamic characters are now simulated as little 'pawns' that you can see on the map. They go about their business, work, eat, shower, wander around, get themselves into trouble and more. And the player is now one of those pawns too! Stuff can be happening around the prison with you present or not, player can take any role in any interaction or be completely absent, the prison life carries on no matter what! By default, the game will simulate 30 pawns but that number can be changed in the options.
- Pawns might have sex with each other and occasionally breed each other.. if you don't want that, there is now an 'off-screen breeding chance'. You can either completely disable the breeding or lower the chances by a lot.
- Stocks/slutwall got converted into an interaction. Find and use inmates who were unfortunate enough to end up in them or be put into them yourself.
- Prostitution interaction. Whore yourself out for some credits if you want. If the client isn't satisfied, they can ask for their credits back.. but you can also scam them out of their credits if you dare! Npcs can do all of this too, thanks to the interaction system.
- If you get beaten up unconscious during sex, you stay unconscious.. One of the brave nurses will try to save you.. unless someone else puts their hands on you first.
- Talk, flirt, offer sex and attack any pawn. There is a generic 'talk' interaction in place now that allows for this.
- Ask others to help you with restraints. Or help other unfortunate folks and make friends that way.. or ask for credits instead. If you have any 'keyholder' smart-locks on your gear, you can ask to get the key back.. and see what happens.
- Npc slavery supports the interaction system now. If you put your slave into stocks, they will be simulated like any other pawn. Prositution works like this too, your slave now actually has to earn credits from clients, I don't cheat this part anymore.
- Dynamic (randomly-generated or datapack ones) characters can now earn experience from fights and level up! You won't be stuck with a whole prison of level 4 inmates anymore ^^. Npcs will randomly spend their stat points on level ups.
- A simple reputation system. There are 4 reputations now: Whore, Alpha, Inmates respect, Staff respect. They all have multiple levels and come with some benefits. For example, the whore reputation will make people agree to fuck you more.. which helps a lot with prostitution. Sometimes you will need to do a special challenge to go to the next reputation level.
- Pawns around you will occasionally comment on your state and actions, increasing certain reputations.
- A (very) simple relationship system. Any pair of characters now has a lust and affection values shared between them. Earn affection by chatting or helping.. lose it by attacking. Earn lust by satisfying them in sex or flirting. Some actions become available at certain affection and lust levels.
- Child records auto-optimizer. Enabled by default for new players but disabled for old saves. What it does is 'archive' the oldest kid entries once their amount goes over the specified limit. Archived records are stripped of most information like name/species, they only retain the father and mother ids and the amount of kids. This should help against save bloating for very breed-eager folks. Kids will obviously never play a huge part in BDCC's gameplay so you're not losing much. The nursery scene is edited to support the archived records.
- TightLock smart-lock got overhauled. It now has an alternative unlock method that doesn't require restraint keys. Metal tight-locked restraints can now be unlocked with a stun baton (by frying the lock off) and leather/rope restraints can be unlocked with a shiv (by cutting through them). The item gets consumed and the restraint gets destroyed in the process.
- Minimap supports zooming now
- Added 7 skins made by AverageAce!
- Added shower masturbation scenes writted by AverageAce.
- New code blocks for the scene editor. Global flag editing, relationship and reputation related ones.
- Can now quickly change the UI scale inside the scene editor, allowing to fit more blocks on screen.
- +5 and +10 buttons for quickly upping the stats (by PoisonFox).

### Changed
- Sex doesn't end instantly when dom's goals are satisfied now. It will end once the latest sex activity has ended instead.
- Can use the Space key in the struggling minigame now as an alternative to clicking.
- Datapack editors should work a little better on androids, all the drop-down lists were replaced with smart ones that don't break with a huge amount of entries (there was no scrollbar)

### Fixed
- Crash that was happening when you were putting the same codeblock into itself.
- Fixed ability to just take off smart-locked blindfolds, plugs and harnesses.
- Fixed SlutLock giving you impossible tasks (like swallowing cum on a ballgag)
- 'Excluded from encounters' checkbox should now work properly for the datapack characters.
- Your ability to see the typos that the game has is now removed.

## [0.1.5] - 2024-08-02
### Added
- Added ability to create scenes and quests with datapacks! Give your characters whole storylines or just a unique encounter or two, the new system is very flexible. No need to pull your hair out with the godot editor, new scenes/quests could be created entirely from inside the game. No need to learn complicated scripting languages, I coded a simple (but powerful) visual system where you create scenes by assembling them out of blocks (Scratch-like system).
- [Scene/quest editor](https://github.com/user-attachments/assets/9d08c8fc-e7b6-4357-97d5-09a1678673f4). Packed full of little features that should save you, the creators, your time and nerves. See your scene running in-game with just one button press. Built-in spell checker. Ability to save and reuse whole blocks of.. blocks. Simple undo-redo system. Lots of little sub-windows that will help you add bbcodes into your text, choose animations and locations. If you want to learn how to use this editor to create scenes, I wrote a [tutorial](https://github.com/Alexofp/BDCC/wiki/Datapack-scene-creator-tutorial) that will hopefully help you get started. There is also a page that contains some [advanced topics](https://github.com/Alexofp/BDCC/wiki/Datapack-scene-creator.-Advanced-stuff) like how to start fights or do hand-written sex scenes.
- Ability to reload datapacks. This will reset the characters to their initial datapack state while keeping some stuff like their slavery status. Useful if datapack got updated.
- You can now choose which mods and datapacks your datapack depends on. Missing dependencies will be seen as red for the users. (If you have submitted any datapacks that use mods, it would be great if you'd re-submit them with the required mods specified)
- Skins added by the datapacks now display their author and datapack id.
- Datapack characters got more settings. Can make them feel more scripted by excluding them from encounters. Can make them struggle out of restraints better or worse.
- (All contributed by AverageAce) Better room descriptions, Announcer sells more bdsm restraints, Alex/Risha/Eliza got unique features shown on their dolls (Alex's spine, Risha's piercings, Eliza's necklace), better sheath sprite.
- (Sprites by MaxMaxouCat) Alternative nurse uniform with crocs. Nurses will spawn with one or the other.
- Added critical failures to the struggling minigame that make the gear sit more tightly on you.
- [Smart locks](https://github.com/user-attachments/assets/3fdbe411-fb85-4b46-b766-7afbb7c28570)! When tying you up, NPC's now might add one of 3 possible smart locks onto the locked gear, making struggling out of them impossible. The frequency of this can be changed in the settings. The 3 types of smart locks are:
- Tight lock. Can only be unlocked by using multiple restraint keys.
- SlutLock (tm). The most frequent smart-lock. Can only be unlocked by completing a task (or tasks) that the lock gave you. As you can guess, it gives you some very slutty tasks..
- Keyholder lock. You must beat-up the person who locked you to get the unique key required to open the smart-lock.
- Restraint keys are now illegal and are only sold by Announcer at a 3x price. But you will also loot more restraint keys if you have any smart locks on you.

### Changed
- Images (skins/portraits) stored inside datapacks will be loaded only when needed, hopefully speeding up datapack loading.
- Code for the struggling minigame/system got refactored and cleaned up.
- Can now export datapacks from the web version.

### Fixed
- Datapack characters should now spawn with full balls.
- Datapacks that have ID that's different from the filename should now work better and be delete-able.
- Taypo down. 69+ more to go.

## [0.1.4] - 2024-07-01
### Added
- [Artica Sparkle](https://github.com/Alexofp/BDCC/assets/14040378/0e38161d-02a3-4e77-b82a-8be539b56149) arrives to BDCC! She is the star of this update, an extremely shy fluff.. but you know what they say about the shy ones.. You can find Artica going through her intake process by hanging around near the checkpoint (player level required 10+). Help her adjust to her new prison life and find out about how such a shy girl managed to ended up in such a dark place.
- Artica's content is focussed on these kinks: Corruption, breeding, pawplay (a lot of pawplay). But there are also scenes that include: forced nudity, chastity, tentacles, portals, hypnosis.. and much more that I won't spoil x3. Artica has so much written scenes that I had to split it into 3 google docs, it was just getting too laggy, hah. Total word count is 116k words/463 pages of text! It's not just lewd though, her content has so much more: casual stuff, wholesomeness, drama, roughness, everything! Her content has 2 endings too, a happy and.. a different one
- Artica's content has a loooot of new animations, make sure to check her scenes out.
- Datapacks! Datapacks allow you to easily create and share custom characters and also skins! Skins are loaded automatically but for the new characters to appear in your save you gotta 'load' the datapacks from inside the 'in-game menu -> Datapacks' menu.
- Datapacks editor. Fully built-in into the game, no coding knowledge or godot editor required. Create new characters and skins (and, maybe in the next updates, new scenes too)
- Datapack browser. Allows you to easily download other people's datapacks from inside the game (The list is handled by me, submit your datapacks in the #datapacks channel!)
- Options to adjust the size of pregnant bellies. Keep it realistic-ish or make it silly big! Also an option to scale the size depending on the litter size.
- Penises now have particles when cumming/cumming-inside! Don't expect fluid physics but it's better than nothing x3. Can disable them in the settings or increase the intensity and make them look silly!
- 3 new ear types for Canines. 1 new haircut. 1 new skin
- Lots of new alternative skins for existing hair by AverageAce

### Changed
- Slave haircut changing scene now supports changing the skin of the hair.

### Fixed
- Typpots (thanks to Rayfoward, Disillusioned-Gazer, Sayonix and Johnvic76)
- Some crashes (thanks to CanInBad)
- The debug command to duplicate npcs should work with the player now
- Crash that happens when you try to use a penis pump.. without a penis

## [0.1.3] - 2024-03-28
### Added
- Introducing [Socket](https://github.com/Alexofp/BDCC/assets/14040378/d78eaff7-f107-4512-89aa-87963cc775f5)! A new easy-going fennec enginner that needs help settling in. Help her do some little tasks around the station while getting into some lewd situations. Her content is focussed around casual sex and free use. To start her content visit the workshop after completing (or skipping) the portal panties quest. Socket's content comes with a lot of custom assets, animations, scene art, unique clothing. The production value for her content is very high ^^
- Ability to enslave dynamic NPCs! Break their spirit, kidnap them into your cell (Socket will help you prepare your cell for that), make them submit to you (like 4 ways to do it, be careful not to break their mind), train them! This is easily the feature that took the most time to complete. Still mostly a framework but there is already some fun to be had for sure. The framework is also highly expandable, including with mods ^^
- 3 specializations/skills for your slaves. Submissive, slut, pet. Focus on 1 or spend the time to train all 3 to a single slave, your choice. Submissive slaves can be trained to serve you, sluts can be trained to do prostitution, pets you can do walkies around the station with!
- Lots of basic actions to interact with your slave. Reward/punish your slave, talk with them, parade them around the station on a leash, force them into stocks, give them showers, manage their clothes, change their haircut.. Or just fuck them.
- Staff can also be enslaved but you will have to find a way to get your hands on some collars
- Inmate uniforms and underwear can now be [visibly damaged](https://github.com/Alexofp/BDCC/assets/14040378/f20408b0-f6d9-45af-aec6-816a1b2d363f) in procedural sex. Uniform has many damaged states, from just a few little holes to being mostly destroyed! Repair your clothing in the laundry (Damaged uniform sprites by MaxMaxouCat)
- Underwear, strapons and rope harness can now be dyed any color in the laundry!
- Fennec head, ears and tail. Also 1 new hair and skin
- Sybian can be installed in your cell by Socket. Ride it alone or with a slave
- Vents. Socket can now clear some vents for you, giving you one-way fast-travel to some locations around the station
- More dick skins by AverageAce!
- [Tail scale slider](https://github.com/Alexofp/BDCC/assets/14040378/f455fb16-17a1-4238-ba9b-90723e080ac5). Make your tail bigger or smaller in the character creator
- Ability to change the names of how npcs self-identify (herm, peachboy, etc) in the options
- Highly-experimental feature of turning any static npc into a dynamic one with the ability to enslave them. Accessable only through the debug menu

### Changed
- Restraints are grouped better in fights ([Pull request by Dalt](https://github.com/Alexofp/BDCC/pull/56))
- Hypnovisor is more likely to be used by npcs with hypnosis fetish
- Computer hacking minigame for vion's cage should easier ([Pull request by PeteTimesSix](https://github.com/Alexofp/BDCC/pull/55))

### Fixed
- Bugs und tuppos
- Can't crash the game by putting a penis pump on a female npc anymore
- Toggling the perk off now should truly toggle it off, removing any buffs

## [0.1.2] - 2024-01-23
### Added
- Alex Rynard content greatly expanded and is now finished. Help him figure out what the meaning of trust is. (70k new words/300+ pages of text, someone should stop me from doing such big projects)
- 4 'trust exercises' with Alex that are gradually unlocked over the course of his content. Lots of kinky stuff here like sex machines (includes new animation for sybian)
- Hypnokink mod by PeteTimesSix is integrated into the game. This is the first time I added content content that wasn't written by me ^^
- Portal panties rewamp! [Portal sex animations added](https://github.com/Alexofp/BDCC/assets/14040378/d6a54186-9ef1-46ec-9775-3cf19651850a). The random events now use the dynamic npcs. You can now buy portal panties and fleshlights from Alex after completing the portal panties quest. Can now force portal panties onto dynamic npcs (and have fun with them remotely). It's a big feature ^^
- [Penis pumps](https://github.com/Alexofp/BDCC/assets/14040378/17afd77c-f80e-4976-9ab6-07d1409cf86f). Can be bought from the medical. Can be used in procedural sex (and also used in a few new written scenes)
- Advanced chastity cage. Can be unlocked after the last trust exercise with Alex
- Loading screen now has a progress bar that shows what the game is currently doing
- Can choose to keep restraints on npcs after procedural sex.
- Can remove bdsm gear from subs during procedural sex (you will break it if you don't have the gear collector perk)
- 2 new cowgirl sex poses added to procedural sex. One that is just an alternative and one that combines choking and riding.
- Spanking added to the procedural sex. The dom can make you count the spanks.
- Depending on how hypnotized you are, you will now lose control (and do the most obedient action automatically) as a sub during procedural sex.
- Option to enable a harder struggling minigame (pull request by Dalt)
- 3 new skins by AverageAce + lots of new alternative dick skins from them
- Mod-makers can now define a function for their modded species that executes on each new generated dynamic npc of that species (useful for lots of things like changing bodyparts/skins)

### Changed
- Tooltip that shows someone's fetishes is now twice as wide and has 2 columns to fit more text (lots of fetishes these npcs have, huh)
- Android version should now be able to load saves from your documents/BDCCSaves folder without you having to go through the import process.
- Refactored how the (non-player) characters handle their equipped items. They now compare what they have to what they should have and fix that rather than resetting their entire inventory each time (with some help from Ranchar who added persistant items support)
- Pressing the 'forget' button in the encounters menu will ask for confirmation only once

### Fixed
- Inventory UI was making the rest of the ui go off-screen on small resolutions.
- Tyypos and some bugs
- Punctuation fixes by Rayforward

## [0.1.1] - 2023-11-22
### Added
- Jacki's content has been greatly expanded (173 pages/44k words). You can now find her in the gym after the stocks event. Fair warning, her content is based around some heavy kinks such as anal fisting, roughness, sounding, genital torture. Not much breeding there. But you can also corrupt the wolfie using kind methods.
- Some Alex Rynard content (45 pages/9.9k words). This is mostly an intro to his content, not much lewds there yet.
- Hypnovisor mk1 item. Can be bought from Alex if you complete his current content. Can be used in procedural sex
- [New inventory UI](https://github.com/Alexofp/BDCC/assets/14040378/069fc12b-41da-4765-bb72-9bcc249c5ada). Inventory and Looting/Vendomat/Stashing scenes now have a special new ui. It features icons for each item, a search bar and also item grouping to help against clutter.
- Breeder skill. Can be trained by orgasming inside others (filled strapons also counting) and getting people pregnant. Features 14 perks (2 perks were moved from the Cum Lover skill)
- Cum lover skill received 2 new replacement perks. Cum lover skill doesn't get trained from cumming inside others anymore.
- New 'from behind' pose for the vaginal/anal procedural sex.
- 4 new skins, one of them is for Jacki. [Preview](https://github.com/Alexofp/BDCC/assets/14040378/2336b53e-dc49-4d89-ab24-6b42cb9b3e3c)
- Impregnation chance modifier added to the game's options.
- Sex Event system that will power a lot of the future features (and is already used in the new perks)

### Changed
- Impregnation chances lowered by 75%. (Breeder skill helps to counter that)
- Underwear and some status effects provide attribute (strength/agility/etc) buffs rather than stat buffs.

### Fixed
- Fixed your bra becoming invisible if it was unequipped by breast pumps during procedural sex.
- Typpos

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

[Unreleased]: https://github.com/Alexofp/BDCC/compare/0.1.8...main
[0.1.8]: https://github.com/Alexofp/BDCC/compare/0.1.7...0.1.8
[0.1.7]: https://github.com/Alexofp/BDCC/compare/0.1.6...0.1.7
[0.1.6]: https://github.com/Alexofp/BDCC/compare/0.1.5...0.1.6
[0.1.5]: https://github.com/Alexofp/BDCC/compare/0.1.4...0.1.5
[0.1.4]: https://github.com/Alexofp/BDCC/compare/0.1.3...0.1.4
[0.1.3]: https://github.com/Alexofp/BDCC/compare/0.1.2...0.1.3
[0.1.2]: https://github.com/Alexofp/BDCC/compare/0.1.1...0.1.2
[0.1.1]: https://github.com/Alexofp/BDCC/compare/0.1.0...0.1.1
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
