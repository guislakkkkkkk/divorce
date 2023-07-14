local xx = 1050;
local yy = 300;
local xx2 = 300;
local yy2 = 400;
local xx3 = 700;
local yy3 = 450;
local ofs = 23;
local followchars = false;
local del = 0;
local del2 = 0;

local swapped = false

function onCreate()
    setProperty('gf.visible',false)
    setProperty('mom.visible',false)
    setProperty('iconP3.visible',false)
    setProperty('iconP4.visible',false)
end

function onStepHit()
    if curStep == 272 then
        followchars = true
    end
    if curStep == 400 then
        followchars = false
        triggerEvent('Camera Follow Pos', '650', '400')
    end
    if curStep == 520 then
        setProperty('gf.visible',true)
        setProperty('mom.visible',true)
        setProperty('iconP3.visible',true)
        setProperty('iconP4.visible',true)
    end
    if curStep == 784 then
        followchars = true
    end
end

function onStartCountdown()
    if difficulty == 2 then
        swapped = true
    else
        swapped = false
    end
end

function onUpdatePost()
    if swapped then
        P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
        P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
        P3Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (250 * getProperty('iconP3.scale.x') - 150) / 2 - 26)
        P4Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (250 * getProperty('iconP4.scale.x')) / 2 - 26 * 2)

        setProperty('iconP1.x',P1Mult - 100)
        setProperty('iconP1.origin.x',240)
        setProperty('iconP1.flipX',true)

        setProperty('iconP2.x',P2Mult + 100)
        setProperty('iconP2.origin.x',0)
        setProperty('iconP2.flipX',true)

        setProperty('iconP3.x',P3Mult - 250)
        setProperty('iconP3.origin.x',240)
        setProperty('iconP3.flipX',true)

        setProperty('iconP4.x',P4Mult + 225)
        setProperty('iconP4.origin.x',0)
        setProperty('iconP4.flipX',true)

        setProperty('healthBar.flipX',true)

        if not middlescroll then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
            setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
            setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
            setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
            setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
            setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
            setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
        end
    else 
        if not middlescroll then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
            setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
            setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
            setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
            setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
            setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
            setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)
        end
        setProperty('iconP2.flipX',false)
        setProperty('iconP1.flipX',false)
        setProperty('iconP3.flipX',false)
        setProperty('iconP4.flipX',false)
        setProperty('healthBar.flipX',false)
    end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',.6)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        end
		
		if gfSection == true then
			if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
            end
            if getProperty('gf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
            end
            if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
            end
	        if getProperty('gf.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
		end
        
        if mustHitSection == true then
            setProperty('defaultCamZoom',.9)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
			if gfSection == true then
				if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
				end
				if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
				end
				if getProperty('gf.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx3,yy3)
				end
			end
        end
    end
end