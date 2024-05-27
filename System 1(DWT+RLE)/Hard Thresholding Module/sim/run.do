Echo “ … Hello Message … ”
set MODULE hard_threshold
quit -sim 
vlib work
Vlog ../$MODULE.v
Vlog ../mux2.v
Vlog ../${MODULE}_tb.v
vsim work.${MODULE}_tb
add wave *
run 400ps
Echo “Test Finished .. “
