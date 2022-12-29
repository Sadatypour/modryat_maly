import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:modiriat_maly/const.dart';
import 'package:modiriat_maly/models/utils/caclulate.dart';

class chart extends StatelessWidget {
  const chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Color.fromARGB(210, 5, 82, 248),
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 4, 90, 195),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'دریافت سال';
        break;
      case 1:
        text = 'پرداخت سال';
        break;
      case 2:
        text = 'دریافت ماه';
        break;
      case 3:
        text = 'پرداخت ماه';
        break;
      case 4:
        text = 'دریافت روز';
        break;
      case 5:
        text = 'پرداخت روز';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final d = const LinearGradient(
    colors: [
      Color.fromARGB(189, 232, 106, 100),
      Color.fromARGB(226, 234, 188, 97),
      Color.fromARGB(250, 10, 244, 18),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  final p = const LinearGradient(
    colors: [
      Color.fromARGB(220, 114, 245, 118),
      Color.fromARGB(212, 57, 228, 228),
      Color.fromARGB(255, 249, 21, 9),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: caculate.dyear(),
              gradient: d,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: caculate.pyear(),
              gradient: p,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: caculate.dmonth(),
              gradient: d,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: caculate.pmonth(),
              gradient: p,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: caculate.Dtoday(),
              gradient: d,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: caculate.ptoday(),
              gradient: p,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
