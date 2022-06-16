import os
import yaml
import numpy as np

path = "result/map50by50/agents20/w1dot3"
g = os.walk(path)

time = []
for _, _, file_list in g:
    for file_name in file_list:
        print(file_name)
        # if file_name.find("10_ex") == -1:
        #     continue
        f = open(os.path.join(path, file_name))
        y = yaml.load(f)
        time.append(y["statistics"]["runtime"])
        f.close()

n_file = len(time)
t_average = sum(time)/n_file
time = np.array(time)

print('total file: ', n_file)
print('average running time: ', t_average)
