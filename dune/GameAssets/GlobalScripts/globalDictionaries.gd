extends Node

#Set of Dictionaries that BoardState references

#These are stored separately because they represent the base object
#that other scripts will copy and compare to.

@onready var spiceBlowDeckDictionary := {
	"Broken Land" : 8,
	"Cielago North" : 8,
	"Cielago South" : 12,
	"Funeral Plain" : 6,
	"Habbanya Erg" : 8,
	"Habbanya Ridge Flat" : 10,
	"Hagga Basin" : 6,
	"Old Gap" : 6,
	"Red Chasm" : 8,
	"Rock Outcroppings" : 6,
	"Sihaya Ridge" : 6,
	"South Mesa" : 10,
	"The Great Flat" : 10,
	"The Minor Erg" : 8,
	"Wind Pass North" : 6,
	"Sandtrout" : 0,
	"Shai-Hulud0" : 0,
	"Shai-Hulud1" : 0,
	"Shai-Hulud2" : 0,
	"Shai-Hulud3" : 0,
	"Shai-Hulud4" : 0,
	"Shai-Hulud5" : 0,
}

@onready var territoriesSafeFromStorm := {
	"Polar Sink" : [true],
	"The Great Flat" : [false],
	"Funeral Plain" : [false],
	"Bight of the Cliff" : [false],
	"Sietch Tabr" : [true],
	"Wind Pass" : [false],
	"Plastic Basin" : [true],
	"Rock Outcroppings" : [false],
	"Hagga Basin" : [false],
	"Broken Land" : [false],
	"Tsimpo" : [false],
	"Carthag" : [true],
	"Arsunt" : [false],
	"Imperial Basin" : [true],
	"Arrakeen" : [true],
	"Old Gap" : [false],
	"Rim Wall West" : [true],
	"Basin" : [false],
	"Hole in the Rock" : [false],
	"Sihaya Ridge" : [false],
	"Shield Wall" : [true],
	"False Wall East" : [true],
	"Gara Kulon" : [false],
	"The Minor Erg" : [false],
	"Pasty Mesa" : [true],
	"Red Chasm" : [false],
	"South Mesa" : [false],
	"Tuek's Sietch" : [true],
	"False Wall South" : [true],
	"Harg Pass" : [false],
	"Cielago East" : [false],
	"Cielago North" : [false],
	"Cielago Depression" : [false],
	"Cielago South" : [false],
	"Meridian" : [false],
	"Cielago West" : [false],
	"Wind Pass North" : [false],
	"Habbanya Ridge Flat" : [false],
	"Habbanya Sietch" : [true],
	"False Wall West" : [true],
	"Habbanya Erg" : [false],
	"The Greater Flat" : [false],
}

@onready var positions := {
	"Polar Sink A" : {
		"Territory": "Polar Sink",
		"Sector" : null,
		"Spice": 0
		},
	"The Great Flat A" : {
		"Territory": "The Great Flat",
		"Sector" : 14,
		"Spice": 0
		},
	"Funeral Plain A" : {
		"Territory": "Funeral Plain",
		"Sector" : 14,
		"Spice": 0
		},
	"Bight of the Cliff A" : {
		"Territory": "Bight of the Cliff",
		"Sector" : 14,
		"Spice": 0
		},
	"Bight of the Cliff B" : {
		"Territory": "Bight of the Cliff",
		"Sector" : 13,
		"Spice": 0
		},
	"Sietch Tabr A" : {
		"Territory": "Sietch Tabr",
		"Sector" : 13,
		"Spice": 0
		},
	"Wind Pass A" : {
		"Territory": "Wind Pass",
		"Sector" : 16,
		"Spice": 0
		},
	"Wind Pass B" : {
		"Territory": "Wind Pass",
		"Sector" : 15,
		"Spice": 0
		},
	"Wind Pass C" : {
		"Territory": "Wind Pass",
		"Sector" : 14,
		"Spice": 0
		},
	"Wind Pass D" : {
		"Territory": "Wind Pass",
		"Sector" : 13,
		"Spice": 0
		},
	"Plastic Basin A" : {
		"Territory": "Plastic Basin",
		"Sector" : 13,
		"Spice": 0
		},
	"Plastic Basin B" : {
		"Territory": "Plastic Basin",
		"Sector" : 12,
		"Spice": 0
		},
	"Plastic Basin C" : {
		"Territory": "Plastic Basin",
		"Sector" : 11,
		"Spice": 0
		},
	"Rock Outcroppings A" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 13,
		"Spice": 0
		},
	"Rock Outcroppings B" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Hagga Basin A" : {
		"Territory": "Hagga Basin",
		"Sector" : 12,
		"Spice": 0
		},
	"Hagga Basin B" : {
		"Territory": "Hagga Basin",
		"Sector" : 11,
		"Spice": 0
		},
	"Broken Land A" : {
		"Territory": "Broken Land",
		"Sector" : 11,
		"Spice": 0
		},
	"Broken Land B" : {
		"Territory": "Broken Land",
		"Sector" : 10,
		"Spice": 0
		},
	"Tsimpo A" : {
		"Territory": "Tsimpo",
		"Sector" : 12,
		"Spice": 0
		},
	"Tsimpo B" : {
		"Territory": "Tsimpo",
		"Sector" : 11,
		"Spice": 0
		},
	"Tsimpo C" : {
		"Territory": "Tsimpo",
		"Sector" : 10,
		"Spice": 0
		},
	"Carthag A" : {
		"Territory": "Carthag",
		"Sector" : 10,
		"Spice": 0
		},
	"Arsunt A" : {
		"Territory": "Arsunt",
		"Sector" : 11,
		"Spice": 0
		},
	"Arsunt B" : {
		"Territory": "Arsunt",
		"Sector" : 10,
		"Spice": 0
		},
	"Imperial Basin A" : {
		"Territory": "Imperial Basin",
		"Sector" : 10,
		"Spice": 0
		},
	"Imperial Basin B" : {
		"Territory": "Imperial Basin",
		"Sector" : 9,
		"Spice": 0
		},
	"Imperial Basin C" : {
		"Territory": "Imperial Basin",
		"Sector" : 8,
		"Spice": 0
		},
	"Arrakeen A" : {
		"Territory": "Arrakeen",
		"Sector" : 9,
		"Spice": 0
		},
	"Old Gap A" : {
		"Territory": "Old Gap",
		"Sector" : 10,
		"Spice": 0
		},
	"Old Gap B" : {
		"Territory": "Old Gap",
		"Sector" : 9,
		"Spice": 0
		},
	"Old Gap C" : {
		"Territory": "Old Gap",
		"Sector" : 8,
		"Spice": 0
		},
#		Stopped here


	"Rim Wall West" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Basin" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Hole in the Rock" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Sihaya Ridge" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Shield Wall" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"False Wall East" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Gara Kulon" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"The Minor Erg" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Pasty Mesa" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Red Chasm" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"South Mesa" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Tuek's Sietch" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"False Wall South" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Harg Pass" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Cielago East" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Cielago North" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Cielago Depression" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Cielago South" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Meridian" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Cielago West" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Wind Pass North" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Habbanya Ridge Flat" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Habbanya Sietch" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"False Wall West" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"Habbanya Erg" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
	"The Greater Flat" : {
		"Territory": "Rock Outcroppings",
		"Sector" : 12,
		"Spice": 0
		},
}
