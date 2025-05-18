import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colo_extension.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  int touchedIndex = -1;

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 5,

              gradient: LinearGradient(colors: TColor.brandColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 1:
        return BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 6.5,
              gradient: LinearGradient(colors: TColor.secondaryColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 2:
        return BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 5,
              gradient: LinearGradient(colors: TColor.brandColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 3:
        return BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 7.5,
              gradient: LinearGradient(colors: TColor.secondaryColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 4:
        return BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 9,
              gradient: LinearGradient(colors: TColor.brandColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 5:
        return BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 11.5,
              gradient: LinearGradient(colors: TColor.secondaryColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      case 6:
        return BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 6.5,
              gradient: LinearGradient(colors: TColor.brandColorG),
              width: 22,
              borderSide: const BorderSide(color: Colors.white, width: 0),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 20,
                color: TColor.borderColor,
              ),
            ),
          ],
        );
      default:
        throw Error();
    }
  });

  Widget getTitles(double value, TitleMeta meta) {
    var style = TextStyle(color: TColor.greyColor1, fontSize: 12);
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Sun', style: style);
        break;
      case 1:
        text = Text('Mon', style: style);
        break;
      case 2:
        text = Text('Tue', style: style);
        break;
      case 3:
        text = Text('Wed', style: style);
        break;
      case 4:
        text = Text('Thu', style: style);
        break;
      case 5:
        text = Text('Fri', style: style);
        break;
      case 6:
        text = Text('Sat', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(meta: meta, space: 16, child: text);
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => Colors.blueGrey,
            tooltipHorizontalAlignment: FLHorizontalAlignment.right,
            tooltipMargin: 10,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                '$weekDay\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: TextStyle(
                      color: TColor.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
          touchCallback: (FlTouchEvent event, barTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  barTouchResponse == null ||
                  barTouchResponse.spot == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            });
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: 38,
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: showingGroups(),
        gridData: FlGridData(show: false),
      ),
    );
  }
}
