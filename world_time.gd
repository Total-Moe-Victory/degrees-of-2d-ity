#This 'singleton' is used to handle all world time related processes
#Why is this not a scene?
#Dont know how to work scenes, if future reader does, fix
extends Node
##Time hanlding
#This allows basically every decay function to work
var world_time : int = 0
const tick_speed : int = 10
var tick : int = 0
var days_passed : int = 0  
var paused : bool = true #game starts paused
var worldstate : Array = [world_time, days_passed, paused, tick, tick_speed]
var k :float =0 
var rtw_seconds_converter :int = 12 #real to world seconds conversion factor
#there should never be a scenario where world_time is less than 0
#if such a scenario occurs, unoccur it.

func _process(delta:float):
	if paused==false:
		if k<1:
			k+=delta
		if k>=1:
			world_time+=rtw_seconds_converter*floor(k)
			k=0
	days_passed += int(floor(float(world_time)/(24*3600)))
	world_time = world_time % (24*3600)
	tick = int(floor(float(world_time)/rtw_seconds_converter)) % tick_speed
	worldstate=[world_time, days_passed, paused, tick, tick_speed]
