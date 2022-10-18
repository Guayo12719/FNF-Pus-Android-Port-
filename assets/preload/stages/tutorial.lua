function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -630, -180)
	setScrollFactor('stageback', 0.9, 0.9)
                   scaleObject('stageback', 1.5, 1.5)

	makeLuaSprite('stageback copy', 'week 1 and tutorial/stageback copy', -600, -300)
	setScrollFactor('stageback copy', 0.9, 0.9)
	
	makeLuaSprite('stagefront new Tutorial', 'week 1 and tutorial/stagefront new Tutorial', -630, 640)

                   makeLuaSprite('ladder', 'week 1 and tutorial/ladder', -310, 120)
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then

	makeLuaSprite('stagecurtains', 'stagecurtains', -689, -250)
	setScrollFactor('stagecurtains', 1.3, 1.3)
	scaleObject('stagecurtains', 1.1, 1.1)

	end

	addLuaSprite('stageback', false)
                   addLuaSprite('stageback copy', false)
	addLuaSprite('stagefront new Tutorial', false)
	addLuaSprite('stagecurtains', true)
                   addLuaSprite('ladder', false)

precacheImage('week 1 and tutorial/stageback copy');
precacheImage('week 1 and tutorial/stagefront new Tutorial');
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end