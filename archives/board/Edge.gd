extends Node

class_name Edge

# Reference to tiles linked by this edge
var tile1 : Tile
var tile2 : Tile

# Information on the road owner
var road_owner = null  # Who owns the road, else null

func init(_tile1 : Tile, _tile2 : Tile):
	self.tile1 = _tile1
	self.tile2 = _tile2
