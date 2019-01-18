(function () {
    if (!mstrmojo.plugins.KPIWidget) {
        mstrmojo.plugins.KPIWidget = {};
    }


    mstrmojo.requiresCls(
        "mstrmojo.CustomVisBase",
        "mstrmojo.models.template.DataInterface",
        "mstrmojo.VisUtility",
        "mstrmojo.vi.models.editors.CustomVisEditorModel"
    );

    var $VISUTIL = mstrmojo.VisUtility,
        $ENUM_LINE_STYLE = mstrmojo.vi.models.editors.CustomVisEditorModel.ENUM_LINE_STYLE;

    var MIN_FONT_SIZE = 16,
        MIN_HEIGHT_FOR_TWO_ROW_MODE = 43,
        MAX_WIDTH_PER = 0.9,
        MAX_HEIGHT_PER = 0.9,
        NAME_TO_VALUE_PER = 0.7,
        PADDING_PER = 0.05,
        PADDING_ON_VERTICAL = 4,
        SEPARATOR = " : ";

    var SINGLE_ROW_MODE = 1,
        TWO_ROW_MODE = 2;

    //create name and value node if haven't
    function createMetricNameAndValueNode() {
        this.domNode.innerHTML = "";
        this.paddingTopNode = document.createElement('div');
        this.metricNameNode = document.createElement('div');
        this.metricValueNode = document.createElement('div');

        this.domNode.appendChild(this.paddingTopNode);
        this.domNode.appendChild(this.metricNameNode);
        this.domNode.appendChild(this.metricValueNode);
    }

    function adjustLocalNameFontSizeByValue() {
        this.nameFntSz_FitToPage = Math.round(parseInt(this.valueFntSz_FitToPage, 10) * NAME_TO_VALUE_PER) + 'pt';
    }

    function isTrue(value) {
        return value === 'true' || value === true ? true : false;
    }

    function isDarkTheme() {
        if (typeof this.isDarkTheme === "function") {
            return this.isDarkTheme();
        } else {
            //for backwards compatible
            var themeClassName = mstrApp && mstrApp.getThemeClassName && mstrApp.getThemeClassName(),
                isDarkTheme = themeClassName && themeClassName.indexOf('dark') >= 0 ? true : false;

            return isDarkTheme;
        }
    }

    /*
     * Code was altered by Xiuyi Ye, xiye@microstrategy.com on June 10, 2016
     * Threshold editor was added through custom properties
     */
    mstrmojo.plugins.KPIWidget.KPI_PROPERTIES = {
        FIT_TO_PAGE: 'fitToPage',
        SINGLE_ROW_MODE: 'singleRowMode',
        DISPLAY_TEXT: 'displayText',
        NAME_FONT: 'namefont',
        VALUE_FONT: 'valuefont',
        THRESHOLD_SETS: [{
            IS_ENABLED: 't1Enable',
            COLOR: 'fillColor1',
            LOW_B: 'l1',
            HIGH_B: 'h1'
        }, {
            IS_ENABLED: 't2Enable',
            COLOR: 'fillColor2',
            LOW_B: 'l2',
            HIGH_B: 'h2'
        }, {
            IS_ENABLED: 't3Enable',
            COLOR: 'fillColor3',
            LOW_B: 'l3',
            HIGH_B: 'h3'
        }]
    };

    mstrmojo.plugins.KPIWidget.KPIWidget = mstrmojo.declare(
        mstrmojo.CustomVisBase,
        null,
        {
            scriptClass: "mstrmojo.plugins.KPIWidget.KPIWidget",

            cssClass: "kpiwidget",

            errorDetails: "This visualization requires only one metric.",

            useRichTooltip: true,

            reuseDOMNode: true,
            
            supportNEE: true, // indicate the widget supports PDF exporting by New Export Engine

            topNodeStyle: {
                width: '100%'
            },
            selectColor: function selectColor(metricValue, thProps) {
                if (metricValue && thProps && thProps.lowB && thProps.highB) {
                    var enabled = thProps.isEnabled,
                        color = thProps.color,
                        lb = Number(thProps.lowB.replace(/[^0-9\.+-]/g, '')),
                        hb = Number(thProps.highB.replace(/[^0-9\.+-]/g, '')),
                        m = metricValue;
                    if (enabled === 'true' && color && (lb <= hb) && (m >= lb) && (m < hb)) {
                        return color.fillColor;
                    }
                }
                return null;
            },
            decideColor: function decideColor(metricValue, thresholdArr) {
                if (metricValue && thresholdArr && thresholdArr.length > 0) {
                    var len = thresholdArr.length;
                    for (var i = 0; i < len; i++) {
                        var returnColor = this.selectColor(metricValue, thresholdArr[i]);
                        if (returnColor == null) {
                            continue;
                        }
                        else {

                            return returnColor;
                        }
                    }
                }

                return null;
            },
            getThresholdValueAndColor: function getThresholdValueAndColor() {
                var thresholdSets = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES.THRESHOLD_SETS,
                    thresholdArr = [];
                if (thresholdSets && thresholdSets.length != 0) {
                    var len = thresholdSets.length;
                    for (var i = 0; i < len; i++) {
                        var temp = {
                            isEnabled: this.getProperty(thresholdSets[i].IS_ENABLED),
                            color: this.getProperty(thresholdSets[i].COLOR),
                            lowB: this.getProperty(thresholdSets[i].LOW_B),
                            highB: this.getProperty(thresholdSets[i].HIGH_B)
                        };
                        thresholdArr.push(temp);
                    }
                }
                return thresholdArr;
            },
            getFormatPropertyValue: function (propertyName) {
                //mock up get value from property API

                var KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES,
                    value = this.getProperty(propertyName);

                if (propertyName === KPI_PROPERTIES.SINGLE_ROW_MODE || propertyName === KPI_PROPERTIES.FIT_TO_PAGE) {
                    value = isTrue(value);
                }

                return value;
            },

            setFormatPropertyValue: function (propertyName, value) {
                this.setProperty(propertyName, value, {suppressData: true});
            },

            getDisplayMode: function getDisplayMode() {
                var KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES;
                if (this.getFormatPropertyValue(KPI_PROPERTIES.SINGLE_ROW_MODE) || this.getHeight() < MIN_HEIGHT_FOR_TWO_ROW_MODE) {
                    return SINGLE_ROW_MODE;
                }
                return TWO_ROW_MODE;
            },

            measureTextSize: function (string, fs, bonus) {
                return {
                    width: $VISUTIL.measureTextWidth(string, fs, bonus),
                    //DE80101;should force to single line when measure text height
                    height: $VISUTIL.measureTextHeight(string, fs, bonus, null, null, null, true)
                };
            },

            getCurrTextSize: function getCurrTextSize() {
                var isCurrSingleRowMode = this.getDisplayMode() === SINGLE_ROW_MODE,
                    metricNameTextSize = isCurrSingleRowMode ? {
                        width: 0,
                        height: 0
                    } : this.measureTextSize(this.metricNameNode.innerHTML, this.getNameFontStyle()),
                    metricValueTextSize = this.measureTextSize(this.metricValueNode.innerHTML, this.getValueFontStyle()),
                    currWidth = Math.max(metricNameTextSize.width, metricValueTextSize.width),
                    currHeight = metricNameTextSize.height + metricValueTextSize.height;
                //add padding top and padding bottom
                currHeight += isCurrSingleRowMode ? PADDING_ON_VERTICAL : PADDING_ON_VERTICAL * 2;
                return {
                    width: currWidth,
                    height: currHeight
                };
            },


            doFitToPage: function doFitToPage() {
                var KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES,
                    fitToPage = this.getFormatPropertyValue(KPI_PROPERTIES.FIT_TO_PAGE);

                if (!fitToPage) {
                    return;
                }

                var width = this.getWidth(),
                    height = this.getHeight(),
                    maxWidth = MAX_WIDTH_PER * width,
                    maxHeight = MAX_HEIGHT_PER * height,
                    isCurrSingleRowMode = this.getDisplayMode() === SINGLE_ROW_MODE,
                    currSize,
                    increaseFontSize = function (isDecrease) {
                        var valueFntSz_FitToPage = parseInt(this.valueFntSz_FitToPage, 10);
                        this.valueFntSz_FitToPage = (isDecrease ? (valueFntSz_FitToPage - 1) : (valueFntSz_FitToPage + 1)) + 'pt';
                        adjustLocalNameFontSizeByValue.call(this);
                    },
                    decreaseFontSize = function () {
                        increaseFontSize.call(this, true);
                    },
                    needDecreaseFontSize = false;


                //start from min font size, increase to fit to page
                this.valueFntSz_FitToPage = MIN_FONT_SIZE + 'pt';
                adjustLocalNameFontSizeByValue.call(this);
                currSize = this.getCurrTextSize();

                if (currSize.width > maxWidth && isCurrSingleRowMode) {
                    //for single row mode, we should drop the name first if there is no enough room, and then show "..." if still not enough
                    this.metricValueNode.innerHTML = this.metricValue;
                    currSize = this.getCurrTextSize();
                }

                //increase font size to fit to page
                while (currSize.width <= maxWidth && currSize.height <= maxHeight) {
                    increaseFontSize.call(this);
                    currSize = this.getCurrTextSize();
                    needDecreaseFontSize = true;
                }
                if (needDecreaseFontSize) {
                    decreaseFontSize.call(this);
                }

            },

            getMetricName: function getMetricName() {
                var DIModel = new mstrmojo.models.template.DataInterface(this.model.data),
                    colHData = DIModel.getColumnHeaderData();


                return colHData && colHData[1] && colHData[1].n;
            },

            checkDataAndCreateNode: function checkDataAndCreateNode() {
                var DIModel = new mstrmojo.models.template.DataInterface(this.model.data),
                    colHData = DIModel.getColumnHeaderData(),
                    metricValue = DIModel.getMetricValue(0, 0),
                    KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES;


                //This widget can only have one metric
                if (DIModel.getTotalRows() !== 0 || DIModel.getTotalCols() !== 1 || colHData.length !== 2 || !metricValue) {
                    throw 'ERROR';
                }

                //get metric name and metric value
                this.metricValue = metricValue.value.v;
                this.metricName = this.getFormatPropertyValue(KPI_PROPERTIES.DISPLAY_TEXT) || this.getMetricName();

                createMetricNameAndValueNode.call(this);
            },
            getMetricValue: function getMetricValue() {
                var DIModel = new mstrmojo.models.template.DataInterface(this.model.data),
                    colHData = DIModel.getColumnHeaderData(),
                    metricValue = DIModel.getMetricValue(0, 0);
                return metricValue.value.rv;

            },

            isEmpty: function isEmpty() {
                var modelData = this.model.data,
                    noData = modelData.eg !== undefined || !modelData.gts;
                if (noData) {
                    return true;
                }
                return false;
            },

            plot: function () {
                this.setDefaultPropertyValues({
                    namefont: {
                        fontSize: '11pt',
                        fontFamily: 'Arial',
                        fontColor: '#bbb'
                    },
                    valuefont: {
                        fontSize: '16pt',
                        fontFamily: 'Arial',
                        fontColor: isDarkTheme.call(this) ? '#fff' : '#000'
                    },
                    fitToPage: 'true',
                    singleRowMode: 'false',
                    displayText: this.getMetricName(),
                    myfill: {
                        Clr: '#ffeedd',
                        FillTrans: '70'
                    },
                    myline: {
                        Clr: '#ffeedd',
                        Style: 4
                    },
                    fillColor1: {fillColor: '#000'},
                    fillColor2: {fillColor: '#000'},
                    fillColor3: {fillColor: '#000'},
                    t1Enable: 'true',
                    t2Enable: 'false',
                    t3Enable: 'false'
                });

                this.checkDataAndCreateNode();
                
                this.metricNameStyle = {};
                this.metricValueStyle = {};


                //update content and style for single row mode or two row mode
                if (this.getDisplayMode() === SINGLE_ROW_MODE) {
                    
                    if (/\S/.test(this.metricName)) {
                        this.metricValueNode.innerHTML = this.metricName + SEPARATOR + this.metricValue;
                    } else {
                        //if metric name only contains space(s), skip the SEPARATOR
                        this.metricValueNode.innerHTML = this.metricValue;
                    }


                    this.metricNameStyle.display = 'none';
                    this.metricValueStyle.textAlign = 'left';
                    this.metricValueStyle.paddingLeft = Math.round(this.getWidth() * PADDING_PER) + 'px';
                    this.metricValueStyle.paddingRight = Math.round(this.getWidth() * PADDING_PER) + 'px';
                } else {
                    //TWO ROW MODE
                    this.metricNameNode.innerHTML = this.metricName;
                    this.metricValueNode.innerHTML = this.metricValue;

                    this.metricNameStyle.display = 'block';
                    this.metricNameStyle.textAlign = 'center';
                    this.metricValueStyle.textAlign = 'center';
                    this.metricValueStyle.paddingLeft = '0px';
                    this.metricValueStyle.paddingRight = '0px';
                }

                //calculate font size to fit to page
                this.doFitToPage();

                this.topNodeStyle.height = Math.round((this.getHeight() - this.getCurrTextSize().height) / 2) + 'px';
                $VISUTIL.applyStyles2DomNode(this.paddingTopNode, this.topNodeStyle);
                $VISUTIL.applyStyles2DomNode(this.metricNameNode, this.getNameFontStyle());
                $VISUTIL.applyStyles2DomNode(this.metricValueNode, this.getValueFontStyle());

                // raise event for New Export Engine
                this.raiseEvent({
                    name: 'renderFinished',
                    id: this.k
                });
            },

            getNameFontStyle: function getNameFontStyle() {
                return this.getFontStyle(false);
            },

            getValueFontStyle: function getValueFontStyle() {
                return this.getFontStyle(true);
            },

            getFontStyle: function getFontStyle(isMetricValue) {
                var KPI_PROPERTIES = mstrmojo.plugins.KPIWidget.KPI_PROPERTIES,
                    fitToPage = this.getFormatPropertyValue(KPI_PROPERTIES.FIT_TO_PAGE),
                    fontStyle = isMetricValue ? this.metricValueStyle : this.metricNameStyle || {},
                    fontProps = (isMetricValue ? this.getFormatPropertyValue(KPI_PROPERTIES.VALUE_FONT) : this.getFormatPropertyValue(KPI_PROPERTIES.NAME_FONT)) || {};

                //update font style by read from property API
                fontStyle.fontFamily = fontProps.fontFamily;
                fontStyle.fontStyle = isTrue(fontProps.fontItalic) ? 'italic' : 'normal';
                fontStyle.fontWeight = isTrue(fontProps.fontWeight) ? 'bold' : 'normal';
                if (isMetricValue) {

                    var returnColor = this.decideColor(this.getMetricValue(), this.getThresholdValueAndColor());
                    if (returnColor == null) {
                        var isLightTheme = !isDarkTheme.call(this);
                        // DE49006 change default metric font color to black in light theme
                        if (isLightTheme && fontProps.fontColor === '#fff') {
                            fontStyle.color = '#000';
                        } else {
                            fontStyle.color = fontProps.fontColor; 
                        }
                    } else {
                        fontStyle.color = returnColor;
                    }
                } else {
                    fontStyle.color = fontProps.fontColor;
                }
                fontStyle.textDecoration = "";

                if (fitToPage) {
                    fontStyle.fontSize = isMetricValue ? this.valueFntSz_FitToPage : this.nameFntSz_FitToPage;
                } else {
                    fontStyle.fontSize = fontProps.fontSize;
                }

                if (isTrue(fontProps.fontUnderline)) {
                    fontStyle.textDecoration += ' underline';
                }

                if (isTrue(fontProps.fontLineThrough)) {
                    fontStyle.textDecoration += ' line-through';
                }

                if (fontStyle.textDecoration === "") {
                    fontStyle.textDecoration = "none";
                }

                //DE77990; This lineHeight is used when measure text height and set apply style. But lineHeight in getComputedStyle will become pixel value on workstation on mac, which will impact the div real height. So use 'normal' here.
                fontStyle.lineHeight = 'normal';
                
                return fontStyle;
            }
        }
    );

    mstrmojo.plugins.KPIWidget.ENUM_DISPLAY_MODE = {
        SINGLE: SINGLE_ROW_MODE,
        TWO: TWO_ROW_MODE
    };

}());
//@ sourceURL=KPIWidget.js
