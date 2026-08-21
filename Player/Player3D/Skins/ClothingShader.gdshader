// NOTE: Shader automatically converted from Godot Engine 3.6.2.stable's SpatialMaterial.

shader_type spatial;
render_mode async_visible,blend_mix,depth_draw_alpha_prepass,cull_disabled,diffuse_burley,specular_schlick_ggx,unshaded;
uniform vec4 albedo : hint_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform sampler2D texture_albedo : hint_albedo;
uniform vec2 uv1_scale = vec2(1.0, 1.0);
uniform vec2 uv1_offset = vec2(0.0, 0.0);

uniform sampler2D texture_colormask : hint_white;
uniform vec4 color_r : hint_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 color_g : hint_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform vec4 color_b : hint_color = vec4(0.0, 0.0, 1.0, 1.0);

uniform sampler2D texture_damage : hint_white;
uniform float damage = 0.0;
uniform float smoothness = 0.01;
uniform vec4 damage_color : hint_color = vec4(0.0, 0.0, 0.0, 1.0);

void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
}

void fragment() {
	vec2 base_uv = UV;
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	
	vec4 colormask_tex = texture(texture_colormask, base_uv);
	vec3 colormask_color = color_r.rgb * colormask_tex.r + color_g.rgb * colormask_tex.g + color_b.rgb * colormask_tex.b;
	
	vec3 albedoColor = albedo.rgb * albedo_tex.rgb * colormask_color;
	float alpha = albedo.a * albedo_tex.a;
	
	vec4 damage_tex = texture(texture_damage, base_uv);
	float amountAdj = -smoothness*0.5 + damage * (1.0 + smoothness*0.5);
	
	float edge1 = amountAdj - smoothness*0.5;
	float edge2 = amountAdj + smoothness*0.5;
	float alpha_mask = smoothstep(edge1, edge2, damage_tex.r);
	//float alpha_mask_2 = smoothstep(amountAdj, amountAdj+0.1, damage_tex.r);
	//float damage_outline_mask = smoothstep(amountAdj-0.005, amountAdj, damage_tex.g);
	float damage_factor = clamp(alpha_mask, 0.0, 1.0);
	//float damage_factor_2 = clamp(alpha_mask_2, 0.0, 1.0);
	
	//if(damage >= (damage_tex.r-0.1)){
	//	albedoColor = vec3(0.0, 0.0, 0.0);
	//}
	
	//damage_outline_mask = clamp(damage_outline_mask - alpha_mask_2, 0.0, 1.0)*alpha;
	
	
	//albedoColor = mix(albedoColor, damage_color.rgb, damage_outline_mask);
	
	ALBEDO = albedoColor;
	ALPHA = alpha * (damage_factor);//max(alpha * (damage_factor), damage_outline_mask);
}
