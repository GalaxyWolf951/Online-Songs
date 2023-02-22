function onCreate()
    makeLuaSprite('bc', 'week1bg/bc', -600, -300);
    addLuaSprite('bc', true);
    setProperty('bc.alpha', 0);
	scaleObject('bc', 15, 15);
end
function onBeatHit()
    if (curBeat == 388) then
    doTweenAlpha('TweenAlpha', 'bc', 1, 8.5, 'linear');
    end
    if (curBeat == 436) then
    setProperty('bc.alpha', 0);
end
end