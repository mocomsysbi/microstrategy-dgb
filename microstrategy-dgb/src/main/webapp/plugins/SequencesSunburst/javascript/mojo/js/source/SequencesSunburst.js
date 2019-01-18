(function () {
    if (!mstrmojo.plugins.SequencesSunburst) {
        mstrmojo.plugins.SequencesSunburst = {};
    }

    mstrmojo.requiresCls(
        "mstrmojo.CustomVisBase",
        "mstrmojo.models.template.DataInterface"
    );
    mstrmojo.plugins.SequencesSunburst.SB_PROPERTIES = {
        HIDE_PATH: 'hidePath'
    };

    mstrmojo.plugins.SequencesSunburst.SequencesSunburst = mstrmojo.declare(
        mstrmojo.CustomVisBase,
        null,
        {
            scriptClass: "mstrmojo.plugins.SequencesSunburst.SequencesSunburst",
            cssClass: "sequencessunburst",
            errorMessage: "Either there is not enough data to display the visualization or the visualization configuration is incomplete.",
            errorDetails: "This visualization requires one or more attributes and one metric.",
            externalLibraries: [{url: "//d3js.org/d3.v3.min.js"}],
            useRichTooltip: false,
            reuseDOMNode: false,
            supportNEE: true, // indicate the widget supports PDF exporting by New Export Engine
            // getPathOption: function getPathOption(){
            //     var SB_PROPERTIES = mstrmojo.plugins.SequencesSunburst.SB_PROPERTIES,
            //         hidePathOption = this.getProperty(SB_PROPERTIES.HIDE_PATH);
            //         console.log(hidePathOption);
            //         return hidePathOption;
            // },
            toggleLegend: function () {
                var legend = d3.select("#legend");
                if (legend.style("visibility") == "hidden") {
                    legend.style("visibility", "");
                } else {
                    legend.style("visibility", "hidden");
                }
            },
            plot: function () {
                // Dimensions of sunburst.
                var margin = {top: 10, right: 0, bottom: 10, left: 0},
                    width = parseInt(this.width, 10) - margin.left - margin.right,
                    height = parseInt(this.height, 10) - margin.top - margin.bottom;

                // Enable the "use as selector" option on the visualization menu
                this.addUseAsFilterMenuItem();

                var me = this;

                var is10point2 = true;
                if (typeof me.addThresholdMenuItem == 'function') {
                    me.addThresholdMenuItem();
                    is10point2 = false;
                    me.setDefaultPropertyValues({
                        hidePath: 'false'
                    });

                }

                var dataConfig = {};
                dataConfig.hasSelection = true;
                if (!is10point2){
                    dataConfig.hasThreshold = true;
                }

                var font = "12px arial";
                var marginBreadCrumb = 10;
                var radius = Math.min(width, height - 70) / 2;
                var perRadiusFont = 0.0095;
                // Breadcrumb dimensions: width, height, spacing, width of tip/tail.
                var b = {
                    w: 75, h: 30, s: 3, t: 10
                };

                var bws = []; // contains the length of polygone

                // Mapping of step names to colors.
                var colors = {
                    "home": "#5687d1",
                    "product": "#7b615c",
                    "search": "#de783b",
                    "account": "#6ab975",
                    "other": "#a173d1",
                    "end": "#bbbbbb"
                };

                // Total size of all segments; we set this later, after loading the data.
                var totalSize = 0;

                var nodes;

                var json = this.dataInterface.getRawData(mstrmojo.models.template.DataInterface.ENUM_RAW_DATA_FORMAT.TREE, dataConfig);

                metricName = this.dataInterface.getColHeaders(0).getHeader(0).getName();

                var color = d3.scale.category20c(),
                    resolveColor = function (key) {
                        this.colorMap = this.colorMap || {};

                        if (key.values && key.values[0].threshold) {
                            return key.values[0].threshold.fillColor;
                        } else {
                            return (this.colorMap[key.name] = this.colorMap[key.name] || color(key.name));
                        }
                    };

                var vis = d3.select(this.domNode).select("#container");
                if(!vis.empty()){
                    //lets empty it out
                    emptyElm(document.getElementById(me.id));
                    vis = d3.select(this.domNode).select("#container");
                }
                if (vis.empty()) {
                    var sequence = d3.select(this.domNode).append("div")
                        .attr("id", "sequence");


                    var visHeight = height - sequence.node().getBoundingClientRect().height;


                    var explanationTop = (visHeight / 2) + sequence.node().getBoundingClientRect().height;
                    var explanationLeft = (width) / 2; //-sequence.node().getBoundingClientRect().height

                    var partText = 0.90;
                    var explanation = d3.select(this.domNode).append("div")
                        .style("top", explanationTop - radius * partText / 2 + "px")
                        .style("left", explanationLeft - radius * partText / 2 + "px")
                        .style("display", "table")
                        .style("width", radius * partText + "px")
                        .style("height", radius * partText + "px")
                        .style("line-heigh", radius * partText + "px")
                        .attr("id", "explanation");

                    var percentage = explanation
                        .append("span").attr("id", "percentage")
                        .style("display", "table-cell")
                        .style("vertical-align", "middle");


                    vis = d3.select(this.domNode).append("svg")
                        .attr("width", width)
                        .attr("height", visHeight)
                        .append("g")
                        .attr("id", "container")
                        .attr("transform", "translate(" + width / 2 + "," + visHeight / 2 + ")");

                    vis.select("#container").append("rect")
                        .attr("width", width)
                        .attr("height", visHeight)
                        .attr("id", "g-overlay")
                        .attr("transform", "translate(" + -width / 2 + "," + -visHeight / 2 + ")")
                        .style("fill", "transparent");


                }

               initializeBreadcrumbTrail();
              
                var posStartLabel = function (i) {
                    if (i == 0)
                        return 0;
                    else {
                        return bws[i - 1] + posStartLabel(i - 1);
                    }
                };

                var partition = d3.layout.partition()
                    .size([2 * Math.PI, radius * radius])
                    .value(function (d) {

                        return d.value;
                    });

                var arc = d3.svg.arc()
                    .startAngle(function (d) {
                        return d.x;
                    })
                    .endAngle(function (d) {
                        return d.x + d.dx;
                    })
                    .innerRadius(function (d) {
                        return Math.sqrt(d.y);
                    })
                    .outerRadius(function (d) {
                        return Math.sqrt(d.y + d.dy);
                    });


                createVisualization(json);
                
                // raise event for New Export Engine
                var me = this;                

                    me.raiseEvent({
                        name: 'renderFinished',
                        id: me.k
                    });


                // Main function to draw and set up the visualization, once we have the data.
                function createVisualization(json) {
                    // Basic setup of page elements.
                    drawLegend();
                    //var mouseclick = false;


                    // Bounding circle underneath the sunburst, to make it easier to detect
                    // when the mouse leaves the parent g.
                    vis.append("svg:circle")
                        .attr("r", radius)
                        .style("opacity", 0);

                    // For efficiency, filter nodes to keep only those large enough to see.
                    nodes = partition.nodes(json)
                        .filter(function (d) {
                            return (d.dx > 0.005); // 0.005 radians = 0.29 degrees
                        });


                    //  var path = vis.selectAll("path")
                    var path = vis.selectAll("path")
                        .data(nodes)
                        .enter().append("path")
                        .attr("display", function (d) {
                            return d.depth ? null : "none";
                        })
                        .attr("d", arc)
                        .attr("fill-rule", "evenodd")
                        .style("fill", function (d) {
                            return resolveColor(d);
                        })
                        .style("opacity", 1)
                        .on("mouseover", mouseover)
                        .on("click", mouseclick);

                    vis.on("mouseleave", mouseleave);


                    // Get total size of the tree = value of root node from partition.
                    if (path.node()) {
                        totalSize = path.node().__data__.value;
                    }
                };

                function deselect() {
                    me.clearSelections();
                    me.endSelections();
                    vis.selectAll('path')
                        .on('mouseover', mouseover)
                        .on('click', mouseclick);

                    mouseleave();

                };

                function mouseclick(d, i) {
                    // vis.on('mouseleave', mouseleave);
                    // vis.selectAll('path').on('mouseover', mouseover);
                    me.applySelection(nodes[i].attributeSelector);// Use the selector API when clicking on a bar

                    vis.on('mouseleave', null);
                    vis.selectAll("path")
                        .on('click', mouseoverclick)
                        .on('mouseover', null);


                };
                // Fade all but the current sequence, and show it in the breadcrumb trail.
                function mouseoverclick(d, i) {

                    me.applySelection(nodes[i].attributeSelector);// Use the selector API when clicking on a

                    mouseover(d);

                };

                // Fade all but the current sequence, and show it in the breadcrumb trail.
                function mouseover(d) {

                    var percentage = (100 * d.value / totalSize).toPrecision(3);
                    var percentageString = d.name + " " + metricName + " " + percentage + "%";

                    vis.select("#percentage")
                        .text(percentageString).style("font-size", (radius * perRadiusFont) + "em");

                    vis.select("#explanation")
                        .style("visibility", "");

                    var sequenceArray = getAncestors(d);
                    if (is10point2)
                        updateBreadcrumbs(sequenceArray, percentageString);
                    else {

                        var SB_PROPERTIES = mstrmojo.plugins.SequencesSunburst.SB_PROPERTIES,
                            hidePathOption = me.getProperty(SB_PROPERTIES.HIDE_PATH);
                        if (hidePathOption === 'false') {
                            updateBreadcrumbs(sequenceArray, percentageString);
                        }
                    }

                    // Fade all the segments.
                    vis.selectAll("path")
                        .style("opacity", 0.3);

                    // Then highlight only those that are an ancestor of the current segment.
                    vis.selectAll("path")
                        .filter(function (node) {
                            return (sequenceArray.indexOf(node) >= 0);
                        })
                        .style("opacity", 1);
                };

                //deselect
                d3.select(this.domNode).select('#g-overlay')
                    .on('click', deselect);
                d3.select(this.domNode).select('circle')
                    .on('click', deselect);
                d3.select(this.domNode).select('#sequence')
                    .on('click', deselect);


                // Restore everything to full opacity when moving off the visualization.
                function mouseleave() {


                    // Hide the breadcrumb trail
                    sequence.select("#trail")
                        .style("visibility", "hidden");

                    // Deactivate all segments during transition.
                    vis.selectAll("path").on("mouseover", null);

                    // Transition each segment to full opacity and then reactivate it.
                    vis.selectAll("path")
                        .transition()
                        .duration(500)
                        .style("opacity", 1)
                        .each("end", function () {
                            d3.select(this).on("mouseover", mouseover);
                        });

                    vis.select("#explanation")
                        .style("visibility", "hidden");
                };

                // Given a node in a partition layout, return an array of all of its ancestor
                // nodes, highest first, but excluding the root.
                function getAncestors(node) {
                    var path = [];
                    var current = node;
                    while (current.parent) {
                        path.unshift(current);
                        current = current.parent;
                    }
                    return path;
                };

                function initializeBreadcrumbTrail() {
                    // Add the svg area.
                    var trail = sequence.append("svg")
                        .attr("width", width)
                        .attr("height", 50)
                        .attr("id", "trail");
                    // Add the label at the end, for the percentage.
                    trail.append("text")
                        .attr("id", "endlabel")
                        .style("fill", "#000");
                    
                };

                // Generate a string that describes the points of a breadcrumb polygon.
                function breadcrumbPoints(d, i) {
                    var points = [];

                    //Adapt the width of the label polygon with the size of the  label string
                    var labelN = d.name;

                    function getTextWidth(text, ft) {
                        // re-use canvas object for better performance
                        var canvas = getTextWidth.canvas || (getTextWidth.canvas = document.createElement("canvas"));
                        var context = canvas.getContext("2d");
                        context.font = ft;
                        var metrics = context.measureText(text);
                        return metrics.width;
                    };

                    var wl = getTextWidth(labelN, font);

                    b.w = wl + marginBreadCrumb * 2 + b.t;

                    bws[i] = b.w;

                    points.push("0,0");
                    points.push(b.w + ",0");
                    points.push(b.w + b.t + "," + (b.h / 2));
                    points.push(b.w + "," + b.h);
                    points.push("0," + b.h);
                    if (i > 0) { // Leftmost breadcrumb; don't include 6th vertex.
                        points.push(b.t + "," + (b.h / 2));
                    }
                    return points.join(" ");
                };

                // Update the breadcrumb trail to show the current sequence and percentage.
                function updateBreadcrumbs(nodeArray, percentageString) {

                    // Data join; key function combines name and depth (= position in sequence).
                    var g = sequence.select("#trail")
                        .selectAll("g")
                        .data(nodeArray, function (d) {
                            return d.name + d.depth;
                        });

                    // Add breadcrumb and label for entering nodes.
                    var entering = g.enter().append("g");


                    entering.append("polygon")
                        .attr("points", breadcrumbPoints)
                        .style("fill", function (d) {
                            return resolveColor(d);
                        });

                    entering.append("text")
                        .attr("x", function (d, i) {
                            return b.t + marginBreadCrumb;
                        })
                        .attr("y", b.h / 2)
                        .attr("dy", "0.35em")
                        .attr("text-anchor", "left")
                        .text(function (d) {
                            return d.name;
                        });


                    // Set position for entering and updating nodes.
                    g.attr("transform", function (d, i) {
                        return "translate(" + posStartLabel(i) + ", 0)";
                    });


                    // Remove exiting nodes.
                    g.exit().remove();

                    // Now move and update the percentage at the end.
                    sequence.select("#trail").select("#endlabel")
                        .attr("x", function () {
                            var x = posStartLabel(nodeArray.length) + b.t + marginBreadCrumb;
                            // if (isNaN(x))

                            return x;
                        })
                        .attr("y", b.h / 2)
                        .attr("dy", "0.35em")
                        .attr("text-anchor", "left")
                        .text(percentageString);

                    // Make the breadcrumb trail visible, if it's hidden.
                    sequence.select("#trail")
                        .style("visibility", "");

                };

                function emptyElm(elm){
                    while (elm.firstChild) {
                        elm.removeChild(elm.firstChild);
                    }
                }
                function drawLegend() {

                    // Dimensions of legend item: width, height, spacing, radius of rounded rect.
                    var li = {
                        w: 75, h: 30, s: 3, r: 3
                    };

                    var legend = vis.select("#legend").append("svg")
                        .attr("width", li.w)
                        .attr("height", d3.keys(colors).length * (li.h + li.s));

                    var g = legend.selectAll("g")
                        .data(d3.entries(colors))
                        .enter().append("g")
                        .attr("transform", function (d, i) {
                            return "translate(0," + i * (li.h + li.s) + ")";
                        });

                    g.append("rect")
                        .attr("rx", li.r)
                        .attr("ry", li.r)
                        .attr("width", li.w)
                        .attr("height", li.h)
                        .style("fill", function (d) {
                            return d.value;
                        });

                    g.append("text")
                        .attr("x", li.w / 2)
                        .attr("y", li.h / 2)
                        .attr("dy", "0.35em")
                        .attr("text-anchor", "middle")
                        .text(function (d) {
                            return d.key;
                        });
                };


                // Take a 2-column CSV and transform it into a hierarchical structure suitable
                // for a partition layout. The first column is a sequence of step names, from
                // root to leaf, separated by hyphens. The second column is a count of how
                // often that sequence occurred.
                function buildHierarchy(csv) {
                    var root = {"name": "root", "children": []};
                    for (var i = 0; i < csv.length; i++) {
                        var sequence = csv[i][0];
                        var size = +csv[i][1];
                        if (isNaN(size)) { // e.g. if this is a header row
                            continue;
                        }
                        var parts = sequence.split("-");
                        var currentNode = root;
                        for (var j = 0; j < parts.length; j++) {
                            var children = currentNode["children"];
                            var nodeName = parts[j];
                            var childNode;
                            if (j + 1 < parts.length) {
                                // Not yet at the end of the sequence; move down the tree.
                                var foundChild = false;
                                for (var k = 0; k < children.length; k++) {
                                    if (children[k]["name"] == nodeName) {
                                        childNode = children[k];
                                        foundChild = true;
                                        break;
                                    }
                                }
                                // If we don't already have a child node for this branch, create it.
                                if (!foundChild) {
                                    childNode = {"name": nodeName, "children": []};
                                    children.push(childNode);
                                }
                                currentNode = childNode;
                            } else {
                                // Reached the end of the sequence; create a leaf node.
                                childNode = {"name": nodeName, "size": size};
                                children.push(childNode);
                            }
                        }
                    }
                    return root;
                };


            }
        })
}());
//@ sourceURL=SequencesSunburst.js