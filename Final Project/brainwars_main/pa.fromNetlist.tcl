
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name brainwars_main -dir "C:/Users/Andy/Desktop/Working/brainwars_main/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Andy/Desktop/Working/brainwars_main/brainwars_main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Andy/Desktop/Working/brainwars_main} {ipcore_dir} }
add_files [list {ipcore_dir/RAM.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ROM.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "brainwars_main.ucf" [current_fileset -constrset]
add_files [list {brainwars_main.ucf}] -fileset [get_property constrset [current_run]]
link_design
