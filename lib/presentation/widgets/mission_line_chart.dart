import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spacex_launch_manifest/domain/entities/mission.dart';

class MissionsLineChart extends StatelessWidget {
  final Map<String, List<Mission>> missionMap;
  final List<Color> gradientColors = const [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  const MissionsLineChart({Key? key, required this.missionMap})
      : super(key: key);

  List<FlSpot> getSpots() {
    return List.generate(
        missionMap.keys.length,
        (index) => FlSpot(
            index.toDouble(),
            missionMap[missionMap.keys.elementAt(index)]?.length.toDouble() ??
                0));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.70,
        child: Container(
            margin: EdgeInsets.all(16),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xff232d37)),
            child: Padding(
                padding: const EdgeInsets.only(
                    right: 16.0, left: 8.0, top: 8, bottom: 8),
                child: LineChart(LineChartData(
                    gridData: FlGridData(show: false),
                    maxX: missionMap.keys.length.toDouble() - 1,
                    maxY: 35,
                    minX: 0,
                    minY: 0,
                    titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 16,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff68737d), fontSize: 10),
                            getTitles: (value) {
                              return missionMap.keys.elementAt(value.toInt());
                            },
                            margin: 4),
                        leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff67727d), fontSize: 12),
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 10:
                                  return '10';
                                case 20:
                                  return '20';
                                case 30:
                                  return '30';
                              }
                              return '';
                            },
                            reservedSize: 16,
                            margin: 12)),
                    lineBarsData: [
                      LineChartBarData(
                          spots: getSpots(),
                          isCurved: true,
                          colors: gradientColors,
                          barWidth: 3,
                          isStrokeCapRound: false,
                          dotData: FlDotData(show: true),
                          show: true,
                          belowBarData: BarAreaData(
                              show: true,
                              colors: gradientColors
                                  .map((color) => color.withOpacity(0.3))
                                  .toList()))
                    ])))));
  }
}
