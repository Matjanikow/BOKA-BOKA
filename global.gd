extends Node

var foodRemaining = 0
var actualScore = 0 
var powerUp = false

func score():
	foodRemaining -= 1
	actualScore += 1
