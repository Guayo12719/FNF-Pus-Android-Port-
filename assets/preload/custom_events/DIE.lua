function onEvent(n, v1, v2)
    if n == 'DIE' then
        setProperty('health', 0)
        runTimer('nou', 0.0001)
    end
end
function onTimerComplete(tag)
    if tag == 'nou' then
        setProperty('health', 0)
    end
end