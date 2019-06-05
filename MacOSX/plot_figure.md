
# aaa

## Plot with Python

Packages: matplotlib, seaborn

Example:

``` py
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
import seaborn as sns

# plot curve
plt.plot([0, 1.5], [0, 1.5])
# plot scatter
plt.scatter()
# plot bar plot
plt.bar(x, y)
# Plot heatmap with colorbar
sns.heatmap(data, xticklabels=xlabels, yticklabels=ylabels, square=True, mask=mask)
```

```py
# Set up legend.
handles, label = axis.get_legend_handles_labels()
plt.legend(handles, label, frameon=False, fontsize=10)
```

### Subplots

```py
# Fix layout structure.
fig, axiss = plt.subplots(2, 2, constrained_layout=True)

# Self defined structure.
fig = plt.figure(constrained_layout=True)
gs = GridSpec(2, 2, figure=fig)
axis = plt.subplot(gs[0, 0]))
```

### Set ticks and labels

```py
# Set the tick range in axis
axis.set_xlim(ax_min, ax_max)
axis.set_ylim(ax_min, ax_max)

# Set `pad` to control the padding between the
#       ticklabel and axis
tick = np.linspace(ax_min, ax_max, 3)
ticklabel = [r'%.2f' % x for x in tick]
axis.set_xticks(tick)       # Set `[]` to disable ticklabel
axis.set_yticks(tick)
axis.set_xticklabels(ticklabel)
axis.set_yticklabels(ticklabel)

# Set the ticks' appraence in axis
axis.grid(True, linestyle='dotted', linewidth=0.4)
axis.tick_params(axis='both', top=True, right=True, direction='in',
                 width=0.5, length=1.5,
                 labelsize=6, labelrotation=30)

# set `labelpad` to control the padding
#       between label and axis
axis.set_xlabel(xlabel, fontsize=6, labelpad=1)
axis.set_ylabel(ylabel, fontsize=6, labelpad=1)

# set `pad` to control the padding
#       between title and axis
axis.set_title(title, fontsize=6, pad=1)

# Another way
"""
Calling this function with arguments is the pyplot equivalent
    of calling set_xticks and set_xticklabels on the current axes.
"""
plt.xticks(tick, ticklabel, fontsize=6, rotation=30)
plt.yticks(tick, ticklabel, fontsize=6)
plt.xlabel(xlabel, labelpad=1,
           fontsize=6, fontfamily='serif', fontname='Times New Roman')
```

``` py
# Set the width of the axis
axis.spines['top'].set_linewidth(0.1)
axis.spines['bottom'].set_linewidth(0.1)
axis.spines['left'].set_linewidth(0.1)
axis.spines['right'].set_linewidth(0.1)
# Set the apprance of the axis
axis.spines['top'].set_visible(True)
axis.spines['bottom'].set_visible(True)
axis.spines['left'].set_visible(True)
axis.spines['right'].set_visible(True)
```

### Set figure size

```py
fig = plt.gcf()
fig.set_size_inches(width, height)
```

### Layout

Use constrained_layout

```py
# Be sure to set this before creating any axes.
plt.rcParams['figure.constrained_layout.hspace'] = 0.
plt.rcParams['figure.constrained_layout.h_pad'] = 0.
plt.rcParams['figure.constrained_layout.wspace'] = 0.
plt.rcParams['figure.constrained_layout.w_pad'] = 0.

fig, axis = plt.subplots(2, 2, constrained_layout=True)
```

Use tight_layout & adjust_subplots

```py
axis.tight_layout(True)
axis.adjust_subplots()
```

### Latex support

``` py
plt.rc('text', usetex=True)
plt.rc('text.latex', preamble=[r'\usepackage{times}'])
# Set font to 'Times New Roman'
#
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = ['Times New Roman']
```

# Power Point
