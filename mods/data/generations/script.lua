function onCreatePost()
    setProperty('boyfriend.visible', false)
    setProperty('gf.alpha', 0)
    setProperty('dad.alpha', 0)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)
    for i = 0,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', -200)
    end

    makeLuaText('hey', 'HEY', 1000, 0, 0)
    setTextFont('hey', 'Nightmare 5.ttf')
    setTextSize('hey', 128)
    setTextColor('hey', '4f0000')
    screenCenter('hey', 'xy')
    setProperty('hey.visible', false)
    setObjectCamera('hey', 'other')
    addLuaText('hey')

    runHaxeCode([[
        var shaderName = "chromatic";
        var shaderHUD = "chromatic2";
                
        game.initLuaShader(shaderName);
        game.initLuaShader(shaderHUD);
        
        shader0 = game.createRuntimeShader(shaderName);
        shader1 = game.createRuntimeShader(shaderHUD);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader1)]);
    ]])
    zoomsOnBeat = getPropertyFromClass('ClientPrefs', 'camZooms')
    setPropertyFromClass('ClientPrefs', 'camZooms', false)
end

function onSongStart()
    doTweenAlpha('hellohihi', 'dad', 1, 5)
end

local camX = 500;
local camY = 500;
local ofs = 15;
local followchars = true;
function onUpdatePost()
    if followchars == true then
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',camX-ofs,camY)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',camX+ofs,camY)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',camX,camY-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',camX,camY+ofs)
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',camX,camY)
            end
    else
        triggerEvent('Camera Follow Pos','','')
    end

    runHaxeCode([[
        shader0.setFloat("iTime", ]] .. os.clock() .. [[);
        shader1.setFloat("iTime", ]] .. os.clock() .. [[);
    ]])
end

function onBeatHit()
    if curBeat == 14 then
        setProperty('hey.visible', true)
    end
    if curBeat == 16 then
        setProperty('hey.visible', false)
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', 732 + (112 * (i - 4)))
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
            noteTweenAlpha('pee'..i, i, 1, 3)
        end
    end
    if curBeat == 144 then
        doTweenAlpha('byeBf', 'dad', 0, 2.6)
        for i = 4,7 do 
            noteTweenAlpha('poo'..i, i, 0, 2)
        end
    end
    if curBeat == 152 then
        runHaxeCode([[
            var shader2Name = "chromaticcutscene";
                    
            game.initLuaShader(shader2Name);
            
            shader0 = game.createRuntimeShader(shader2Name);
            game.camGame.setFilters([new ShaderFilter(shader1)]);
        ]])
        makeLuaSprite('white', '', -1000, -1000)
        makeGraphic('white', 4000, 4000, 'ffffff')
        setProperty('white.alpha', 0)
        addLuaSprite('white')
        doTweenAlpha('whiteappear', 'white', 1, 1.3, 'circInOut')
    end
    if curBeat == 154 then
        doTweenAlpha('bflive', 'dad', 1, 0.8, 'circInOut')
    end
    if curBeat == 160 then
        doTweenColor('nowred', 'white', '4f0000', 0.4, 'quadInOut')
    end
    if curBeat == 172 then
        doTweenAlpha('whitedisappear', 'white', 0, 1.23, 'circInOut')
        doTweenAlpha('bfdieagain', 'dad', 0, 0.8, 'circInOut')
        
    end
    if curBeat == 176 then
        doTweenAlpha('redguy', 'gf', 1, 2)
        setProperty('defaultCamZoom', 0.65)
        runHaxeCode([[
            var shader3Name = "chromatic2";
                    
            game.initLuaShader(shader3Name);
            
            shader0 = game.createRuntimeShader(shader3Name);
            game.camGame.setFilters([new ShaderFilter(shader1)]);
        ]])
        for i = 4,7 do 
            noteTweenAlpha('shitty'..i, i, 1, 2)
        end
    end
    if curBeat == 400 then
        setCharacterX('boyfriend', getCharacterX('boyfriend') - 455)
        doTweenAlpha('bfliveagain', 'dad', 1, 2, 'circInOut')
    end
end

function onPause()
    setPropertyFromClass('ClientPrefs', 'camZooms', zoomsOnBeat)
end
function onResume()
    setPropertyFromClass('ClientPrefs', 'camZooms', false)
end
function onGameOver()
    setPropertyFromClass('ClientPrefs', 'camZooms', zoomsOnBeat)
end