local angleshit = 1;
local anglevar = 2;
function onBeatHit()

    if curBeat >= 96 and curBeat % 2 == 0 then
        triggerEvent("Add Camera Zoom", '0.3', "0.12")
    end

    if curBeat > 96 then
        if curBeat % 2 == 0 then
            angleshit = anglevar;
        else
            angleshit = -anglevar;
        end
        setProperty('camHUD.angle',angleshit*3)
        setProperty('camGame.angle',angleshit*3)
        doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
        doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
        doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
    end
end

function opponentNoteHit()
    if mustHitSection == false then
        health = getProperty('health')
        triggerEvent('Screen Shake', '0.03, 0.03', '0, 0');   
        if getProperty('health') > 0.5 then
            setProperty('health', health- 0.03);
        end
    end
end
