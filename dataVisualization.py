
# coding: utf-8

# In[11]:


from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from matplotlib import cm
import numpy as np
import pandas as pd
from sys import argv
from sklearn import svm
import random
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.stats import kde
import time

time_start=time.time()

df = pd.read_csv ("D:/MasterThesis/testdata.csv", na_values="?")
x = df["Beam radius(μm)"]
y = df["Intensity(W/m²)"]
z = df["Drilling velocity(m/s)"]
min_y = min(y) 
range_y = max(y)- min_y
range_y
y=[]
for k in df["Intensity(W/m²)"]:
    y.append((k-min_y)/range_y)
    
df["Intensity(W/m²)"] = y
df["Beam radius(μm)"] = (x-min(x))/(max(x)-min(x))
df["Drilling velocity(m/s)"] = (z-min(z))/(max(z)-min(z))
x = df["Beam radius(μm)"]
y = df["Intensity(W/m²)"]
z = df["Drilling velocity(m/s)"]

time_end0=time.time()
print('time cost 0',time_end0-time_start,'s')

# Make the plot
fig = plt.figure(figsize=(6, 4),dpi=180)
ax = fig.gca(projection='3d')
ax.plot_trisurf(x, y, z, cmap=plt.cm.viridis, linewidth=0.1)
#plt.show()
 
# to Add a color bar which maps values to colors.
#surf=ax.plot_trisurf(x, y, z, cmap=plt.cm.viridis, linewidth=0.1)
# Rotate it
ax.view_init(azim=270, elev=90)
ax.set_xticks(())
ax.set_yticks(())
plt.tight_layout()
plt.savefig('D:/sample/NewFolder/Document/UI-DataVisualization/testdata-diagram_01.png',transparent=True,bbox_inches='tight')
#plt.show()

time_end1=time.time()
print('time cost 1',time_end1-time_start,'s')
 
# Other palette
#ax.plot_trisurf(x, y, z, cmap=plt.cm.jet, linewidth=0.1)

from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_iris
from sklearn.model_selection import StratifiedShuffleSplit
from sklearn.model_selection import GridSearchCV

def make_meshgrid(x, y, h=.02):
    """Create a mesh of points to plot in

    Parameters
    ----------
    x: data to base x-axis meshgrid on
    y: data to base y-axis meshgrid on
    h: stepsize for meshgrid, optional
    Returns
    -------
    xx, yy : ndarray
    """
    x_min, x_max = x.min() - 0.05, x.max() + 0.05
    y_min, y_max = y.min() - 0.05, y.max() + 0.05
    xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                         np.arange(y_min, y_max, h))
    return xx, yy

def plot_contours(ax, clf, xx, yy, **params):
    """Plot the decision boundaries for a classifier.
    Parameters
    ----------
    ax: matplotlib axes object
    clf: a classifier
    xx: meshgrid ndarray
    yy: meshgrid ndarray
    params: dictionary of params to pass to contourf, optional
    """
    Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])
    Z = Z.reshape(xx.shape)
    out = ax.contourf(xx, yy, Z, **params)
    return out


X = df[["Beam radius(μm)","Intensity(W/m²)"]]
y = df["Applicable region 1"]

svm = SVC(kernel='rbf', random_state=0, gamma=50, C=100)
clf = svm.fit(X, y)

fig, ax = plt.subplots(figsize=(6, 4),dpi=112)
# title for the plots
# Set-up grid for plotting.
X0, X1 = X["Beam radius(μm)"], X["Intensity(W/m²)"]
xx, yy = make_meshgrid(X0, X1)

plot_contours(ax, clf, xx, yy, cmap=plt.cm.gist_yarg, alpha=0.2)
ax.set_ylabel('Intensity(W/m²)')
ax.set_xlabel('Beam radius(μm)')
ax.set_xticks(())
ax.set_yticks(())
plt.savefig('D:/sample/NewFolder/Document/UI-DataVisualization/testdata-diagram_02.png',transparent=True,bbox_inches='tight')
plt.tight_layout()
#plt.show()

time_end2=time.time()
print('time cost 2',time_end2-time_start,'s')

y = df["Applicable region 2"]

svm = SVC(kernel='rbf', random_state=0, gamma=10, C=100)
clf = svm.fit(X, y)

fig, ax = plt.subplots(figsize=(6, 4),dpi=112)
# title for the plots
# Set-up grid for plotting.
X0, X1 = X["Beam radius(μm)"], X["Intensity(W/m²)"]
xx, yy = make_meshgrid(X0, X1)

plot_contours(ax, clf, xx, yy, cmap=plt.cm.gist_yarg, alpha=0.2)
ax.set_ylabel('Intensity(W/m²)')
ax.set_xlabel('Beam radius(μm)')
ax.set_xticks(())
ax.set_yticks(())
plt.savefig('D:/sample/NewFolder/Document/UI-DataVisualization/testdata-diagram_03.png',transparent=True,bbox_inches='tight')
#plt.show()

time_end3=time.time()
print('time cost 3',time_end3-time_start,'s')



# In[ ]:





# In[ ]:




