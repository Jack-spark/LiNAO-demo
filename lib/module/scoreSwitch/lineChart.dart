import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// 波形图组件
class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  final List<FlSpot> spots = [
    FlSpot(0, 1),
    FlSpot(1, 1.5),
    FlSpot(2, 1.4),
    FlSpot(3, 3),
    FlSpot(4, 2),
    FlSpot(5, 2.2),
    FlSpot(6, 1.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1150 / 3.5,
      height: 612 / 3.5,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: false,
              colors: gradientColors,
              barWidth: 5,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
