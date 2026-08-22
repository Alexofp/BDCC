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
uniform vec4 damage_color : hint_color = vec4(0.0, 0.0, 0.0, 1.0);

void vertex() {
	UV=UV*uv1_scale.xy+uv1_offset.xy;
}

void fragment() {
	vec4 albedo_tex = texture(texture_albedo, UV);
	vec4 colormask_tex = texture(texture_colormask, UV);
	vec3 colormask_color = color_r.rgb * colormask_tex.r + color_g.rgb * colormask_tex.g + color_b.rgb * colormask_tex.b;
	
	vec3 albedoColor = albedo.rgb * albedo_tex.rgb * colormask_color;
	float alpha = albedo.a * albedo_tex.a;
	vec4 damage_tex = texture(texture_damage, UV);
	
	float d = damage;
	float s1 = 1.0 - step(d, 0.2);
	float s2 = 1.0 - step(d, 0.45);
	float s3 = 1.0 - step(d, 0.7);
	float s4 = 1.0 - step(d, 0.95);
	
	float stage1 = s1 * (1.0 - s2);
	float stage2 = s2 * (1.0 - s3);
	float stage3 = s3 * (1.0 - s4);
	float stage4 = s4;
	
	float alpha_mask = 1.0;
	alpha_mask = mix(alpha_mask, damage_tex.r, stage1);
	alpha_mask = mix(alpha_mask, damage_tex.g, stage2);
	alpha_mask = mix(alpha_mask, damage_tex.b, stage3);
	alpha_mask = mix(alpha_mask, 0.0, stage4);
	
	float mask_lt_025 = 1.0 - step(0.25, alpha_mask);
	float mask_lt_055 = step(0.25, alpha_mask) * (1.0 - step(0.55, alpha_mask));
	
	float damage_factor = mask_lt_025;
	albedoColor = mix(albedoColor, damage_color.rgb, mask_lt_055);
	
	ALBEDO = albedoColor;
	ALPHA = alpha * (1.0 - damage_factor);
}
//void fragment() {
//	vec2 base_uv = UV;
//	vec4 albedo_tex = texture(texture_albedo,base_uv);
//
//	vec4 colormask_tex = texture(texture_colormask, base_uv);
//	vec3 colormask_color = color_r.rgb * colormask_tex.r + color_g.rgb * colormask_tex.g + color_b.rgb * colormask_tex.b;
//
//	vec3 albedoColor = albedo.rgb * albedo_tex.rgb * colormask_color;
//	float alpha = albedo.a * albedo_tex.a;
//
//	vec4 damage_tex = texture(texture_damage, base_uv);
//	float damage_factor = 0.0;
//	float alpha_mask = 1.0;
//
//	if(damage > 0.95){
//		alpha_mask = 0.0;
//	}else
//	if(damage > 0.70){
//		alpha_mask = damage_tex.b;
//	}else
//	if(damage > 0.45){
//		alpha_mask = damage_tex.g;
//	}else
//	if(damage > 0.20){
//		alpha_mask = damage_tex.r;
//	}
//
//	if(alpha_mask < 0.25){
//		damage_factor = 1.0;
//	}else
//	if(alpha_mask < 0.55){
//		albedoColor = damage_color.rgb;
//	}
//
//	ALBEDO = albedoColor;
//	ALPHA = alpha * (1.0-damage_factor);
//}
