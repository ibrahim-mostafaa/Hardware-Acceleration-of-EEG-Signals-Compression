Echo “ … Hello Message … ”
set MODULE top
quit -sim 
vlib work
Vlog ../$MODULE.v
Vlog ../diff.v
Vlog ../adder1.v
Vlog ../dwt.v
Vlog ../equal.v
Vlog ../flopr.v
Vlog ../flopenr.v
Vlog ../hard_threshold.v
Vlog ../mux2.v
Vlog ../rle.v
Vlog ../${MODULE}_tb.v
vsim work.${MODULE}_tb
add wave *
run 200ns
Echo “Test Finished .. “
