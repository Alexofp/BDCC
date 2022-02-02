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

## Things that will be worked on in the following months:
- More customization/animations for the player
- Start writing the prison itself, adding basic activities like sleeping in cell, working in mines, eating in the canteen, showering, etc etc
- Create an event system that can trigger special scenes half-randomly or after some requirements were met
- Quest system with the main quest being 'escape the prison'

Check out my trello to see what the current tasks are:
https://trello.com/b/l3DsQlz5
