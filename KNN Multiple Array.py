data_4d = np.array([[4, 1, 2, 1], [1, 4, 2, 0], [3, 3, 1, 1], 
        [4, 0, 0, 0], [1, 2, 0, 0], [3, 4, 2, 3], 
        [2, 4, 4, 2], [2, 1, 4, 1], [3, 3, 2, 4], 
        [4, 3, 0, 4], [2, 2, 4, 0],[4, 3, 0, 2], 
        [4, 3, 0, 2], [0, 3, 4, 2]])

b=[2, 1, 4, 3]

def l1_norm(a,b):
    return sum(map(lambda a:abs(a[0]-a[1]), zip(a,b)))

def l2_norm(a,b):
    distance = sum(map(lambda a:pow(abs(a[0]-a[1]),2), zip(a,b)))
    return math.sqrt(distance)


def k_neighbor_nd(input_data, k, p, metric, mode):    
   
   distance = []
   Stat_Neighbors = []
   for x in range(0,input_data.shape[0]-1):
       if metric == "l1":
           dist = l1_norm(input_data[x],p)
       if metric == "l2":
           dist = l2_norm(input_data[x],p)
       distance.append((input_data[x], dist))
       distance.sort(key=operator.itemgetter(1))
   
   for x in range(0,k):
       Stat_Neighbors.append(distance[x][0])
   #return Stat_Neighbors,np.average(Stat_Neighbors, axis = 0)

   if mode == "mean":
       return "The neighbors and their distances are:", distance[0:k]," and the average is ", np.average(Stat_Neighbors[0:k], axis = 0)
   elif mode == "max":
       return "The neighbors and their distances are:", distance[0:k]," and the max is ", np.max(Stat_Neighbors[0:k], axis = 0)
   elif mode =="median":
       return "The neighbors and their distances are:", distance[0:k]," and the median is ", np.median(Stat_Neighbors[0:k], axis = 0)

print(k_neighbor_nd(input_data=data_4d, k=3, p=[2, 1, 4, 3], metric='l2', mode='median'))
