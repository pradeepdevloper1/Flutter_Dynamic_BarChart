import 'package:bar_row/sales_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bar_row/sales_series.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './chartdata.dart';
import 'dart:convert';
import 'dart:async';

class HomePage extends StatelessWidget {
  final List<ChartData> chartdata = [];
  Future getAll() async {
    var data =
        await http.get("http://192.168.2.119:8053/api/barchart/GetChartData");

    var jsonData = json.decode(data.body);
    for (var u in jsonData) {
      chartdata.add(ChartData(u['id'], u['year'], u['sales']));
    }

    return chartdata;
  }

  // final List<SalesSeries> data = [
  //   SalesSeries(
  //     year: "2015",
  //     sales: 100000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  //   SalesSeries(
  //     year: "2015",
  //     sales: 100000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  //   SalesSeries(
  //     year: "2016",
  //     sales: 150700,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.red),
  //   ),
  //   SalesSeries(
  //     year: "2017",
  //     sales: 278000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   SalesSeries(
  //     year: "2018",
  //     sales: 343000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  //   SalesSeries(
  //     year: "2019",
  //     sales: 450000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.yellowAccent),
  //   ),
  //   SalesSeries(
  //     year: "2020",
  //     sales: 529000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.blue),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Benetton Sales Report "),
        ),
        body: Center(
          child: FutureBuilder(
              future: getAll(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                      child: Center(
                    child: Text("Loading..."),
                  ));
                } else {
                  return SalesChart(
                    data: chartdata,
                  );
                }
              }),
        ));
  }
}
