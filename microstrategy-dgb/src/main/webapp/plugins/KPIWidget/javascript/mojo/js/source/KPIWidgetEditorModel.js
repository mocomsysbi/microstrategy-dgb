(function () {
    if (!mstrmojo.plugins.KPIWidget) {
        mstrmojo.plugins.KPIWidget = {};
    }
    mstrmojo.requiresCls(
        "mstrmojo.vi.models.editors.CustomVisEditorModel",
        "mstrmojo.plugins.KPIWidget.KPIWidget",
        "mstrmojo.array"
    );

    var $WT = mstrmojo.vi.models.editors.CustomVisEditorModel.WIDGET_TYPE,
        KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES;

    mstrmojo.plugins.KPIWidget.KPIWidgetEditorModel = mstrmojo.declare(
        mstrmojo.vi.models.editors.CustomVisEditorModel,

        null,
        {
            scriptClass: 'mstrmojo.plugins.KPIWidget.KPIWidgetEditorModel',

            getCustomProperty: function getCustomProperty() {
                var host = this.getHost();
                return [
                    {
                        name: 'KPI Settings',
                        value: [{
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "Display Mode:"
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 'singleRowMode',
                                labelText: "Single row mode",
                                config: {
                                    suppressData: true
                                }
                            }]

                        }, {
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "Text Format:"
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 'fitToPage',
                                labelText: "Fit to page",
                                config: {
                                    suppressData: true
                                }
                            }]
                        }, {
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "KPI Name:"
                            }, {
                                style: $WT.CHARACTERGROUP,
                                propertyName: 'namefont',
                                disabled: host.getFormatPropertyValue('singleRowMode') === true,
                                items: [{
                                    childName: 'fontSize',
                                    disabled: host.getFormatPropertyValue('fitToPage') === true
                                }]
                            }]
                        }, {
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "KPI Value:"
                            }, {
                                style: $WT.CHARACTERGROUP,
                                propertyName: 'valuefont',
                                items: [{
                                    childName: 'fontSize',
                                    disabled: host.getFormatPropertyValue('fitToPage') === true
                                }]
                            }]
                        }, {
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "Display Text:"
                            }, {
                                style: $WT.TEXTBOX,
                                propertyName: "displayText",
                                value: "input the metric name for display",
                                config: {
                                    suppressData: true
                                }
                            }]
                        }]
                    }, {
                        name: 'Threshold Settings',
                        value: [{
                            style: $WT.EDITORGROUP,
                            items: [{
                                style: $WT.LABEL,
                                name: "text",
                                width: "100%",
                                labelText: "Threshold Options:"
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 't1Enable',
                                labelText: 'Enable Color Range A'
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 't2Enable',
                                labelText: 'Enable Color Range B'
                            }, {
                                style: $WT.CHECKBOXANDLABEL,
                                propertyName: 't3Enable',
                                labelText: 'Enable Color Range C'
                            }]
                        },
                            {
                                style: $WT.EDITORGROUP,
                                items: [{
                                    style: $WT.LABEL,
                                    disabled: host.getFormatPropertyValue('t1Enable') === 'false',
                                    name: "text",
                                    width: "100%",
                                    labelText: "Color Range A:"
                                }, {//group1
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t1Enable') === 'false',
                                    items: [{
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "From:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "l1"
                                        }]
                                    }, {
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "to:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "h1"
                                        }]
                                    }]
                                }, {
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t1Enable') === 'false',
                                    items: [{
                                        style: $WT.LABEL,
                                        name: "text",
                                        width: "25%",
                                        labelText: "Color:"
                                    }, {
                                        style: $WT.FILLGROUP,
                                        width: "70%",
                                        propertyName: "fillColor1",
                                        items: [{
                                            childName: "fillAlpha",
                                            disabled: true
                                        }]
                                    }]
                                }, {
                                    style: $WT.LABEL,
                                    disabled: host.getFormatPropertyValue('t2Enable') === 'false',
                                    name: "text",
                                    width: "100%",
                                    labelText: "Color Range B:"
                                }, {//group2
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t2Enable') === 'false',
                                    items: [{
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "From:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "l2"
                                        }]
                                    }, {
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "to:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "h2"
                                        }]
                                    }]
                                }, {
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t2Enable') === 'false',
                                    items: [{
                                        style: $WT.LABEL,
                                        name: "text",
                                        width: "25%",
                                        labelText: "Color:"
                                    }, {
                                        style: $WT.FILLGROUP,
                                        width: "70%",
                                        propertyName: "fillColor2",
                                        items: [{
                                            childName: "fillAlpha",
                                            disabled: true
                                        }]
                                    }]
                                }, {
                                    style: $WT.LABEL,
                                    disabled: host.getFormatPropertyValue('t3Enable') === 'false',
                                    name: "text",
                                    width: "100%",
                                    labelText: "Color Range C:"
                                }, {
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t3Enable') === 'false',
                                    items: [{
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "From:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "l3"
                                        }]
                                    }, {
                                        style: $WT.TWOCOLUMN,
                                        width: "50%",
                                        items: [{
                                            style: $WT.LABEL,
                                            width: "50%",
                                            name: "text",
                                            labelText: "to:"
                                        }, {
                                            style: $WT.TEXTBOX,
                                            width: "50%",
                                            propertyName: "h3"
                                        }]
                                    }]
                                }, {//group 3
                                    style: $WT.TWOCOLUMN,
                                    disabled: host.getFormatPropertyValue('t3Enable') === 'false',
                                    items: [{
                                        style: $WT.LABEL,
                                        name: "text",
                                        width: "25%",
                                        labelText: "Color:"
                                    }, {
                                        style: $WT.FILLGROUP,
                                        width: "70%",
                                        propertyName: "fillColor3",
                                        items: [{
                                            childName: "fillAlpha",
                                            disabled: true
                                        }]
                                    }]
                                },]
                            }]
                    }
                ];
            }
        }
    );
}());
//@ sourceURL=KPIWidgetEditorModel.js
