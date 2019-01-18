/*
annotate.js
Copyright (c) 2015, Djaodjin Inc.
MIT License
*/

/*global document jQuery Image:true*/

(function ($) {
   "use strict";

   var CANVAS_BORDER_THICKNESS = 7, CANVAS_TOOLBAR_HEIGHT = 40, 
       NOTE_DEF_WIDTH = 120, NOTE_DEF_HEIGHT = 80, NOTE_MIN_WIDTH = 45, NOTE_MIN_HEIGHT = 30;

   function Annotate(el, options, closeFunc, saveFunc, printFunc, emailFunc, tooltipFunc, host){
	  this.closeFunc = closeFunc;
	  this.saveFunc = saveFunc;
	  this.printFunc = printFunc;
	  this.emailFunc = emailFunc;
	  this.tooltipFunc = tooltipFunc;
	  this.host = host;
      this.options = options;
      this.$el = $(el);
      this.clicked = false;
      this.fromx = null;
      this.fromy = null;
      this.fromxText = null;
      this.fromyText = null;
      this.maxWidth = null;
      this.maxHeight = null;
      this.tox = null;
      this.toy = null;
      this.points = [];
      this.storedUndo = [];
      this.storedElement = [];
      this.tempUndo = [];
      this.tempElement = [];
      this.img = null;
      this.init();
   }

   Annotate.prototype = {
      init: function () {
         var self = this;
         $("head").append('<link rel="stylesheet" href="../javascript/libraries/annotate.css" type="text/css" />');
         self.$el.css({cursor: "crosshair"});
         self.$el.append($("<canvas id=\"baseLayer\"></canvas>"));
         self.baseCanvas = document.getElementById("baseLayer");
         self.baseContext = self.baseCanvas.getContext("2d");
         self.baseContext.lineJoin = "round";

         var classPosition1 = "btn-group";
         var classPosition2 = "";

         if( self.options.position === "left"
             || self.options.position === "right" ){
             classPosition1 = "btn-group-vertical";
             classPosition2 = "btn-block";
         }

         if (self.options.bootstrap){
            /*jshint multistr: true */
        	 $("#annotate_tools").append(
               "<button id=\"undoaction\" title=\"Undo the last annotation\""
               + " class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar undo\"></i></button>"
               + "<button type=\"button\" id=\"redoaction\""
               + " title=\"Redo the last undone annotation\""
               + "class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar redo\"></i></button>"
               + "<div class=\"" + classPosition1 + "\" data-toggle=\"buttons\">"
               + "<label class=\"btn btn-primary active\">"
               + "<input type=\"radio\" name=\"tool_option\" id=\"rectangle\""
               + " data-toggle=\"tooltip\" data-placement=\"top\""
               + " title=\"Draw an rectangle\"><i class=\"mstrmojo-Annotations-toolbar rectangle\"></i>"
               + "</label>"
               + "<label class=\"btn btn-primary\">"
               + "<input type=\"radio\" name=\"tool_option\" id=\"arrow\""
               + " data-toggle=\"tooltip\" data-placement=\"top\" title=\"Draw an arrow\">"
               + "<i class=\"mstrmojo-Annotations-toolbar arrow\"></i>"
               + "</label>"
               + "<label class=\"btn btn-primary\">"
               + "<input type=\"radio\" name=\"tool_option\" id=\"text\""
               + " data-toggle=\"tooltip\" data-placement=\"top\" title=\"Write some text\">"
               + "<i class=\"mstrmojo-Annotations-toolbar text\"></i>"
               + "</label>"
               + "<label class=\"btn btn-primary\">"
               + "<input type=\"radio\" name=\"tool_option\" id=\"pen\""
               + " data-toggle=\"tooltip\" data-placement=\"top\" title=\"Pen Tool\">"
               + "<i class=\"mstrmojo-Annotations-toolbar pen\"></i>"
               + "</label>"
               + "</div>"
               + "<button type=\"button\" id=\"saveannotations\" title=\"Save annotations\""
               + " class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar save\"></i></button>"
               + "<button type=\"button\" id=\"printannotations\" title=\"Print annotations\""
               + "class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar print\"></i></button>"
               + "<button type=\"button\" id=\"emailannotations\" title=\"Email annotations\""
               + "class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar email\"></i></button>"
               + "<button type=\"button\" id=\"exitannotations\" title=\"Exit annotations mode\""
               + "class=\"btn btn-primary " + classPosition2 + "\">"
               + "<i class=\"mstrmojo-Annotations-toolbar close\"></i></button>"
               + "</div>");
         }else{
        	 $("#annotate_tools").append(
               '<button id="undoaction" title="' + self.tooltipFunc("Undo") + '" class="icon-undo"></button>'
               + '<button id="redoaction" title="' + self.tooltipFunc("Redo") + '" class="icon-redo"></button>'
               + '<button class="annotations-divider"></button>'
               + '<input type="radio" name="tool_option" id="text" class="radio_item" value="" checked>'
               + '<label class="label_item" for="text" title="' + self.tooltipFunc("Comment") + '"><div class="icon-text"></div></label>'
               + '<input type="radio" name="tool_option" id="rectangle" class="radio_item" value="">'
               + '<label class="label_item" for="rectangle" title="' + self.tooltipFunc("Rectangle") + '"><div class="icon-rectangle"></div></label>'
               + '<input type="radio" name="tool_option" id="arrow" class="radio_item" value="">'
               + '<label class="label_item" for="arrow" title="' + self.tooltipFunc("Arrow") + '"><div class="icon-arrow"></div></label>'
               + '<input type="radio" name="tool_option" id="pen" class="radio_item" value="">'
               + '<label class="label_item" for="pen" title="' + self.tooltipFunc("Free Form") + '"><div class="icon-free-form"></div></label>'
               + '<button class="annotations-divider"></button>'
               + '<button id="saveannotations" title="' + self.tooltipFunc("Export Snapshot") + '" class="icon-save-screenshot" disabled="true"></button>'
               + '<button id="printannotations" title="' + self.tooltipFunc("Print Snapshot") + '" class="icon-print-screenshot" disabled="true"></button>'
               + '<button id="emailannotations" title="' + self.tooltipFunc("Email Snapshot") + '" class="icon-email-screenshot" disabled="true"></button>'
               + '<button id="exitannotations" title="' + self.tooltipFunc("Exit Annotation Mode") + '" class="icon-exit-annotation-mode"></button>'
               + '</div>');
         }

         $("#canvasOverlay").addClass("canvasOverlay");
         $("#annotate_tools").addClass("annotate_tools");

         var canvasPosition = self.$el.offset();
         if (self.options.position === "top" || (self.options.position !== "top" && !self.options.bootstrap)){
            $("#annotate_tools").css({"top": 0, "width": self.options.width + 1});
         }else{
            if (self.options.position === "left" && self.options.bootstrap){
               $("#annotate_tools").css({"top": canvasPosition.top - 35, "left": canvasPosition.left - 20});
            }else if (self.options.position === "right" && self.options.bootstrap){
               $("#annotate_tools").css({"top": canvasPosition.top - 35, "left": canvasPosition.left + self.baseCanvas.width + 20});
            }else if (self.options.position === "bottom" && self.options.bootstrap){
               $("#annotate_tools").css({"top": canvasPosition.top + self.baseCanvas.height + 35, "left": canvasPosition.left});
            }
         }

         var pathbar = self.host.pathbarNode;
         var pathbarHeight = parseInt(pathbar.style.height);
         if (pathbarHeight > 0) {
             $("#annotate_tools")[0].style.top = pathbarHeight + "px";
         }

         var inputText = document.getElementById("input_text");
         if (!inputText) {
	         $("body").append("<textarea id=\"input_text\" class=\"input_text\"></textarea>");
         }

         if (self.options.img){
             self.img = new Image();
             self.img.src = self.options.img;
             self.img.onload = function () {
                if (!(self.options.width && self.options.height)){
                   self.options.width = this.width;
                   self.options.height = this.height;
                }
                self.baseCanvas.width = self.options.width;
                self.baseCanvas.height = self.options.height;
                self.baseCanvas.style.width = self.options.width + "px";
                self.baseCanvas.style.height = self.options.height + "px";
                self.baseContext.drawImage(self.img, 0, 0, self.options.width, self.options.height);

                self.drawCanvasBorder(self.baseContext);
             };
         }else{
             if (!self.options.width && !self.options.height){
                self.options.width = 640;
                self.options.height = 480;
             }
             self.baseCanvas.width = self.options.width;
             self.baseCanvas.height = self.options.height;
         }

         $(document).on("change", "input[name=\"tool_option\"]", function(){
            self.selectTool($(this));
         });
         $(document).on("click", "#redoaction", function(event){
        	self.commitIncompleteAnnotations();
            self.redoaction(event);
         });
         $(document).on("click", "#undoaction", function(event){
        	self.commitIncompleteAnnotations();
            self.undoaction(event);
         });
         $(document).on("click", "#exitannotations", function(event){
        	self.preExit();
        	self.closeFunc();
         });
         $(document).on("click", "#saveannotations", function(event){
        	self.toolbarAction("save");
         });
         $(document).on("click", "#printannotations", function(event){
         	self.toolbarAction("print");
         });
         $(document).on("click", "#emailannotations", function(event){
         	self.toolbarAction("email");
         });
         self.$el.on("mousedown", function(event){
         	self.mousedown(event);
         });
         self.$el.on("mouseup", function(event){
        	event.preventDefault();
         	self.mouseup(event);
         });
         self.$el.on("mousemove", function(event){
         	self.mousemove(event);
         });
         self.$el.on("dblclick", function(event){
          	self.doubleclick(event);
         });
         $(window).on("mouseup", function(event){
           	self.mouseup(event);
         });
         $(window).on("resize", function(event){
            self.windowResize(event);
         });
         $(document).on("mousemove", "#input_text", function(e) {
            // Change resize cursor on textarea
            var iconSize = 18,
            a = $(this).offset().top + $(this).outerHeight() - iconSize,
            b = $(this).offset().left + $(this).outerWidth() - iconSize;
            $(this).css({
               cursor: e.pageY > a && e.pageX > b && e.pageY - a < iconSize - 1 && e.pageX - b < iconSize - 1 ? 'nwse-resize' : ''
            });
         });
         self.checkUndoRedo();
      },
      
      clearCanvasBorder: function(context) {
    	  context.clearRect(0, 0, CANVAS_BORDER_THICKNESS, this.options.height); // top
    	  context.clearRect(0, 0, this.options.width, CANVAS_BORDER_THICKNESS); // left
    	  context.clearRect(0, this.options.height - CANVAS_BORDER_THICKNESS, this.options.width, CANVAS_BORDER_THICKNESS); // bottom
    	  context.clearRect(this.options.width - CANVAS_BORDER_THICKNESS, 0, CANVAS_BORDER_THICKNESS, this.options.height); // right
      },

      drawCanvasBorder: function(context) {
    	  context.beginPath();
    	  context.rect(0, 0, this.options.width, this.options.height);
    	  context.lineWidth = CANVAS_BORDER_THICKNESS;
    	  context.strokeStyle = this.options.borderColor;
    	  context.stroke();
      },

      checkUndoRedo: function(){
         var self = this;
         if (self.storedUndo.length === 0){
            $("#redoaction").attr("disabled", true);
         }else{
            $("#redoaction").attr("disabled", false);
         }
         if (self.storedElement.length === 0){
            $("#undoaction").attr("disabled", true);
            $("#saveannotations").attr("disabled", true);
            $("#printannotations").attr("disabled", true);
            $("#emailannotations").attr("disabled", true);
         }else{
            $("#undoaction").attr("disabled", false);
            $("#saveannotations").attr("disabled", false);
            $("#printannotations").attr("disabled", false);
            $("#emailannotations").attr("disabled", false);
         }
      },

      tempundoaction: function(event){
          event.preventDefault();
          var self = this;
          if (self.tempElement.length > 0) {
        	  self.tempElement.pop();
              self.redraw();
          }
      },

      undoaction: function(event){
         event.preventDefault();
         var self = this;
         self.storedUndo.push(self.storedElement[self.storedElement.length - 1]);
         self.storedElement.pop();
         self.checkUndoRedo();
         self.redraw();
      },

      redoaction: function(event){
         event.preventDefault();
         var self = this;
         self.storedElement.push(self.storedUndo[self.storedUndo.length - 1]);
         self.storedUndo.pop();
         self.checkUndoRedo();
         self.redraw();
      },

      redraw: function(){
         var self = this;
         self.baseCanvas.width = self.baseCanvas.width;
         if (self.options.img){
           self.baseContext.drawImage(self.img,  0, 0, self.options.width, self.options.height);
         }
         if (self.storedElement.length === 0) {
        	 self.drawCanvasBorder(self.baseContext);
            return;
         }
         // clear each stored line
         for (var i = 0; i < self.storedElement.length; i++) {
            var element = self.storedElement[i];
            if (element.type === "rectangle"){
               self.drawRectangle(self.baseContext, element.fromx, element.fromy, element.tox, element.toy);
            }else if (element.type === "arrow"){
               self.drawArrow(self.baseContext, element.fromx, element.fromy, element.tox, element.toy);
            }else if (element.type === "pen"){
                for(var b = 0; b < element.points.length - 1; b++){
                   var fromx = element.points[b][0];
                   var fromy = element.points[b][1];
                   var tox = element.points[b + 1][0];
                   var toy = element.points[b + 1][1];
                   self.drawPen(self.baseContext, fromx, fromy, tox, toy);
               }
            }else if (element.type === "text"){
               self.drawText(self.baseContext, element.text, element.fromx, element.fromy, element.maxwidth, element.maxheight);
            }
         }

         self.drawCanvasBorder(self.baseContext);
      },

      commitIncompleteAnnotations: function() {
    	  var self = this;
    	  if ($("#input_text").is(":visible")){
              var text = $("#input_text").val();
              $("#input_text").val("").hide();
              if( text ) {
                 self.storedElement.push({
                     type: "text",
                     text: text,
                     fromx: self.fromx,
                     fromy: self.fromy,
                     maxwidth: parseInt($("#input_text")[0].style.width) || self.tox || NOTE_DEF_WIDTH,
                     maxheight: parseInt($("#input_text")[0].style.height) || self.toy || NOTE_DEF_HEIGHT});
                 if (self.storedUndo.length > 0){
                    self.storedUndo = [];
                 }
              }
              self.redraw();
          } 
      },
      
      preExit: function(){
    	  var self = this;
    	  self.commitIncompleteAnnotations();
    	  $(document).off("change", "input[name=\"tool_option\"]");
    	  $(document).off("click", "#redoaction");
          $(document).off("click", "#undoaction");
          $(document).off("click", "#exitannotations");
          $(document).off("click", "#saveannotations");
          $(document).off("click", "#printannotations");
          $(document).off("click", "#emailannotations");
          self.$el.off("mousedown");
          self.$el.off("mouseup");
          self.$el.off("mousemove");
          self.$el.off("doubleclick");
          $(window).off("mouseup");
    	  while (self.storedElement.length > 0) {
    		  self.storedElement.pop();
    	  }
      },

      drawRectangle: function(context, x, y, w, h){
         var self = this;
         context.save();
         context.beginPath();
         context.rect(x, y, w, h);
         context.fillStyle = "transparent";
         self.setShadow(context);
         context.fill();
         context.lineWidth = self.options.lineWidth;
         context.strokeStyle = self.options.lineColor;
         context.stroke();
         context.restore();
      },

      drawArrow: function(context, x, y, w, h){
         var self = this;
         var angle = Math.atan2(h - y, w - x);
         context.save();
         context.beginPath();
         self.setShadow(context);
         context.lineWidth = self.options.lineWidth;
         context.moveTo(x, y);
         context.lineTo(w, h);
         context.lineTo(w - 10 * Math.cos(angle - Math.PI / 6), h - 10 * Math.sin(angle - Math.PI / 6));
         context.moveTo(w, h);
         context.lineTo(w - 10 * Math.cos(angle + Math.PI / 6), h - 10 * Math.sin(angle + Math.PI / 6));
         context.strokeStyle = self.options.lineColor;
         context.stroke();
         context.restore();
      },

      drawPen: function(context, fromx, fromy, tox, toy){
         var self = this;
         context.save();
         context.beginPath();
         self.setShadow(context);
         context.lineWidth = self.options.lineWidth;
         context.moveTo(fromx, fromy);
         context.lineTo(tox, toy);
         context.strokeStyle = self.options.lineColor;
         context.stroke();
         context.restore();
      },

      wrapText: function(context, text, x, y, maxWidth, maxHeight, lineHeight) {
          var lines = text.split("\n"), lineCount = 1;
          for (var i = 0; i < lines.length; i++) {
             var words = lines[i].split(" ");
             var line = "";
             for(var n = 0; n < words.length; n++) {

                var firstCheck = true;
                // For each word, check if length exceeds maxWidth. If so, chop it.
                while(context.measureText(words[n]).width >= maxWidth) {
                   var tmp = words[n];
                   // Replace the long word with its substr(0, len-1).
                   words[n] = tmp.slice(0, -1);
                   if (words.length > 1 && n < words.length) {
                      // Don't append the first word succeeding a long word to the 
                      // latter half of the chopped long word. Instead, insert the 
                      // last letter of long word as a new word in between.
                      if (firstCheck) {
                         words.splice(n+1, 0, tmp.slice(-1));
                         firstCheck = false;
                      } else {
                         // Attach the last letter of long word to the next word. 
                       	 words[n+1] = tmp.slice(-1) + words[n+1];
                      }
                   } else {
                      words.push(tmp.slice(-1));
                      firstCheck = false;
                   }
                }

                var testLine = line + words[n] + " ";
                var metrics = context.measureText(testLine);
                var testWidth = metrics.width;
                if (testWidth > maxWidth && n > 0) {
                   context.fillText(line, x, y);
                   line = words[n] + " ";
                   y += lineHeight;
                   lineCount++;
                }
                else {
                   line = testLine;
                }

                // Full height of note reached - truncate remaining text.
                if (lineCount * lineHeight > maxHeight) {
                   return;
                }
             }

             context.fillText(line, x, y);
             y += lineHeight;
             lineCount++;

             // Full height of note reached - truncate remaining text.
             if (lineCount * lineHeight > maxHeight) {
                return;
             }
          }
      },

      drawText: function(context, text, x, y, maxWidth, maxHeight){
         var self = this;

         context.font = self.options.fontSize + " arial";
         context.textBaseline = "top";

         context.save();
         context.beginPath();
         context.rect(x, y, maxWidth + 6, maxHeight + 6);
         context.fillStyle = self.options.noteColor;
         self.setShadow(context);
         context.fill();
         context.restore();
         context.fillStyle = self.options.textColor;
         self.wrapText(context, text, x + 3, y + 6, maxWidth + 3, maxHeight + 6, 22);
         context.lineWidth = 1;
         context.strokeStyle = "#cccccc"; //border
         context.stroke();
      },

      // Events
      selectTool: function(element) {
         var self = this;
         self.options.type = element.attr("id");
         self.commitIncompleteAnnotations();
      },

      setShadow: function(context) {
          context.shadowColor = "rgba(153, 153, 153, 0.75)";
          context.shadowBlur = 2;
          context.shadowOffsetX = 2;
          context.shadowOffsetY = 2;
      },

      mousedown: function(event){
         var self = this;
         self.clicked = true;
         if (self.tempElement.length > 0){
             self.tempElement = [];
         }
         var offset = self.$el.offset();
         if ($("#input_text").is(":visible")){
            var text = $("#input_text").val();
            $("#input_text").val("").hide();
            if (text !== "" ){
            	self.maxWidth = parseInt($("#input_text")[0].style.width) || self.tox || NOTE_DEF_WIDTH;
            	self.maxHeight = parseInt($("#input_text")[0].style.height) || self.toy || NOTE_DEF_HEIGHT;
                self.drawText(self.baseContext, text, self.fromxText - offset.left, self.fromyText - offset.top, self.maxWidth, self.maxHeight);
                self.storedElement.push({
                     type: "text",
                     text: text,
                     fromx: self.fromxText - offset.left,
                     fromy: self.fromyText - offset.top,
                     maxwidth: self.maxWidth,
                     maxheight: self.maxHeight});
               if (self.storedUndo.length > 0){
                  self.storedUndo = [];
               }
               self.checkUndoRedo();
            }
         }
         self.tox = null;
         self.toy = null;
         self.points = [];

         self.fromx = event.pageX - offset.left;
         self.fromy = event.pageY - offset.top;
         self.fromxText = event.pageX;
         self.fromyText = event.pageY;
         if (self.options.type === "text"){
            $("#input_text").css({
                  left: self.fromxText + 2, top: self.fromyText,
                  width: NOTE_MIN_WIDTH, height: NOTE_MIN_HEIGHT}).hide();
         }
         if (self.options.type === "pen"){
            self.points.push([self.fromx, self.fromy]);
         }
      },

      mouseup: function(event){
         var self = this;
         if (!self.clicked) { return; }
         self.clicked = false;
         if (self.tempElement.length > 0){
             self.tempElement = [];
         }
         if(self.toy !== null && self.tox !== null) {
            if (self.options.type === "rectangle") {
               self.storedElement.push({type: "rectangle",
                   fromx: self.fromx, fromy: self.fromy,
                   tox: self.tox, toy: self.toy});
            } else if (self.options.type === "arrow"){
               self.storedElement.push({type: "arrow",
                   fromx: self.fromx, fromy: self.fromy,
                   tox: self.tox, toy: self.toy});
            } else if (self.options.type === "text"){
               self.tox = Math.max(self.tox, NOTE_MIN_WIDTH);
               self.toy = Math.max(self.toy, NOTE_MIN_HEIGHT);

               var canvasWidth = self.$el.width(), canvasHeight = self.$el.height();
               var maxNoteWidth = canvasWidth - self.fromx - 10;
               var maxNoteHeight = canvasHeight - self.fromy - 10;

               $("#input_text").css({
                  left: self.fromxText, top: self.fromyText,
                  width: self.tox, height: self.toy,
                  maxWidth: maxNoteWidth, maxHeight: maxNoteHeight
               });
               if ($("#input_text").is(":hidden")) {
                  $("#input_text").show();
               }
            } else if (self.options.type === "pen"){
               self.storedElement.push({type: "pen",
                   points: self.points});

		           for(var i = 0; i < self.points.length - 1; i++){
		               self.fromx = self.points[i][0];
		               self.fromy = self.points[i][1];
		               self.tox = self.points[i + 1][0];
		               self.toy = self.points[i + 1][1];
		               self.drawPen(self.baseContext, self.fromx, self.fromy, self.tox, self.toy);
		           }
               self.points = [];
            }
            if (self.storedUndo.length > 0){
                  self.storedUndo = [];
            }
            self.checkUndoRedo();
            self.redraw();
         }
      },

      mousemove: function(event){
         var self = this;
         if (!self.clicked) { return; }
         var offset = self.$el.offset();
         if (self.options.type === "rectangle"){
            self.tox = event.pageX - offset.left - self.fromx;
            self.toy = event.pageY - offset.top - self.fromy;
            
            self.tempundoaction(event);
            self.drawRectangle(self.baseContext, self.fromx, self.fromy, self.tox, self.toy);
            
            self.tempElement.push({type: "rectangle",
                fromx: self.fromx, fromy: self.fromy,
                tox: self.tox, toy: self.toy});
            
         }else if (self.options.type === "arrow"){
            self.tox = event.pageX - offset.left;
            self.toy = event.pageY - offset.top;
            
            self.tempundoaction(event);
            self.drawArrow(self.baseContext, self.fromx, self.fromy, self.tox, self.toy);
            
            self.tempElement.push({type: "arrow",
                fromx: self.fromx, fromy: self.fromy,
                tox: self.tox, toy: self.toy});

         }else if (self.options.type === "pen"){
            self.tox = event.pageX - offset.left;
            self.toy = event.pageY - offset.top;
            self.fromx = self.points[self.points.length - 1][0];
            self.fromy = self.points[self.points.length - 1][1];
            self.points.push([self.tox, self.toy]);
            self.drawPen(self.baseContext, self.fromx, self.fromy, self.tox, self.toy);
         }else if (self.options.type === "text"){
            self.tox = event.pageX - self.fromxText - 12;
            self.toy = event.pageY - self.fromyText + 2;

            var canvasWidth = self.$el.width(), canvasHeight = self.$el.height();
            var maxNoteWidth = canvasWidth - self.fromx - 10;
            var maxNoteHeight = canvasHeight - self.fromy - 10;

            $("#input_text").css({
               left: self.fromxText, top: self.fromyText,
               width: self.tox, height: self.toy,
               maxWidth: maxNoteWidth, maxHeight: maxNoteHeight
            });
            if ($("#input_text").is(":hidden")) {
               $("#input_text").show();
            }
         }
      },

      doubleclick: function(event) {
    	  var self = this;
    	  self.clicked = false;
    	  if (self.options.type === "text"){
              var canvasWidth = self.$el.width(), canvasHeight = self.$el.height(), setWidth = NOTE_DEF_WIDTH, setHeight = NOTE_DEF_HEIGHT, 
                  setLeft = self.fromxText, setTop = self.fromyText;

              if (self.fromx + setWidth >= canvasWidth) {
           	      setLeft -= setWidth; // No more place on right, so shift note to left. -SG
           	      self.fromx -= setWidth;
           	      self.fromxText = setLeft;
              }
              if (self.fromy + setHeight >= canvasHeight) {
           	      setTop -= setHeight; // No more place on bottom, so shift note to top. -SG
           	      self.fromy -= setHeight;
           	      self.fromyText = setTop;
              }

              var maxNoteWidth = canvasWidth - self.fromx - 10;
              var maxNoteHeight = canvasHeight - self.fromy - 10;

              $("#input_text").css({
                  left: setLeft, top: setTop,
                  width: setWidth, height: setHeight,
                  maxWidth: maxNoteWidth, maxHeight: maxNoteHeight
              });
              if ($("#input_text").is(":hidden")) {
                 $("#input_text").show();
              }
	          self.checkUndoRedo();
	          self.redraw();
    	  }
      },

      toolbarAction: function(action) {
          var self = this;
          var actionDictionary = {
              save: self.saveFunc,
              print: self.printFunc,
              email: self.emailFunc
    	  };

          self.commitIncompleteAnnotations();
      	  self.clearCanvasBorder(self.baseContext);
      	  actionDictionary[action].call(this, self.baseCanvas);
      	  self.drawCanvasBorder(self.baseContext);
      },

      windowResize: function(event) {
    	  $("#annotate_tools").css({"top": 0, "width": Math.min($(window).width(), this.options.width) + 1});
      }
   };

   $.fn.annotate = function(options, closeFunc, saveFunc, printFunc, emailFunc, tooltipFunc, host) {
      var opts = $.extend( {}, $.fn.annotate.defaults, options );
      return new Annotate($(this), opts, closeFunc, saveFunc, printFunc, emailFunc, tooltipFunc, host);
   };

   $.fn.annotate.defaults = {
      width: null,
      height: null,
      img: null,
      color: "red",
      type: "text",
      lineWidth: 1.5,
      fontSize: "15px",
      bootstrap: false,
      position: "top"
   };

})(jQuery);