import math
import operator 

def euclideanDistance(instance1,instance2,k):
	distance = 0
	for x in range(0, k):
		distance += pow((instance2 - instance1), 2)
	return math.sqrt(distance)

def k_neighbor(input_data, k, p):
    
    #YOUR CODE HERE
    mean_neighbors = []
    distances = []
    for x in range(len(input_data)):
        dist = euclideanDistance(input_data[x],p,k)
        distances.append((input_data[x], dist))
    distances.sort(key=operator.itemgetter(1))
    
    for x in range(0,k):
        mean_neighbors.append(distances[x][0])
        
    return "The neighbors/distances are:", distances[0:k]," the average is ", np.average(mean_neighbors[0:k])
  
import numpy as np
data = np.array([1,3,4,5,7,8,11,12,13,15,19,24,25,29,40])
neighbors = k_neighbor(input_data=data, k=3, p=5)
print(neighbors)
