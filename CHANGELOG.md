# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Simple Rahi romance path
- Condoms. PC will be able to use them in certain scenes. They will alter the scene slightly unless I'm lazy. Condoms can break unless disabled in options
- Rahi shower event, first sex scenes with Rahi are added
- An expandable system to pick a random scene based on weights and conditions.
- Characters now have support for the bodypart system that the player uses. Less code duplication
- Semen inside other characters is now tracked and shown as a status effect, same as player.
- Pregnancy! You can get pregnant and give birth in the nursery. There you can also track all your kids. Can't interact with them (and will never be able to, is an adult game). Other characters give birth automatically when the time is right (you will be notified)
- Menstrual cycle simulation for you and non-playable female characters. You can go into heat and ovulate (if you have a pussy ofc). Each eggcell/ovum inside your womb is simulated and tracked. The same code is used for other characters
- Birth control pills, breeder pills, heat pills, pregnancy testers

### Changed
- Pink inmates are now called lilacs because I like the name
- Vendomats now use item tags rather than a hardcoded list of items.
- Mentioned Mekyro on the credits screen

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

[Unreleased]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix3...main
[0.0.13bugfix3]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix2...v0.0.13bugfix3
[0.0.13bugfix2]: https://github.com/Alexofp/BDCC/compare/v0.0.13bugfix1...v0.0.13bugfix2
[0.0.13bugfix1]: https://github.com/Alexofp/BDCC/compare/v0.0.13...v0.0.13bugfix1
[0.0.13]: https://github.com/Alexofp/BDCC/releases/tag/v0.0.13
