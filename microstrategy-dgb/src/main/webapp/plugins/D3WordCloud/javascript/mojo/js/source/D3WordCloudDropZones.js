(function () {
    if (!mstrmojo.plugins.D3WordCloud) {
        mstrmojo.plugins.D3WordCloud = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.vi.models.CustomVisDropZones",
        "mstrmojo.array"
    );

    mstrmojo.plugins.D3WordCloud.D3WordCloudDropZones = mstrmojo.declare(
        mstrmojo.vi.models.CustomVisDropZones,
        null,
        {
            scriptClass: "mstrmojo.plugins.D3WordCloud.D3WordCloudDropZones",
            cssClass: "d3wordclouddropzones",
            getCustomDropZones: function getCustomDropZones() {
                var ENUM_ALLOW_DROP_TYPE = mstrmojo.vi.models.CustomVisDropZones.ENUM_ALLOW_DROP_TYPE;
                return [
                    {
                        name: 'Attribute',
                        title: mstrmojo.desc(13828, 'Drag attributes here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.ATTRIBUTE,
                        isColorBy: true
                    }, {
                        name: 'Metric',
                        title: mstrmojo.desc(13827, 'Drag metrics here'),
                        maxCapacity: 1,
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.METRIC
                    },
                    {
                        name: 'Tooltip',
                        title: mstrmojo.desc(13827, 'Drag metrics here'),
                        allowObjectType: ENUM_ALLOW_DROP_TYPE.METRIC
                    }
                ];

            },
            shouldAllowObjectsInDropZone: function shouldAllowObjectsInDropZone(zone, dragObjects, idx, edge, context) {

                var me = this;
                return {
                    allowedItems: mstrmojo.array.filter(dragObjects, function (object) {
                        return true;
                    })
                };
            },
            getActionsForObjectsDropped: function getActionsForObjectsDropped(zone, droppedObjects, idx, replaceObject, extras) {
                var me = this, actions = [];
                if (me.getDropZoneName(zone) === 'Metric') {
                    this.getAddDropZoneObjectsActions(actions, 'Tooltip', droppedObjects, idx, extras);
                }
                return actions;
            },
            getActionsForObjectsRemoved: function getActionsForObjectsRemoved(zone, objects) {
                var me = this, actions = [];
                if (me.getDropZoneName(zone) === 'Metric') {
                    this.getRemoveDropZoneObjectsActions(actions, 'Tooltip', objects);
                }
                return actions;
            },
            getDropZoneContextMenuItems: function getDropZoneContextMenuItems(cfg, zone, object, el) {

            }
        })
}());
//@ sourceURL=D3WordCloudDropZones.js