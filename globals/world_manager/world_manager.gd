extends Node

var players:Array[Player] = []

func register_player(player:Player)->void:
	players.push_front(player)
