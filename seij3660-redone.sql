create database if not exists seij36609;
use seij36609;

-- DROP TABLE IF EXISTS `race`;

CREATE TABLE if not exists `race` (
  `raceName` varchar(255) NOT NULL DEFAULT '',
  `raceSummary` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`raceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `race` WRITE;

UNLOCK TABLES;

-- DROP TABLE IF EXISTS `faction`;

CREATE TABLE if not exists `faction` (
  `factionName` varchar(255) NOT NULL DEFAULT '',
  `factionSummary` varchar(5000) DEFAULT NULL,
  `raceName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`factionName`),
  KEY `raceName` (`raceName`),
  CONSTRAINT `faction_ibfk_1` FOREIGN KEY (`raceName`) REFERENCES `race` (`raceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `faction` WRITE;

UNLOCK TABLES;

-- DROP TABLE IF EXISTS `unit`;

CREATE TABLE if not exists `unit` (
  `unitName` varchar(255) NOT NULL DEFAULT '',
  `unitSummary` varchar(5000) DEFAULT NULL,
  `pointCost` int(11) DEFAULT NULL,
  `image` varchar(5000) DEFAULT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unitName`),
  KEY `factionName` (`factionName`),
  CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`factionName`) REFERENCES `faction` (`factionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `unit` WRITE;

UNLOCK TABLES;


-- DROP TABLE IF EXISTS `player`;

CREATE TABLE if not exists `player` (
  `armyID` int NOT NULL auto_increment,
  `raceName` varchar(255) DEFAULT NULL,
  `factionName` varchar(255) DEFAULT NULL,
  `unitName` varchar(255) DEFAULT NULL,
  `pointsRemaining` int(11) DEFAULT NULL,
  PRIMARY KEY (`armyID`),
  KEY `factionName` (`factionName`),
  KEY `raceName` (`raceName`),
  KEY `unitName` (`unitName`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`factionName`) REFERENCES `faction` (`factionName`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`raceName`) REFERENCES `race` (`raceName`),
  CONSTRAINT `player_ibfk_3` FOREIGN KEY (`unitName`) REFERENCES `unit` (`unitName`)

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `player` WRITE;

UNLOCK TABLES;





insert into race 
values ('Imperium of Man', 'The Imperium of Man is the galaxy-spanning 
interstellar empire which rules over the vast majority of the Human 
race in the 41st Millennium AD. The founder and immortal ruler of the 
Imperium is the Emperor of Mankind, the God-Emperor of a million worlds 
who is the most powerful Human psyker ever born.')
on duplicate key update raceName = raceName;

insert into race 
values ('Chaos','Chaos, also known to its servants as the Primordial 
Truth or the Primordial Annihilator, and to the Imperium of Man as the 
Archenemy, is the universal and usually malign spiritual force embodied 
by the malevolent intelligent entities comprised of psychic energy that 
live in the Immaterium.')
on duplicate key update raceName = raceName;

insert into race 
values ('Xenos','Xenos is a High Gothic term used by the people and 
adepta of the Imperium of Man that means "stranger" and "alien." 
It is often used by the Adeptus Terra to signify enemy aliens or 
off-world, non-Human forces.')
on duplicate key update raceName = raceName;
/*


factions


*/

-- human factions 
insert into faction
values('Space Marines','The Space Marines or Adeptus Astartes are foremost amongst 
the defenders of Humanity, the greatest of the Emperor of Mankind`s warriors. They 
are barely Human at all, but superhuman; having been made superior in all respects 
to a normal man by a harsh regime of genetic modification, psycho-conditioning and 
rigorous training.','Imperium of Man')
on duplicate key update raceName = raceName;

insert into faction
values('Astra Militarum','The Astra Militarum, also known as the Imperial Guard in 
colloquial Low Gothic, is the largest coherent fighting force in the galaxy. They 
serve as the Imperium of Man`s primary combat force and first line of defence from 
the myriad threats which endanger the existence of the Human race in the 41st 
Millennium. ','Imperium of Man')
on duplicate key update raceName = raceName;

-- chaos factions
insert into faction
values('Chaos Space Marines','Chaos Space Marines, also sometimes called Traitor 
Marines, Renegade Marines, or Heretic Astartes, are former Space Marines of the 
Imperium of Man who have chosen to abandon the service of the Emperor of Mankind 
and dedicate themselves to Chaos to achieve their own ends. ','Chaos')
on duplicate key update raceName = raceName;

insert into faction
values('Dark Mechanicum','The Dark Mechanicum, also sometimes referred to incorrectly 
as the Dark Mechanicus, and who refer to themselves as the "New Mechanicum," is a sect
 of traitorous Tech-priests, members of the Collegia Titanica and Chaos Knights of the 
 ancient Mechanicum who have become Hereteks in service to Chaos. ','Chaos')
 on duplicate key update raceName = raceName;

-- xenos factions
insert into faction
values('Necron','The Necrons are a mysterious xenos species of humanoid, robotic 
skeletal warriors that have lain dormant in their stasis-tombs for more than 60 
million Terran years, though they have begun to awaken at last. They are the soulless 
creations and former servants of the ancient C`tan, the terrible Star Gods of Aeldari
 myth. ','Xenos')
 on duplicate key update raceName = raceName;
insert into faction
values('Tyranid','The Tyranids are an extragalactic composite species of hideous, 
insectoid xenos. They actually comprise an entire space-faring ecosystem comprised 
of innumerable different bioforms which are all variations on the same genetic 
theme. ','Xenos')
on duplicate key update raceName = raceName;
/*



space marine units



*/
-- space marine big
insert into unit
values('Siege Dreadnought','Siege Dreadnoughts are equipped for breaking through 
fortified enemy positions. They are armed with an assault drill 
with a built-in heavy flamer on one arm and an Inferno Cannon on the other.', 3 ,
'temp','Space Marines')
on duplicate key update unitName = unitName;

insert into unit
values('Ironclad Dreadnought','Ironclad Dreadnoughts are equipped for close quarter combat. 
 Trading long-range weaponry for thicker ceramite plating, they are capable of withstanding
 heavy firepower.', 3 ,'temp','Space Marines')
 on duplicate key update unitName = unitName;

insert into unit
values('Hellfire Dreadnought','Hellfire Dreadnoughts are equipped for long range fire support. 
They are armed with heavy weapons like assault cannons and missle launcher racks.',
 3 ,'temp','Space Marines')
 on duplicate key update unitName = unitName;

insert into unit
values('Captain', 'A captain is responsible for commanding a company of space 
marines.', 3 ,'temp','Space Marines')
on duplicate key update unitName = unitName;

-- space marine medium
insert into unit
values('Predator','The Predator has a long-barreled Syrtis Pattern Autocannon main armament which 
makes it most effective in an anti-infantry role.', 2 ,'temp','Space Marines')
on duplicate key update unitName = unitName;

insert into unit
values('Stalker','The Stalker is an adaptation of the Hunter Standard Template Construct (STC) 
that was unearthed by the Adeptus Mechanicus only a few standard millennia ago. Mounting a pair of independently 
tracking Icarus Stormcannons, the Stalker can target multiple enemy contacts, stitching the 
skies with a hail of armour-piercing rounds.', 2 ,'temp','Space Marines')
on duplicate key update unitName = unitName;

-- space marine normal
insert into unit
values('Agressor Squad', 'Aggressors are tasked with close-range fire support and have been outfitted 
with modified suits of Mark X Gravis Power Armour refitted to carry a shoulder-mounted Fragstorm 
Grenade Launcher. ', 1 , 'temp', 'Space Marines')
on duplicate key update unitName = unitName;

insert into unit
values('Infiltrator Squad', 'Infiltrator Squads are considered battleline squads. They are flexible enough to 
press home an attack, or hold a position with withering firepower. Whatever the strategic challenge, 
battleline squads are usually equal to the task. ', 1 , 'temp', 'Space Marines')
on duplicate key update unitName = unitName;

-- Necron Small Category

insert into unit
values('Necron Raiders', 'Necron raiders are infantry armed with Gauss Flayers, and heavy armour, they may be human sized, but with their powerful weaponry they can take down very strong opponents with relative ease.', 1, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Necron Warriors', 'Necron Warriors are infantry armed with Gauss Flayers, and heavy armour, they are the most basic type of Necron troop, due to their bodies being made of living metal, they can quickly heal up and re enter combat if hurt.', 1, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Necron Deathmarks', 'Necron Deathmarks are powerful and patient assassins. They have the ability to phase in between dimensions at will and their Synaptic Disintegrator rifles make them an extremely dangerous force to be reckoned with.', 1, 'temp', 'Necron')on duplicate key update unitName = unitName;


-- Necron Medium Category
insert into unit
values('Canoptek Spyder', 'Canoptek Spyders are essentially automated drones with very intricate programming. These creatures serve as commanders of small squads and control Wraiths to protect the Necron tomb they are guarding.', 2, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Tomb Blade', 'Tomb Blades are medium sized spacecraft armed with dual Gauss Blasters. These units are quick and deadly.', 2, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Triarch Praetorian', 'Armed with the Rod of Covenant, the Triarch Praetorian stays out of the battle for a while and observes before diving head first into the enemy and turning the tide of the battle.', 2, 'temp', 'Necron')on duplicate key update unitName = unitName;

-- Necron Large Category
insert into unit
values('Annihilation Barge', 'Annihilation Barges are generally used as anti-infantry vehicles, armed with twin-linked Tesla Destructors, they can take out large swaths of enemies quickly and efficiently. However, they are slow and are mainly used for defensive measures.', 3, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Doomsday Monolith', 'The Doomsday Monolith is a crucial piece to any Necron army. Capable of deploying extra Necron warriors from reserves. Other than that, it is mostly unhelpful in terms of offensive power.', 3, 'temp', 'Necron')on duplicate key update unitName = unitName;
insert into unit
values('Doom Scythe', 'The Doom Scythe is a very dangerous and powerful unit. Armed with a death ray and dual Tesla Destructors, this unit is able to win battles entirely on its own.', 3, 'temp', 'Necron')on duplicate key update unitName = unitName;







-- Tyranid Small Category
insert into unit
values('Tyranid Warrior', 'The foot troops of the Tyranid army, these warriors are equipped with Deathspitters and their fangs and claws, these units are quite dangerous.', 1, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Tyrant Guard', 'These guards were bred specifically to guard the hive. With tough carapaces and deadly claws, fangs, and boneswords, they make great infantry.', 1, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Termagant', 'Equipped with spike rifles these small fighters are quick and deadly, however, their small stature means they are quite vulnerable to larger and more powerful enemy units.', 1, 'temp', 'Tyranid')on duplicate key update unitName = unitName;

-- Tyranid Medium Category
insert into unit
values('Broodlord', 'Broodlords lead the genestealer squads as the first one to make planetfall whenever the Tyranids engage in a war.', 2, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Lictor', 'Very stealthy, Lictors have chameleonic skin and can blend into their surroundings, allowing them to make deadly attacks with their large, mantis-like claws.', 2, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Biovore', 'The Biovore was bred to launch mortar-like spore mines onto the enemy from afar. They are essentially biological artillery cannons.', 2, 'temp', 'Tyranid')on duplicate key update unitName = unitName;

-- Tyranid Large Category
insert into unit
values('Hive Tyrant', 'Hive Tyrants act as a mobile, highly deadly, hive mind for the Tyranid Swarm. They can be armed with a multitude of bioweapons and are equally as deadly with any of them.', 3, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Carnifex', 'The Carnifex is so large and strong that it can simply charge through enemy squads and use its bulk to crush them beneath its feet. However, in addition, the Carnifex is capable of wielding many different bioweapons.', 3, 'temp', 'Tyranid')on duplicate key update unitName = unitName;
insert into unit
values('Trygon', 'These giant serpentine creatures have the ability to send out bio-electric pulses to harm their enemies. As well, the Trygon can quickly burrow under their enemies and collapse the tunnels they`ve made to cause chaos and harm to them.', 3, 'temp', 'Tyranid')on duplicate key update unitName = unitName;








-- Dark Mechanicum Small Category
insert into unit
values('Tech Priest', 'The Tech Priests are engineers and masters of technology who serve the Dark Mechanicum. They are quite adept at carrying out repairs on any mechanical units that need it.', 1, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;
insert into unit
values('Technoarcheologist', 'Technoarcheologists, also known as constructors, are amongst the “Artisan” rank of the Tech Priests, they design all sorts of things which contribute to the war effort, including weapons, spacecraft, and many other military adjacent things.', 1, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;
insert into unit
values('Techmarine', 'Techmarines are armed with many weapons, such as Forge Bolters, Grav-Pistols, and plasma cutters. As well, in order to deal with close combat threats, they carry a Omnissian Power Axe.', 1, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;

-- Dark Mechanicum Medium Category
insert into unit
values('Drop Pod', 'The drop pod is a lightly weaponized vehicle which can be useful for getting troops deep within or behind enemy lines in order to get the drop on them.', 2, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;
insert into unit
values('Rapier Battery', 'Comprised of two gunners and two heavy artillery, this small squad can deal quite a bit of long range damage; however, if the gunners are taken out other units must fill their place if you wish to fire the artillery.', 2, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;
insert into unit
values('Daemon Prince', 'Armed with any combination of melee and/or ranged weapons, daemon princes are highly customizable and highly deadly. Due to their size and ferocity they can tear through enemy forces quickly and efficiently with the right equipment.', 2, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;

-- Dark Mechanicum Large Category
insert into unit
values('Kaban Machine', 'The Kaban machine stands at approximately 10 metres tall and wields heavy weaponry and armour, making it a powerful offensive and defensive unit. Some of the weapons on this unit are so specialised that they exist only on this machine.', 3, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;
insert into unit
values('Contemptor Dreadnought', 'Armed with both melee and ranged capabilities, this heavily armoured unit is truly devastating with the right positioning, as it is hard to damage and deals a lot of damage to its enemies.', 3, 'temp', 'Dark Mechanicum')on duplicate key update unitName = unitName;








-- Chaos Space Marines Small Category
insert into unit
values('Chaos Marine', 'The most basic unit of the Chaos Marine army. Depending on which devotion your Chaos Marine army follows these units can vary greatly in their loadout.', 1, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Plague Marines', 'Armed with grenades and two other special weapons of your choice, these units can fit many different roles. Whether it be taking care of infantry or busting high-level units, or anything else you might need.', 1, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Chaos Raptors', 'Quick and mobile with high damage capabilities, these units can manoeuvre around the battlefield with ease and take down large units quickly. However, they are quite fragile compared to some other units.', 1, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;

-- CSM Medium Category
insert into unit
values('Obliterators', 'Obliterators hold powerful heavy weaponry and special weaponry. Using their plasma cannons they can cut through large units and squads alike quickly and efficiently all while continuing to press forward into enemy lines.', 2, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Havocs', 'Havocs are very efficient units for anti-infantry and anti-armour purposes. Mainly used as supporting fire for their fellow infantry, these units send volleys of intense flames at their enemies.', 2, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Chaos Lord', 'Chaos lords are a force to be reckoned with, wielding lightning claws to deal quick and devastating close range damage in rapid succession.', 2, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;

-- CSM Large Category
insert into unit
values('Winged Daemon Prince', 'Armed with flight and a plethora of options for weaponry the Daemon Prince is an extremely dangerous fighter. Because of its customizability this unit is extremely versatile', 3, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Heldrake', 'Heldrakes are flying amalgamations of human, machine, and daemon. They are excellent at taking down opposing aircraft and large swaths of infantry. They are generally armed with ranged weapons in addition to their talons for melee.', 3, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;
insert into unit
values('Helbrute', 'Helbrutes are a form of Dreadnoughts who have been heavily corrupted by the forces of Chaos. Their corruption removes their sanity and turns them into bloodthirsty power houses with customizable range and melee options.', 3, 'temp', 'Chaos Space Marines')on duplicate key update unitName = unitName;



-- Astra Militarum Small Category
insert into unit
values('Infantry Squad', 'These squads are simply a group of standard soldiers of the Imperial army. They have ranged capabilities and benefit from sound tactics and strategies.', 1, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Conscripts', 'Exactly what they sound like, soldiers who have been conscripted to the Astra Militarum in order to protect their planet from immediate threats.', 1, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Tempestus Scions', 'Also known as Storm Troopers, these soldiers are trained from a very young age to fight and win wars. They wield Hellpistols and Lasguns as well as very protective armour.', 1, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;

-- Astra Militarum Medium Category
insert into unit
values('Scout Sentinels', 'These vehicles are armed with some heavy firepower and great manoeuvrability. They can be dropped into a battlefield and immediately start moving and fighting without breaking pace.', 2, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Basilisk', 'The Basilisk is a heavily armoured mortar tank. It is extremely adept at taking down lage squads from long distance.', 2, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Leman Russ Tanks ', 'These tanks sport nearly unbreakable front facing armour and an extremely powerful front facing cannon. These tanks are quite the defensive machine.', 2, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;

-- Astra Militarum Large Category
insert into unit
values('Imperial Knight', 'Imperial knights are large high powered mechs which are extremely customizable and deadly. These machines can support almost any weapon, whether it be for close range or long range.', 3, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Ordinatus', 'Ordinatus` are gigantic war vehicles that have many different versions and build types. Each different kind has different specialties. These war machines are an instant threat to any opposition the second it hits the battlefield.', 3, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;
insert into unit
values('Titan', 'Titans, similar to the Ordinatus and the Imperial Knights, come in many different variations. These war engines serve as walking battleships that tower hundreds of metres high and pack firepower just as intimidating.', 3, 'temp', 'Astra Militarum')on duplicate key update unitName = unitName;





