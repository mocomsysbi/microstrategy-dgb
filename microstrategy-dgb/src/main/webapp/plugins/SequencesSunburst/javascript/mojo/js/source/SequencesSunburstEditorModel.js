(function () { 
    if (!mstrmojo.plugins.SequencesSunburst) {
        mstrmojo.plugins.SequencesSunburst = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.vi.models.editors.CustomVisEditorModel",
        "mstrmojo.array"
    );
    var $WT = mstrmojo.vi.models.editors.CustomVisEditorModel.WIDGET_TYPE;
        // SB_PROPERTIES = mstrmojo.plugins.SequencesSunburst.SB_PROPERTIES;

    mstrmojo.plugins.SequencesSunburst.SequencesSunburstEditorModel = mstrmojo.declare(
        mstrmojo.vi.models.editors.CustomVisEditorModel,
        null,
        {
            scriptClass: "mstrmojo.plugins.SequencesSunburst.SequencesSunburstEditorModel",
            cssClass: "sequencessunbursteditormodel",
            getCustomProperty: function getCustomProperty(){
                var sunburstViz = this.getHost();
                return[{
                    name: 'Sunburst Settings',
                        value: [{
                            style: $WT.EDITORGROUP,
                            items: [{
                                style:  $WT.CHECKBOXANDLABEL,
                                        value:  false,
                                        propertyName:  "hidePath",
                                        labelText:  "Hide path"
                                        ,config: {
                                          suppressData: true,
                                           callback: function () {
                                            //sunburstViz.toggleLegend();
                                            sunburstViz.refresh();
                                          }
                                        }
                            }]
                        }]
                }];









}
})}());
//@ sourceURL=SequencesSunburstEditorModel.js