import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bar_row/sales_series.dart';
import 'package:flutter/material.dart';
import './chartdata.dart';

class SalesChart extends StatelessWidget {
  final List<ChartData> data;

  SalesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: "Sales",
        data: data,
        domainFn: (ChartData series, _) => series.year,
        measureFn: (ChartData series, _) => series.sales,
        //colorFn: (ChartData series, _) => series.barColor
      )
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                " Benetton Sales by year",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
                
              ),
              Text(
                "Year",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
