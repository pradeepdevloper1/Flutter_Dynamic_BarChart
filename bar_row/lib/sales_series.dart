import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class SalesSeries {
  final String year;
  final int sales;
  final charts.Color barColor;

  SalesSeries(
      {@required this.year,
      @required this.sales,
       this.barColor
      });
}
