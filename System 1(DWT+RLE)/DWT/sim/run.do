Echo “ … Hello Message … ”
set MODULE dwt
quit -sim 
vlib work
Vlog ../$MODULE.v
Vlog ../${MODULE}_tb.v
vsim work.${MODULE}_tb
add wave *
run 400ps
Echo “Test Finished .. “
