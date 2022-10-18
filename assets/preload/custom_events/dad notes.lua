function onEvent(name, value1, value2)
--value1 is alpha
--value2 is duration
    if name == "dad notes" then
                noteTweenAlpha('note1', 0, value1, value2, 'linear')
                noteTweenAlpha('note2', 1, value1, value2, 'linear')
                noteTweenAlpha('note3', 2, value1, value2, 'linear')
                noteTweenAlpha('note4', 3, value1, value2, 'linear')
     end
end