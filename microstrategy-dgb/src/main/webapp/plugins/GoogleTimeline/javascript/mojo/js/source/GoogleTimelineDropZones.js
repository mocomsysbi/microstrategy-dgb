(function () {
    if (!mstrmojo.plugins.GoogleTimeline) {
        mstrmojo.plugins.GoogleTimeline = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.vi.models.CustomVisDropZones",
        "mstrmojo.array"
    );

    mstrmojo.plugins.GoogleTimeline.GoogleTimelineDropZones = mstrmojo.declare(
        mstrmojo.vi.models.CustomVisDropZones,
        null,
        {
            scriptClass: "mstrmojo.plugins.GoogleTimeline.GoogleTimelineDropZones",
            cssClass: "googletimelinedropzones",
            getCustomDropZones: function getCustomDropZones() {

                var ENUM_ALLOW_DROP_TYPE = mstrmojo.vi.models.CustomVisDropZones.ENUM_ALLOW_DROP_TYPE;
                return [
                    {
                        name: 'Parent Attribute',
                        title: mstrmojo.desc(13828, 'Drag parent attribute here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE,
                    }, {
                        name: 'Child Attribute',
                        title: mstrmojo.desc(13828, 'Drag child attribute here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE

                    }, {
                        name: 'Start Date Attribute',
                        title: mstrmojo.desc(13828, 'Drag start data attribute here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE
                    }, {
                        name: 'End Date Attribute',
                        title: mstrmojo.desc(13828, 'Drag end date attribute here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE
                    }, {
                        name: 'Metric',
                        title: mstrmojo.desc(13827, 'Drag metric here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.METRIC
                    }
                ];
            },
            shouldAllowObjectsInDropZone: function shouldAllowObjectsInDropZone(zone, dragObjects, idx, edge, context) {
                return {allowedItems: dragObjects};


            },
            getActionsForObjectsDropped: function getActionsForObjectsDropped(zone, droppedObjects, idx, replaceObject, extras) {


            },
            getActionsForObjectsRemoved: function getActionsForObjectsRemoved(zone, objects) {


            },
            getDropZoneContextMenuItems: function getDropZoneContextMenuItems(cfg, zone, object, el) {


            }
        })
}());
//@ sourceURL=GoogleTimelineDropZones.js