Echo “ … Hello Message … ”
set MODULE rle
quit -sim 
vlib work
Vlog ../$MODULE.v
Vlog ../flopr.v
Vlog ../flopenr.v
Vlog ../equal.v
Vlog ../mux2.v
Vlog ../${MODULE}_tb.v
vsim work.${MODULE}_tb
add wave *
run 200ns
Echo “Test Finished .. “
