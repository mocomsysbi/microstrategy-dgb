# Sequences Sunburst Visualization

Visualize the cumulative effect of sequentially introduced positive and negative values. The waterfall chart uses columns and colors to show how an initial value is affected by a series of intermediate positive and negative values. The initial and final values are represented by whole columns, while the intermediate values are displayed as floating columns. The colors of the columns tell you whether the values are positive or negative, showing green for positive values and red for negative values. If you enable the totals feature, a third blue column is added representing the sum of the positive and negative values. You can change the entire color scheme by applying thresholds or change just the color of the third bar using the Properties panel.

Waterfall charts are frequently used to visualize financial statements or data about population, births and deaths. 

The waterfall chart shown below is based only on metrics. If you add an attribute, a succession of waterfalls is shown, with each waterfall representing the metric values for one element of the attribute. This is very useful for quick visual comparisons.  

### Requirements

### Object requirements: 
  -  Attributes: 2
  -  Metrics: 1

### Minimum MicroStrategy version: 10.2

### Current visualization version: 1.0

### Publisher: MicroStrategy 

### MicroStrategy Features 
  - [Supports using a visualization as a selector][VisAsSelector]
  - [Supports customizing drop zones][CustomDropZones]
  - [Supports thresholds  (10.3 and later)][Thresholds]
  - [Supports custom properties  (10.3 and later)][CustomProperties]

### Additional features
  - Interactive breadcrumb trail helps to emphasize the sequence, so that it is easy for first-time users to understand what they are seeing. 
  - Percentages are shown explicitly, to help overcome the distortion of the data that occurs when a radial presentation is used.  
	
### Initial post: 08/02/2016
### Last changed: 08/08/2016
### Changes made: [Change Log Details]


[VisAsSelector]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5/Using_Vis_As_Selector.htm>
[CustomDropZones]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5/Customizing_drop_zones.htm>
[Thresholds]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5/Enabling_and_applying_threshold.htm>
[CustomProperties]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5//Creating_and_using_custom_properties.htm>
[Change Log Details]: <https://github.microstrategy.com/AnalyticsSDK/Visualizations/blob/next/SequencesSunburst/CHANGELOG.md>
