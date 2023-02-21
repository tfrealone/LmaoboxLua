--[[Difference between 2D + Changelog
Added Semi-3D (You'll notice why i call it "semi")
Added Animation Of Disappearing 
Added Drawing of 3D Square Hitbox if weapon is in list
No longer draws if game is not visible (if you are wESCing)
]]



local time = 0
local sec = 2           -- Timer for X secs (by default - 2), edit if you want custom time of disappearing animation
local bwplist = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 20, 22, 23, 24, 25, 58, 61, 65, 72, 73, 78, 80, 81, 91}       -- List of weapons to draw "box"

-- Used examples of Damage logger - by @RC and Draw local player hitboxes

local function damage(event)

    if (event:GetName() == 'player_hurt' ) then  -- Checks for player_hurt event

        local localPlayer = entities.GetLocalPlayer();
        victim = entities.GetByUserID(event:GetInt("userid"))
        local health = event:GetInt("health")
        local attacker = entities.GetByUserID(event:GetInt("attacker"))
        local damage = event:GetInt("damageamount")
        local weaponid = event:GetInt("weaponid")
       
        if (attacker == nil or localPlayer:GetIndex() ~= attacker:GetIndex()) or victim:GetIndex() == localPlayer:GetIndex() then
            return 
             end
              for i = 1, #bwplist do    --There is an easier way to do this by checking weapon's projectile but eh
                if bwplist[i] == weaponid then    -- If weaponid is in list of "box" weapons
                pbox = 1
                hitboxv = victim:HitboxSurroundingBox()
                time = globals.RealTime()       -- Updates Timer
                break
end
                hitboxv = victim:GetHitboxes()
                pbox = 0
                time = globals.RealTime()       -- Updates Timer 
             end
        end
end

callbacks.Register("FireGameEvent", "damageDraw", damage)

local function HitboxDraw()  -- Draws Hitboxes

        if engine.Con_IsVisible() or engine.IsGameUIVisible() then
        return
    end

     if sec + time >= globals.RealTime() then -- Timer

        local poof = math.floor( 255 / sec)
        local ac = math.floor(255 + ((time - globals.RealTime()) * poof)) -- Animation of disappearing  

        for i = 1, #hitboxv do


-- DANGER ALL PERSONNEL! A big Ctrl + C/V Zone!

if pbox == 1 then

        min = hitboxv[1]
        max = hitboxv[2]

end

if pbox == 0 then

        hitboxq = hitboxv[i]

        min = hitboxq[1]
        max = hitboxq[2]
end

        local xa, ya, za = min:Unpack()
        local xb, yb, zb = max:Unpack()

        mool = Vector3(xb, ya, za)
        moal = Vector3(xb, yb, za)
        moul = Vector3(xa, yb, za)

        moql = Vector3(xb, ya, zb)
        morl = Vector3(xa, yb, zb)
        mozl = Vector3(xa, ya, zb)

        mool = client.WorldToScreen( mool )
        moal = client.WorldToScreen( moal )
        moul = client.WorldToScreen( moul )
        moql = client.WorldToScreen( moql )
        mozl = client.WorldToScreen( mozl )
        morl = client.WorldToScreen( morl )

        min = client.WorldToScreen( min )
        max = client.WorldToScreen( max )

 if (min ~= nil and max ~= nil and mozl ~= nil and morl ~= nil and moql ~= nil and mool ~= nil and moul ~= nil and moal ~= nil) then
            -- draw hitbox
            draw.Color(255, 255, 255, ac)   -- Color of hitboxes

            draw.Line(mozl[1], mozl[2], morl[1], morl[2])
            draw.Line(mozl[1], mozl[2], moql[1], moql[2])
            draw.Line(morl[1], morl[2], max[1], max[2])
            draw.Line(moql[1], moql[2], max[1], max[2])

            draw.Line(min[1], min[2], mool[1], mool[2])
            draw.Line(min[1], min[2], moul[1], moul[2])
            draw.Line(mool[1], mool[2], moal[1], moal[2])
            draw.Line(moul[1], moul[2], moal[1], moal[2])

            draw.Line(min[1], min[2], mozl[1], mozl[2])
            draw.Line(moal[1], moal[2], max[1], max[2])
            draw.Line(moul[1], moul[2], morl[1], morl[2])
            draw.Line(mool[1], mool[2], moql[1], moql[2]) 
  
end  
end
end
end
callbacks.Register( "Draw", HitboxDraw )

-- Feel free to paste in your luas