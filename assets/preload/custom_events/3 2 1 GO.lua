local assets = {'ready', 'set', 'go'}; local Xpos = {200, 200, 400}; local Ypos = {200, 200, 200}
local steps = {112, 116, 120, 124}
local counter = 1

function onCreate()
    for i = 1,3 do
        makeLuaSprite(assets[i], 'fx/'..assets[i],80 + Xpos[i], Ypos[i])
        setObjectCamera(assets[i], 'camHud')
        setProperty(assets[i]..'.alpha', 0)
    end
end

function onSongStart()
    for i = 1,3 do addLuaSprite(assets[i], true) end
end

function onBeatHit()
    if curStep > 113 and curStep < 125 then setProperty(assets[counter]..'.alpha', 1); doTweenAlpha(assets[counter]..'fadeOut', assets[counter], 0, 0.5, 'linear'); counter = counter + 1 end
end