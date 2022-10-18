-- PSYCH ENGINE: VANILLA RESKIN VIA. LUA --
-- CREDITS:
-- ninja_muffin99 - Reference Code

local isUsingGhost

local width = 50 -- default: 50
local height = 11 -- default: 11

local bar_offset_x = 0 -- default: 0
local bar_offset_y = 0 -- default: 0

local border_color = "000000"
local border_thickness = 4 -- default: 4

local override_colors = true -- default: false
local override_p1_color = override_colors and "63fd33" or nil
local override_p2_color = override_colors and "ff0000" or nil

local p1_offset_x = -26 -- default: -26
local p1_offset_y = 0 -- default: 0
local p2_offset_x = 26 -- default: 26
local p2_offset_y = 0 -- default: 0

--

local function to_hex(rgb)
	return string.format("%x", (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
end

local sprite_border = "healthbar_border"
local sprite_p1 = "healthbar_p1"
local sprite_p2 = "healthbar_p2"

local bar_origin_x 
local bar_origin_y

local p_origin_y

function remapToRange(value, start1, stop1, start2, stop2)
	return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function onCreatePost()
	
	setProperty("healthBarBG.visible", false)
	setProperty("healthBar.visible", false)

	makeLuaSprite('healthbar_border', "",
		0,
		downscroll and 75 or screenHeight * 0.9
	)
	makeGraphic(sprite_border,
		601,
		19,
		border_color
	)

	screenCenter(sprite_border, 'x')

	addLuaSprite(sprite_border, true)
	setObjectCamera(sprite_border, "hud")
	setObjectOrder(sprite_border, getObjectOrder('healthBarBG'))
	
	makeLuaSprite(sprite_p1, "",
		0,
		getProperty('healthbar_border.y') + 4
	)

	screenCenter(sprite_p1, 'x')

	makeGraphic(sprite_p1,
		(getProperty('healthbar_border.width') - 8) / 2,
		getProperty('healthbar_border.height') - 8,
		override_colors and override_p1_color or to_hex(getProperty("boyfriend.healthColorArray"))
	)

	addLuaSprite(sprite_p1, true)
	setObjectCamera(sprite_p1, "hud")
	setObjectOrder(sprite_p1, 2)
	setProperty(sprite_p1 .. ".origin.x", getProperty(sprite_p1 .. ".width"))
	
	makeLuaSprite(sprite_p2, "",
		getProperty('healthbar_border.x') + 5,
		getProperty('healthbar_border.y') + 4
	)
	makeGraphic(sprite_p2,
		getProperty('healthbar_border.width') - 9,
		getProperty('healthbar_border.height') - 8,
		override_colors and override_p2_color or to_hex(getProperty("dad.healthColorArray"))
	) 

	for i=0, getProperty('strumLineNotes.length')-1 do
		
		
		if getPropertyFromGroup('strumLineNotes', i, 'player') == 0 then
			if middlescroll then setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) end
		end
	end

	addLuaSprite(sprite_p2, true)
	setObjectCamera(sprite_p2, "hud")
	setObjectOrder(sprite_p2, getObjectOrder('healthBar')-1)
	setObjectOrder(sprite_p1, getObjectOrder('healthBar'))
	setProperty(sprite_p2 .. ".origin.x", 0)

	setProperty('scoreTxt.visible', false)

	makeLuaText('score', 'Score: 0', 200, getProperty('healthbar_border.x') + getProperty('healthbar_border.width') - 190,  getProperty('healthbar_border.y') + 30)
	setTextSize('score', 16)
	setTextAlignment('score', 'left')
	addLuaText('score')
	setObjectOrder('score', getObjectOrder('healthbar_border'))
	setTextBorder('score', 1.75, '000000')

	if botPlay then
		setPropertyFromClass('ClientPrefs', 'cpuControlled', false)
		setProperty('cpuControlled', true)
		setProperty('botplayTxt.visible', false)
end

	isUsingGhost = getPropertyFromClass('ClientPrefs', 'ghostTapping')
	if isUsingGhost then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	end

	makeLuaText('proto', 'Friday Night Funkin v0.3.0 ', 250, 0, 0)
	--setProperty('proto.x', screenWidth - getProperty('proto.width'))
	setProperty('proto.y', screenHeight - getProperty('proto.height'))
	setTextSize('proto', 16)
	setTextAlignment('proto', 'right')
	addLuaText('proto')
	setObjectOrder('proto', getObjectOrder('score'))
	setTextBorder('proto', 1.75, '000000')

makeLuaText('song', songName, 935, 0, 0)
	setProperty('song.x', screenWidth - getProperty('song.width'))
	setProperty('song.y', screenHeight - getProperty('song.height'))
	setTextSize('song', 16)
	setTextAlignment('song', 'right')
	addLuaText('song')
	setObjectOrder('song', getObjectOrder('score'))
	setTextBorder('song', 1.75, '000000')

end

function onCountdownTick(count)
	if count == 0 then
		for i=0, getProperty('strumLineNotes.length')-1 do

			if getPropertyFromGroup('strumLineNotes', i, 'player') == 0 then
				if middlescroll then setPropertyFromGroup('strumLineNotes', i, 'alpha', 1) end
			end
		end
	end

	--return Function_Continue;
end

function onUpdatePost(elapsed)
	local percent_p1 = (getProperty("healthBar.percent")/100)
	local percent_p2 = 1 - percent_p1
	
	local healthBarPercent = getProperty("healthBar.percent")
	local healthBarWidth = getProperty('healthBar.width')
	
	local scale_p1 = (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0)
	local scale_p2 = percent_p2 * 2 - (percent_p1 < 1 and 0.01 or 0)
	setProperty(sprite_p1 .. ".scale.x", scale_p1)
	
	local real_width_p1 = getProperty(sprite_p1 .. ".width") * scale_p1
	local real_width_p2 = getProperty(sprite_p2 .. ".width") * scale_p2
	
	local center_p1 = -getProperty("iconP1.frameWidth") / 2
	local center_p2 = -getProperty("iconP2.frameWidth") / 2

	setProperty("iconP2.y", getProperty('healthbar_border.y') + (getProperty("iconP2.height") / 2)-147)
	setProperty("iconP1.y", getProperty('healthbar_border.y') + (getProperty("iconP1.height") / 2)-147)

	for i = 0, getProperty('grpNoteSplashes.length')-1 do
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.x', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', -30)
		setPropertyFromGroup('grpNoteSplashes', i, 'alpha', 0.6)
	end
end

function onBeatHit()
	scaleObject('iconP1', 1.3, 1.3)
	doTweenX('iconauohsdohjas', 'iconP1.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas2', 'iconP1.scale', 1, crochet/1000, 'circOut')
	
	scaleObject('iconP2', 1.3, 1.3)
	doTweenX('iconauohsdohjas3', 'iconP2.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas4', 'iconP2.scale', 1, crochet/1000, 'circOut')
end

function goodNoteHit(a,b,c,isSustainNote)
	
	if getProperty('cpuControlled') and not isSustainNote then
		addScore(350)
	end

	setTextString('score', 'Score: '.. getProperty('songScore'))

end

function noteMiss(...)
	setTextString('score', 'Score: '.. getProperty('songScore'))
end

function onDestroy()
	if getProperty('cpuControlled') then
		setPropertyFromClass('ClientPrefs', 'cpuControlled', true)
	end

	if isUsingGhost then setPropertyFromClass('ClientPrefs', 'ghostTapping', true) end
end

--NO TIME BAR--
function onCountdownStarted()
setProperty('timeTxt.visible',false)
setProperty('timeBar.visible',false)
setProperty('timeBarBG.visible',false)
	end