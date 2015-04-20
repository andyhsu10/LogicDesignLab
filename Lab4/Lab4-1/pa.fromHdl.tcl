
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Lab4-1 -dir "D:/OneDrive/LogicDesignLab/Lab4/Lab4-1/planAhead_run_1" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "shiftreg.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {shifter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {freq_div.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {shiftreg.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top shiftreg $srcset
add_files [list {shiftreg.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
