(function () {
    if (!mstrmojo.plugins.SequencesSunburst) {
        mstrmojo.plugins.SequencesSunburst = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.vi.models.CustomVisDropZones",
        "mstrmojo.array"
    );

    mstrmojo.plugins.SequencesSunburst.SequencesSunburstDropZones = mstrmojo.declare(
        mstrmojo.vi.models.CustomVisDropZones,
        null,
        {
            scriptClass: "mstrmojo.plugins.SequencesSunburst.SequencesSunburstDropZones",
            cssClass: "sequencessunburstdropzones",
            getCustomDropZones: function getCustomDropZones() {
                var ENUM_ALLOW_DROP_TYPE = mstrmojo.vi.models.CustomVisDropZones.ENUM_ALLOW_DROP_TYPE;
                return [
                    {
                        name: 'Attributes',
                        title: mstrmojo.desc(13828, 'Drag attributes here'),
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE,
                    }, {
                        name: 'Metric',
                        title: mstrmojo.desc(13827, 'Drag metric here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.METRIC
                    }

                    //an additional information metrics dropzone can be created here to display additional metrics
                    //corresponding logic needs to be added in the SequencesSunburst.js
                    // , {
                    //     name: 'Information Metrics',
                    //     title: mstrmojo.desc(13827, 'Drag additional metrics here'),
                    //     allowObjectType: ENUM_ALLOW_DROP_TYPE.METRIC
                    // }
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
//@ sourceURL=SequencesSunburstDropZones.js