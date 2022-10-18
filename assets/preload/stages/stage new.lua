function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -630, -180)
	setScrollFactor('stageback', 0.9, 0.9)
                   scaleObject('stageback', 1.5, 1.5)

	makeLuaSprite('stageback copy', 'week 1 and tutorial/stageback copy', -600, -300)
	setScrollFactor('stageback copy', 0.9, 0.9)
	
	makeLuaSprite('stagefront new', 'week 1 and tutorial/stagefront new', -630, 640)

                   makeLuaSprite('stage_lights', 'week 1 and tutorial/stage_lights', -50, -190)

                   makeLuaSprite('advertising', 'week 1 and tutorial/advertising', -0, 30)
	setScrollFactor('advertising', 0.9, 0.9)
                   scaleObject('advertising', 0.9, 0.9)

                   makeAnimatedLuaSprite('Public', 'week 1 and tutorial/Public', -640, 960)
	addAnimationByPrefix('Public', ' Public', 'Public', 19, true)
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	makeLuaSprite('stagecurtains', 'stagecurtains', -689, -250)
	setScrollFactor('stagecurtains', 1.3, 1.3)
	scaleObject('stagecurtains', 1.1, 1.1)

	end

	addLuaSprite('stageback', false)
                   addLuaSprite('stageback copy', false)
                   addLuaSprite('advertising', false)
                   addLuaSprite('stage_lights', false)
	addLuaSprite('stagefront new', false)
	addLuaSprite('stagecurtains', false)
	addLuaSprite('Public', true)

precacheImage('week 1 and tutorial/Public');
precacheImage('week 1 and tutorial/stagefront new');
precacheImage('week 1 and tutorial/stageback copy');
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end