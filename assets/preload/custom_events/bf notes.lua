function onEvent(name, value1, value2)
--value1 is alpha
--value2 is duration
    if name == "bf notes" then
                noteTweenAlpha('note5', 4, value1, value2, 'linear')
                noteTweenAlpha('note6', 5, value1, value2, 'linear')
                noteTweenAlpha('note7', 6, value1, value2, 'linear')
                noteTweenAlpha('note8', 7, value1, value2, 'linear')
     end
end