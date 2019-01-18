(function () {
    if (!mstrmojo.plugins.D3WordCloud) {
        mstrmojo.plugins.D3WordCloud = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.CustomVisBase",
        "mstrmojo.models.template.DataInterface"
    );

    //for 10.4 and previous versions of mobile use {url: "../D3WordCloud/javascript/mojo/js/source/d3.layout.cloud.js"}
    mstrmojo.plugins.D3WordCloud.D3WordCloud = mstrmojo.declare(
        mstrmojo.CustomVisBase,
        null,
        {
            scriptClass: "mstrmojo.plugins.D3WordCloud.D3WordCloud",
            cssClass: "d3wordcloud",
            errorMessage: "Either there is not enough data to display the visualization or the visualization configuration is incomplete.",
            errorDetails: "This visualization requires one or more attributes and one metric.",
            externalLibraries: [
                {url: "//d3js.org/d3.v4.min.js"},
                {url: (mstrApp.getPluginsRoot && mstrApp.getPluginsRoot() || "../plugins/") + "D3WordCloud/javascript/mojo/js/source/d3.layout.cloud.js"}
            ],
            noConflictLibraries: [
                mstrmojo.CustomVisBase.ENUM_EXTERNAL_LIBS.D3
            ],
            useRichTooltip: false,
            reuseDOMNode: false,
            draggable: false,
            supportNEE: true, // indicate the widget supports PDF exporting by New Export Engine
            setScaleValue: function setScaleValue(isScale) {
                var value = +this.getProperty("value");
                value = isScale ? ++value : --value;
                var properties = this.getProperties();
                properties.value = value;
            },
            plot: function () {
                var VIformat = this.defn.fmts;
                var is10point3 = typeof this.addThresholdMenuItem === 'function'; //True if we are using MSTR 10.3 or above
                var is10point4 = typeof this.getColorByAttInfo === 'function'; //True if we are using MSTR 10.4
                var isDocument = this.zonesModel;//undefined if it's a document
                var me = this;
                var defaultNumWords = 200;
                var defaultMinFontSize = 10;
                var defaultMaxFontSize = 70;
                var defaultWordPadding = 10;
                // var adjustTooltipX = me.zonesModel ? 500 : 100; //if it's document adjustX = 100, in dashboard it's 500
                // var adjustTooltipY = 50;
                var total_width = parseInt(me.width, 10);
                var total_height = parseInt(me.height, 10);
                var margin = {top: 0, right: 0, bottom: 0, left: 0};
                //var margin = {top: 20, right: 20, bottom: 20, left: 20};
                var width = total_width - margin.left - margin.right;
                var height = total_height - margin.top - margin.bottom;
                var fntFamily;
                // Check if "textFont" property exists
                if (me.getProperty("textFont")) {
                    fntFamily = me.getProperty("textFont").fontFamily;
                } else {
                    fntFamily = parseFont(VIformat.ttl.font).fontFamily;
                }
                var color = d3.schemeCategory20;    //In MSTR 10.3 or older versions, default colors for words
                //In 10.4 default colors are obtained from colorByAttributes

                if (is10point3) {
                    me.setDefaultPropertyValues({
                        minfont: "10",
                        maxfont: "70",
                        numofwords: "200",
                        spiral: {a: "true", b: "false"},
                        defaultcolors: "true",
                        textFont:{fontColor: '#000', fontFamily: "Arial"}
                    });
                    me.addThresholdMenuItem();
                }
                
                me.addUseAsFilterMenuItem();
                var properties = me.getProperties(); //var to store custom properties
                var dataConfig = {hasSelection: true};
                if (is10point3) {
                    dataConfig.hasThreshold = true;
                }
                if (is10point4 && isDocument) {
                    dataConfig.colorByInfo = me.zonesModel.getColorByAttributes();
                }
                var rawD = me.dataInterface.getRawData(mstrmojo.models.template.DataInterface.ENUM_RAW_DATA_FORMAT.TREE, dataConfig);

                var dataS = [];
                for (var i = 0; i < rawD.children.length; i++) {
                    var obj = {};
                    obj.text = rawD.children[i].name;
                    obj.value = rawD.children[i].value;
                    obj.index = i;
                    dataS.push(obj);
                }

                var maxvalue = is10point3 && me.getProperty("numofwords") ? +me.getProperty("numofwords") : defaultNumWords; //default number of words - 200, maximum number of words - 250
                maxvalue = dataS.length < maxvalue ? dataS.length : maxvalue; //if total number of words is < maxvalue, maxvalue is set to total num of words
                if (properties)
                    properties.numofwords = maxvalue.toString(); //to set the correct number of words in custom properties

                var sortedData = dataS.sort(function(a,b){return b.value - a.value;}); // to sort the data and select maxvalue elements
                var maxfontsize = is10point3 && me.getProperty("maxfont") ? + me.getProperty("maxfont") : defaultMaxFontSize;
                var minfontsize = is10point3 && me.getProperty("minfont") ? + me.getProperty("minfont") : defaultMinFontSize;
                var fontscale = d3.scaleLinear()//d3.scale.linear()
                    .domain([sortedData[0].value, sortedData[maxvalue - 1].value])
                    .range([maxfontsize, minfontsize]);
                var frequency_list = []; //data to be passed to the library
                var indexMap = {}; // to store attributeElement - index pair

                //to populate frequency_list var
                for (var i = 0, j = sortedData.length; i < sortedData.length; i++, j--) {
                    var obj = {};
                    obj.text = sortedData[i].text;
                    obj.size = fontscale(sortedData[i].value);
                    frequency_list.push(obj);
                    indexMap[obj.text] = sortedData[i].index; //index is the original index of the attribute element as assigned in DataInterface API
                }
                var div = d3.select(me.domNode).append("div")
                    .attr("class", "tip")
                    .style("opacity", 0);
                
                var chart = d3.select(me.domNode).select("svg");
                //detailed description for each function is given here: https://github.com/jasondavies/d3-cloud
                var layout = d3.layout.cloud()
                    .size([width, height])
                    .timeInterval(1000) //maximum amount of time that can be spent during the current timestep
                    .words(frequency_list)
                    .rotate(function(d) { return 0; })
                    .padding(1)
                    .font(fntFamily)
                    .fontSize(function (d) {
                        return d.size;
                    });

                if (is10point3 && me.getProperty("textFont") && me.getProperty("textFont").fontFamily) {
                    layout.font(fntFamily);
                }
                if (is10point3 && me.getProperty("spiral")) {
                    layout.spiral(me.getProperty("spiral").a === "true" ? "archimedean" : "rectangular");
                }

                layout.on("end", draw)
                    .start();
                
                function draw(words) {
                    try {
                        if (!chart.empty()) {
                            var e = me.domNode.querySelector(".wordcloud");
                            me.domNode.removeChild(e);
                        }
                        // define the main svg content
                        chart = d3.select(me.domNode).append("svg")
                            .attr("width", width)
                            .attr("height", height)
                            .attr("class", "wordcloud")
                            .on("click", function (d) {
                                if (event.target.className.baseVal === 'wordcloud') {
                                    if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.selectionDataJSONString) {  // mobile
                                        var message = {};
                                        message.messageType = "deselection";
                                        window.webkit.messageHandlers.selectionDataJSONString.postMessage(message);
                                    } else {
                                        me.clearSelections();
                                        me.endSelections();
                                    }  
                                } else {
                                    return true;
                                }
                            })
                            .attr("fill", "none")
                            .style("display", "block");

                        // define the container for words
                        var container = chart.append("g")
                            .attr("width", total_width)
                            .attr("height", total_height)
                            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
                            .call(d3.drag()
                                .on("drag", dragged));
                        
                        // apply zoom for the container
                        /*var zoom = d3.behavior.zoom()
                            .scaleExtent([1, 5])
                            .on("zoom", function(d) {zoomed(this);});
                        container.call(zoom);
                        */
                        //create zoom handler 
                        var zoom_handler = d3.zoom()
                            .scaleExtent([0.5, 5])
                            .on("zoom", zoom_actions);
                        //add zoom behaviour to the svg element backing our graph.  
                        //same thing as svg.call(zoom_handler); 
                        zoom_handler(container);


                        // adjust the position of words in order to fit them in the container
                        for (var index = 0; index < words.length; index ++) {
                            var word = words[index];
                            word.x += (0.5 * total_width);
                            word.y += (0.5 * total_height);
                        }
                                
                        var cloud = container.selectAll("text")
                            .data(words)
                            .enter()
                            .append("text")
                                .style("font-size", function (d) {
                                    return d.size + "px";
                                })
                                .style("font-family", function (d) {
                                    return d.font;
                                })
                                .style("fill", function (d, i) {
                                    //if setDefaultColor in custom property is checked, I am deleting the old font color from properties
                                    if (is10point3 && (me.getProperty("defaultcolors") && me.getProperty("defaultcolors") === "false") &&
                                        me.getProperty("textFont") && me.getProperty("textFont").fontColor) {
                                        return me.getProperty("textFont").fontColor;
                                    }

                                    var index = indexMap[d.text];
                                    //to use the thresholding color
                                    if (is10point3 && rawD.children[index].values[0].threshold) {
                                        return rawD.children[index].values[0].threshold.fillColor;
                                    }
                                    //In case of 10.4 or above, will use the default color from ColorPallete API
                                    if (is10point4 && me.zonesModel) {
                                        return me.getColorBy(rawD.children[index].colorInfo);
                                    }
                                    //In case of 10.3 or below, will use the default color from D3 color scale
                                    return color(i);
                            })
                            .attr("text-anchor", "middle")
                            .attr("transform", function (d) {
                                return "translate(" + [d.x, d.y] + ")";
                            })
                            .text(function (d) {
                                return d.text;
                            })
                            .on("click", function (d, i) {
                                var index = indexMap[d.text];

                                if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.selectionDataJSONString) {  // For mobile
                                    rawD.children[index].attributeSelector.messageType = "selection";
                                    window.webkit.messageHandlers.selectionDataJSONString.postMessage(rawD.children[index].attributeSelector);
                                } else {
                                    me.applySelection(rawD.children[index].attributeSelector);
                                    me.selected = true;
                                }
                            })
                            // Create Tooltip
                            .append("svg:title")
                            .text(function (d) {
                                var colTitles = me.dataInterface.getColTitles().titles[0].es;
                                var index = indexMap[d.text];
                                var titletext = "";
                                for (var i = 0; i < colTitles.length-1; i++) {
                                    titletext += colTitles[i].n + ": " + rawD.children[index].values[i].v + "\n";
                                }
                                titletext += colTitles[colTitles.length-1].n + ": " + rawD.children[index].values[colTitles.length-1].v;
                                return d.text + "\n" + titletext;
                            });
                    }
                    catch (e) {
                        me.displayError();
                    }

                    function zoomed(obj) {
                        var container = d3.select(obj);
                        container.attr("transform", "translate(" + d3.event.translate +")scale(" + d3.event.scale + ")");
                    }

                    //specify what to do when zoom event listener is triggered 
                    function zoom_actions(){
                        container.attr("transform", d3.event.transform);
                    }

                    function dragged() {
                        var container = d3.select(this);
                        var positionMatrix = container.node().transform.baseVal.consolidate().matrix;
                        var currentX = positionMatrix.e;
                        var currentY = positionMatrix.f;

                        container.attr("transform", "translate("+ [currentX + d3.event.dx , currentY + d3.event.dy] + ")");
                    }
                    // raise event for New Export Engine
                    me.raiseEvent({
                        name: 'renderFinished',
                        id: me.k
                    });
                }
               
                function applyHTMLEncoding(str) {
                    if (typeof mstrmojo.CustomVisUtility !== "undefined") { 
                        return mstrmojo.CustomVisUtility.encodeHtmlString(str);
                    } else if(typeof mstrmojo.string.encodeHtmlString !== "undefined") {
                        return mstrmojo.string.encodeHtmlString(str);
                    } else {
                        return str;
                    }
                }

                function parseFont(font) {
                        var fontFamily = null,
                            fontSize = null,
                            fontStyle = "normal",
                            fontWeight = "normal",
                            fontVariant = "normal",
                            lineHeight = "normal";

                        var elements = font.split(/\s+/);
                        outer: while (element = elements.shift())
                        {
                            switch (element)
                            {
                                case "normal":
                                    break;
                                case "italic":
                                case "oblique":
                                    fontStyle = element;
                                    break;
                                case "small-caps":
                                    fontVariant = element;
                                    break;

                                case "bold":
                                case "bolder":
                                case "lighter":
                                case "100":
                                case "200":
                                case "300":
                                case "400":
                                case "500":
                                case "600":
                                case "700":
                                case "800":
                                case "900":
                                    fontWeight = element;
                                    break;

                                default:
                                    if (!fontSize)
                                    {
                                        var parts = element.split("/");
                                        fontSize = parts[0];
                                        if (parts.length > 1) lineHeight = parts[1];
                                        break;
                                    }

                                    fontFamily = element;
                                    if (elements.length) {
                                        fontFamily += " " + elements.join(" ");
                                        fontFamily = fontFamily.replace(/'/g, "");
                                    }
                                    break outer;
                            }
                        }

                        return {
                            "fontStyle": fontStyle,
                            "fontVariant": fontVariant,
                            "fontWeight": fontWeight,
                            "fontSize": fontSize,
                            "lineHeight": lineHeight,
                            "fontFamily": fontFamily
                        };
                    }

            }
        });
}());
//@ sourceURL=D3WordCloud.js
