---@param m MarioState
local function mario_update(m)
    if m.action & ACT_FLAG_INVULNERABLE ~= 0 and m.action ~= ACT_SOFT_BONK and m.vel.y < -10 and
    m.health >= 0x100 then
        m.vel.x = sins(m.faceAngle.y)*m.forwardVel
        m.vel.z = coss(m.faceAngle.y)*m.forwardVel
        set_mario_action(m, ACT_FREEFALL, 0)
        m.invincTimer = 20
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)