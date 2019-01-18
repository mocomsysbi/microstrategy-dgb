(function () {
    if (!mstrmojo.plugins.GoogleTimeline) {
        mstrmojo.plugins.GoogleTimeline = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.vi.models.editors.CustomVisEditorModel",
        "mstrmojo.array"
    );

    var $WT = mstrmojo.vi.models.editors.CustomVisEditorModel.WIDGET_TYPE,
        GTL_PROPERTIES = mstrmojo.plugins.GoogleTimeline.GTL_PROPERTIES;

    mstrmojo.plugins.GoogleTimeline.GoogleTimelineEditorModel = mstrmojo.declare(
        mstrmojo.vi.models.editors.CustomVisEditorModel,
        null,
        {
            scriptClass: "mstrmojo.plugins.GoogleTimeline.GoogleTimelineEditorModel",
            cssClass: "googletimelineeditormodel",
            getCustomProperty: function getCustomProperty() {
                var host = this.getHost();
                return [
                    {
                        name: 'Timeline Settings',
                        value: [{
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "Row Labels:"
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 'hideRowLabels',
                                labelText: "Hide row labels",
                                config: {
                                    suppressData: true
                                }
                            }]
                        },
                            {
                                style: $WT.EDITORGROUP,
                                items: [{
                                    style: $WT.LABEL,
                                    name: "text",
                                    width: "100%",
                                    labelText: "Bar Labels:"
                                }, {
                                    style: $WT.CHECKBOXANDLABEL,
                                    propertyName: 'hideBarLabels',
                                    labelText: "Hide bar labels",
                                    config: {
                                        suppressData: true
                                    }
                                }]
                            },
                            {

                                style: $WT.EDITORGROUP,
                                items: [{
                                    style: $WT.LABEL,
                                    name: "text",
                                    width: "100%",
                                    labelText: "Row Labels Style:"
                                }, {
                                    style: $WT.CHARACTERGROUP,
                                    propertyName: 'rowLabelFont',
                                    showFontStyle: false

                                }]
                            },
                            {
                                style: $WT.EDITORGROUP,
                                items: [{
                                    style: $WT.LABEL,
                                    name: "text",
                                    width: "100%",
                                    labelText: "Bar Labels Style:"
                                }, {
                                    style: $WT.CHARACTERGROUP,
                                    propertyName: 'barLabelFont',
                                    showFontStyle: false,
                                    showFontSizeAndColor: true,
                                    items: [{
                                        childName: 'fontSize',
                                        disabled: false
                                    }, {
                                        childName: 'fontColor',
                                        disabled: true
                                    }],
                                    config: {
                                        suppressData: true
                                    }
                                }]
                            }]
                    },

                ];


            }
        })
}());
//@ sourceURL=GoogleTimelineEditorModel.js