import 'package:polymer/polymer.dart';
import 'package:tsp/tsp.dart';

import 'component/tour_drawer.dart';


@CustomTag('main-app')
class MainApp extends PolymerElement {
  Grid grid;
  TourDrawer drawer;
  
  @published int width = 300;
  @published int height = 300;
  
  @observable int noOfNodes = 3;
  @observable int possibilities = 0;
  
  @observable String pointString;
  
  MainApp.created() : super.created();
  
  void attached() {
    refresh();
  }
  
  void refresh() {
    grid = new Grid.random(noOfNodes, new ViewPort.values(0, 300, 0, 300));
    drawer = $["drawer"];
    drawer.viewPort = grid.viewPort;
    drawer.drawTour(Tour.bestTour(grid.nodes));
    pointString = grid.nodes.map((p) => "[${p.x}, ${p.y}]").join(", ");
    possibilities = faculty(grid.nodes.length);
  }
}

int faculty(int n) {
  if (n < 0) throw new ArgumentError.value(n, "n", "Must not be < 0");
  if (0 == n || 1 == n) return 1;
  return n * faculty(n - 1);
}

