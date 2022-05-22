import matplotlib.pyplot as plt
import numpy as np

lowertri=[0.692,
          0.684,0.651,
          0.688,0.681, 0.678,
          0.688,0.689,0.679,0.669,
          0.688,0.689,0.679,0.664,0.654,
          0.689,0.667,0.667,0.662,0.677,0.672,
          0.689,0.667,0.667,0.66,0.67,0.661,0.653,]


upper_tri=[0.837,0.837,0.818,0.818,0.818,0.837,0.818,
           0.765,0.765,0.837,0.837,0.818,0.765,
           0.765,0.765,0.782,0.818,0,
           0,0,0.731,0,
           0,0,0,
           0,0,
           0,]
#upper_tri will have xlist2
xlist1=[]
ylist1=[]
for i in range(0,8):
    for j in range(0,i):
        xlist1.append(i)
        ylist1.append(j)
        print(i-1,j)
        
xlist2=[]
ylist2=[]
for i in range(0,7):
    for j in range(7,i,-1):
        xlist2.append(i)
        ylist2.append(j)
xdia=[]
ydia=[]
for i in range(0,8):
    ydia.append(i)
    xdia.append(i)
dia_vals=[0.692,0.654,0.644,0.635,0.633,0.64,0.639,0.567]

# for i, txt in enumerate(lowertri):
#     plt.annotate(txt, (xlist1[i], ylist1[i]))
# for i, txt in enumerate(upper_tri):
#     plt.annotate(txt, (xlist2[i], ylist2[i]))
# for i, txt in enumerate(dia_vals):
#     plt.annotate(txt, (xdia[i], ydia[i]))
plt.scatter(xlist2,ylist2,c=upper_tri,cmap='RdPu',vmin=0.7, s=300,edgecolors='black')#c=lowertri, cmap='RdPu',vmin=0.7, s=300)
plt.colorbar()
plt.scatter(xlist1,ylist1,c=lowertri, cmap='Greens', s=300,edgecolors='black')#c=upper_tri, cmap='Greens', s=300)
# plt.xlabel("Lower Bound")
# plt.ylabel("Upper Bound")
plt.colorbar()
plt.scatter(xdia,ydia,c=dia_vals,cmap='Wistia', s=300,edgecolors='black')#c=dia_vals, cmap='Wistia', s=300)
# plt.title("Influence of homogeneity on performance of semantic classification")

plt.yticks(np.arange(8), ('5', '6', '7', '8', '9','10','11','12'))
plt.xticks(np.arange(8),('5', '6', '7', '8', '9','10','11','12'))
plt.colorbar()
plt.show()

       
        

