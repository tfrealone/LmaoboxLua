local function props( prop )
    if string.find( prop:GetName(), 'models/props_' ) then
        prop:SetMaterialVarFlag( MATERIAL_VAR_ADDITIVE, true ) -- I use this since idk why AlphaModulate does not work on props
        prop:SetMaterialVarFlag( MATERIAL_VAR_NOCULL, true ) -- Makes props more visible
    end
end

materials.Enumerate( props )