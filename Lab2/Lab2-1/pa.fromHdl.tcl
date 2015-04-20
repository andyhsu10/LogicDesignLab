
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab2-1 -dir "C:/Users/An-Ting/OneDrive/LogicDesignLab/Lab2/Lab2-1/planAhead_run_2" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "FA.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {HA.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {FA.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top FA $srcset
add_files [list {FA.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
