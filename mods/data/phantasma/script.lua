local sndPower, imgPower = nil;
local alpha = 0;

function onCreate()
	sndPower = precacheSound('powerout');
	imgPower = precacheImage('special/feddy');
	makeLuaSprite('feddylol',imgPower,screenWidth/2.5,screenHeight/4);
	setProperty('feddylol.visible',false);
	setObjectCamera('feddylol','hud');
end

function onBeatHit()
	if curBeat == 488 then
		playSound(sndPower,0.5);
		cameraFade('game','000000',1,false);
		--power out mmm
	end
	if curBeat == 493 then
		addLuaSprite('feddylol',true);
		setProperty('feddylol.visible',true);
	end
	if curBeat == 520 then
		doTweenZoom('spooks','camHUD',2,0.1,'linear');
		cameraShake('hud',0.08,0.2);
	end
end

function onUpdate()
	if curBeat > 493 then
		alpha = alpha + 1;
		setProperty('feddylol.alpha',(math.cos(alpha/20)));
	end
end