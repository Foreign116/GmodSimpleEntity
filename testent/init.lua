AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local maxhealth = 25
function ENT:Initialize()
 
	self:SetModel( "models/hunter/blocks/cube025x025x025.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
 	self:SetColor(Color(44,44,44))
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end


function ENT:Use(act,call)

	if(maxhealth>0) then
	call:SetHealth(call:Health()+1)
	maxhealth = maxhealth - 1 
    else 
	self:Ignite(10,1)
    end


	end