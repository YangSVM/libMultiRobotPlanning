# # It is the makefile to evaluate examples in benchmark

# map = 32x32_obst204
# IN = $(wildcard benchmark/$(map)/*.yaml)
# OUT = $(subst benchmark/32x32_obst204,result/$(map)/,$(IN))

# result/$(map)/%.yaml: benchmark/$(map)/%.yaml	
# 	./build/ecbs -i ./$^ -o $@ -w 1.3

# default:  $(OUT)


# It is the makefile to evaluate examples in benchmark
weight = 1.3
gridSize = 3
mapName =  map50by50
agentNum = agents20

# mkdir if it do not exist.
result_dir := result/$(mapName)/$(agentNum)/gridsize$(gridSize)/w$(weight)
$(shell if [ ! -e $(result_dir) ];then mkdir -p $(result_dir); fi)

IN = $(wildcard benchmark/$(mapName)/$(agentNum)/obstacle/*.yaml)
OUT = $(subst benchmark/$(mapName)/$(agentNum)/obstacle/,result/$(mapName)/$(agentNum)/gridsize$(gridSize)/w$(weight)/,$(IN))

result/$(mapName)/$(agentNum)/gridsize$(gridSize)/w$(weight)/%.yaml: benchmark/$(mapName)/$(agentNum)/obstacle/%.yaml	
	./build/ecbs -i ./$^ -o $@ -w $(weight) -s $(gridSize)

default:  $(OUT)

# delete the empty files
clean_empty: 
	$(shell find $(result_dir) -type f -empty -print -delete)