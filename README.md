# LewdGame
Text based game about being a prisoner in a space prison with a lot of adult themes. Working title is Broken Dreams Correctional Center or BDCC for short

This game is influenced a lot by other erotic text rpg games like Trials in the Tainted Space and Lilith's Throne. The idea of a scifi space prison setting came from a place inside second life called RRDC

![lewdgame](https://user-images.githubusercontent.com/14040378/152139569-070cfd47-f74c-4a32-bb51-93567e9b2778.PNG)

Heavy wip

Uses Godot 3.4.2 engine

## So far these things are done:
- Scene framework that supports any number of nested scenes, replacing scenes, scenes returning result. Basically everything is a scene
- Player customization with ability to pick one specie or make a hybrid combining two. Little preview window that shows how player character looks. Some scenes will animate the player
- World scene which allows to traverse the rooms and interact with them
- Simple combat system that has some strategy to it
- Status effects such as bleeding or being gagged/blindfolded/restrained which have their effect both in and outside the fights
- Characters framework with ability to define how they fight and react
- Inventory system. You can put on items or interact with them. Things like gags can override the default behaviour so you can't just take them off. Items can have buffs/debuffs. Any character has an inventory 
- A simple yet very powerful saving/loading system that allows to save the game state at any point in any scene
- Intro scene where the player gets captured and put in jail
- Basic prison activities like sleeping in cell, working in mines, eating in the canteen, showering, etc etc
- Events system, decoupled from the world, allowing to avoid a lot of the messy code but also very flexiable. Flags are an easy way to remember things and they are also saved/loaded with no extra work
- Quest system + Quest log. Doesn't provide much logic on it's own but each quest is a separate object which helps to avoid files with 3k+ lines. Works great together with events and flags
- Modules. Module can add new scenes, characters, events and quests which allows for easy moddability and extendability


## Things that will be worked on in the following months:
- Story scenes, introduction to some prison characters, ability to talk/interact/fight with them.
- Introduction of sex scenes. Things that come with that such as tracking of fluids/messyness
- A few quests and events, just to see how well the current system works
- RPG elements, skills and perks
- Release of the first public build

Check out my trello to see what my current tasks are:
https://trello.com/b/l3DsQlz5

I plan to keep this project open source, everyone is welcomed to propose additions. Though please don't expect them to be merged 100%. My writing skills aren't the best so feel free to edit the text of my scenes to make them more interesting.
