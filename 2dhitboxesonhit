local time = 0
local sec = 2           -- Timer for X secs (by default - 2), edit if you want custom ammount of seconds



-- Used examples of Damage logger - by @RC and Draw local player hitboxes




local function damage(event)

    if (event:GetName() == 'player_hurt' ) then  -- Checks for player_hurt event

        local localPlayer = entities.GetLocalPlayer();
        local victim = entities.GetByUserID(event:GetInt("userid"))
        local health = event:GetInt("health")
        local attacker = entities.GetByUserID(event:GetInt("attacker"))
        local damage = event:GetInt("damageamount")
       
        if (attacker == nil or localPlayer:GetIndex() ~= attacker:GetIndex()) or victim:GetIndex() == localPlayer:GetIndex() then
            return
        else
                hitboxes = victim:GetHitboxes()    -- Hitboxes of your "victim"
                time = globals.RealTime()       -- Updates Timer
        end
    end
end

callbacks.Register("FireGameEvent", "damageDraw", damage)

local function HitboxDraw()  -- function that draws hitboxes

     if sec + time >= globals.RealTime() then -- Timer
       for i = 1, #hitboxes do
        local hitbox = hitboxes[i]
        local min = hitbox[1]
        local max = hitbox[2]

        -- to screen space
        min = client.WorldToScreen( min )
        max = client.WorldToScreen( max )



 if (min ~= nil and max ~= nil) then
            -- draw hitbox
            draw.Color(255, 255, 255, 255)
            draw.Line( min[1] , min[2] , max[1] , min[2] )
            draw.Line( max[1] , min[2] , max[1] , max[2] )
            draw.Line( max[1] , max[2] , min[1] , max[2] )
            draw.Line( min[1] , max[2] , min[1] , min[2] )
         end
      end
   end 
end
callbacks.Register( "Draw", HitboxDraw )
