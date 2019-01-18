# Timeline Visualization

Visualize data as events arranged in chronological order along a bar, using any time scale. Most timelines use a linear scale, with a specific unit of distance equal to a specific amount of time. Each event can be a single point in time or a date range. Timelines allow users to see the duration of events, the time that elapses between events, and the overlap between events.

Timelines are frequently used for managing resources and for understanding historical events and trends.

### Requirements

### Object requirements:
  - Attributes: 4 (in the order shown below)
     - Group
     - Member of group
     - Beginning date
     - Ending date
  - Metrics: 1
     - Row count

### Minimum MicroStrategy version: 10.2

### Current visualization version: 1.0

### Publisher: MicroStrategy

### MicroStrategy Features
  - [Supports using a visualization as a selector][VisAsSelector]
  - [Supports custom properties  (10.3 and later)][CustomProperties]
  - [Supports exporting engine  (10.6 and later)][ExportingEngine]

### Initial post: 08/02/2016
### Last changed:
### Changes made: [Change Log Details]


[VisAsSelector]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5/Using_Vis_As_Selector.htm>
[CustomProperties]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/default.htm#topics/HTML5//Creating_and_using_custom_properties.htm>
[Change Log Details]: <https://github.microstrategy.com/AnalyticsSDK/Visualizations/blob/next/GoogleTimeline/CHANGELOG.md>
[ExportingEngine]: <https://lw.microstrategy.com/msdz/MSDL/_CurrentGARelease/docs/projects/VisSDK_All/Content/topics/HTML5/Exporting_to_PDF.htm>