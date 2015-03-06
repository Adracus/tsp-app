library tsp_app.component.tour_drawer;

import 'dart:html';

import 'package:tsp/tsp.dart';
import 'package:polymer/polymer.dart';

import '../model/color.dart';

@CustomTag("tour-drawer")
class TourDrawer extends PolymerElement {
  @published int width;
  @published int height;
  ViewPort viewPort;
  
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  TourDrawer.created() : super.created();
  
  void attached() {
    super.attached();
    
    canvas = $["canvas"];
    ctx = canvas.getContext("2d");
  }
  
  void drawTour(Tour tour) {
    clear();
    setColor(Color.BLACK);
    tour.edges.forEach(drawEdge);
  }
  
  Point interpolatePoint(Point p) {
    return new Point(p.x * xStretch, p.y * yStretch);
  }
  
  void drawEdge(Edge edge) => drawLine(edge.start, edge.end);
  
  void drawLine(Point p1, Point p2) {
    ctx.beginPath();
    ctx.moveTo(p1.x, p1.y);
    ctx.lineTo(p2.x, p2.y);
    ctx.stroke();
  }
  
  void clear([Color color = Color.WHITE]) {
    setColor(color);
    ctx.fillRect(0, 0, width, height);
  }
  
  double get xStretch => width / viewPort.xDistance;
  double get yStretch => height / viewPort.yDistance;
  
  void setColor(Color color) {
    ctx.setFillColorRgb(color.r, color.g, color.b, color.a);
  }
}