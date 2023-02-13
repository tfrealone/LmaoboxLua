

-- Most simple outlnie material
local OutlineMat = materials.Create("SimpleOutlineMaterial", [["VertexLitGeneric" 
{
	$basetexture	"vgui/white_additive"
	$envmap	"vgui/white_additive"

	$wireframe	"1"

	$vertexalpha	"1"


}]]
)

local function YaSeeMeDrawing( outline )
    local entity = outline:GetEntity()
    local modelname = outline:GetModelName()  -- 
    local me = entities.GetLocalPlayer()
    if entity ~= nil then
        local classent = entity:GetClass()
	    if classent == "CTFViewModel" then   -- Checks if entity's class == viewmodel
        outline:ForcedMaterialOverride(OutlineMat)
        outline:DrawExtraPass()   -- Redraws Model
	    end
    end
    if entity == g_LocalPlayer then  -- checks if entity = local player
         if modelname:find( "c_models" ) then   -- checks if model = weapon
         outline:ForcedMaterialOverride(OutlineMat) --
         outline:DrawExtraPass()   -- Redraws Model
         end
     end

end


callbacks.Unregister("DrawModel", "YaSeeMeDrawing")
callbacks.Register( "DrawModel", "YaSeeMeDrawing", YaSeeMeDrawing )

-- Feel free to paste in your luas
