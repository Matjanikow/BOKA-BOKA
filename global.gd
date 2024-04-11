extends Node

var foodRemaining = 0
var actualScore = 0 
var powerUp = false

func score():
	foodRemaining -= 1
	actualScore += 1

func reset():
	foodRemaining = 0
	actualScore = 0 
	powerUp = false
