--script by asbel sen (gracias br9)
function onCreatePost()
precacheImage('Win');
end

function onStepHit()
if getPropertyFromClass('flixel.FlxG', 'sound.music.time') >= songLength -143 then
playSound('confirmMenu', 1)	
makeLuaText('SPACE','PRESS SPACE TO CONTINUE', getPropertyFromClass('flixel.FlxG', 'width'),
getProperty('scoreTxt.x'), getProperty('scoreTxt.y'));
setTextSize('SPACE', 30);
setTextColor('SPACE','ffffff')
setTextAlignment('SPACE', 'center');
setObjectCamera('SPACE', 'other');
addLuaText('SPACE')
doTweenAlpha('hud', 'camHUD', 0, 0.5, 'linear')	
makeAnimatedLuaSprite('Win', 'Win', 300, 230);
luaSpriteAddAnimationByPrefix('Win', 'Win', 'Win', 25, true);
luaSpritePlayAnimation('Win', 'Win');
setObjectCamera('Win', 'other');
scaleLuaSprite('Win', 1, 1); 
addLuaSprite('Win', true);
Detener=true
end
end

function onUpdate()
if Detener==true then	
setPropertyFromClass('Conductor', 'songPosition',Stored)
setPropertyFromClass('flixel.FlxG', 'sound.music.time',Stored)
setProperty('vocals.time',Stored)
setPropertyFromClass('flixel.FlxG', 'sound.music.volume',0)
setProperty('vocals.volume',0)
end
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and Detener==true then
playSound('dialogueClose', 1)
Detener=false
SeenRatingScreen=true
endSong()
end
end