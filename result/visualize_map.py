import matplotlib.pyplot as plt
import numpy as np
import yaml, os

path = os.path.join('benchmark', '32x32_obst204')
file_name = 'map_32by32_obst204_agents10_ex81.yaml'
f = open(os.path.join(path, file_name))
y = yaml.load(f)
obs = y['map']['obstacles']
map = np.zeros([32,32])
for ob in obs:
    map[ob[0], ob[1]]=1
plt.imshow(map, cmap=plt.cm.bwr)
plt.show()