function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note for erect difficlty' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/bullet_note');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

local shootAnims = {"shootLEFT", "shootDOWN", "shootUP", "shootRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note for erect difficlty' then
	    	characterPlayAnim('dad', shootAnims[direction + 1], false);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
                                       characterPlayAnim('gf', 'scared', true)
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
	end
	if noteType == 'Bullet_Note for erect difficlty' and difficulty == 3 then
		playSound('hankshoot', 0.6);
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note for erect difficlty' and difficulty == 3 then
		setProperty('health', getProperty('health')-0.5);
		characterPlayAnim('boyfriend', 'hurt', true);
		playSound('hankdead', 0.6);
		runTimer('bleed', 0.1, 20);
	end
	if noteType == 'Bullet_Note for erect difficlty' and difficulty == 3 then
		characterPlayAnim('boyfriend', 'hurt', true);
		playSound('hankshoot', 0.6);
		setProperty('health', -2);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'bleed' then
		setProperty('health', getProperty('health')-0.01);

precacheImage('nevada/notes/Bullet_Note');
precacheSound('hankshoot');

	end
end