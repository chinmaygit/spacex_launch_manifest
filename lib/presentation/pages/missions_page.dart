import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:spacex_launch_manifest/core/error/exceptions.dart';
import 'package:spacex_launch_manifest/core/service_locator.dart';
import 'package:spacex_launch_manifest/domain/entities/mission.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';
import 'package:spacex_launch_manifest/presentation/widgets/mission_line_chart.dart';
import 'package:spacex_launch_manifest/presentation/widgets/mission_tile.dart';

class MissionsPage extends StatefulWidget {
  final Rocket rocket;
  const MissionsPage({Key? key, required this.rocket}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  double appBarHeight = 240;
  List<Mission> missions = [];
  bool isLoading = false;

  setMissions() async {
    setState(() {
      isLoading = true;
    });
    try {
      var result = await sl<LaunchDetailsRepository>()
          .getRocketMissions(this.widget.rocket.id);
      setState(() {
        this.missions = result;
      });
    } on ServerException catch (e) {
      print(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Map<String, List<Mission>> getMissionMap() {
    return groupBy(this.missions, (Mission mission) => mission.launchYear);
  }

  List<Widget> generateMissionWidgets() {
    var missionMap = this.getMissionMap();
    List<Widget> items = [
      MissionsLineChart(missionMap: missionMap),
      Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Text(this.widget.rocket.description))
    ];
    missionMap.keys.forEach((element) {
      items.add(Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Center(child: Text(element, textScaleFactor: 1.5)),
      ));
      missionMap[element]!.forEach((element) {
        items.add(MissionTile(mission: element));
      });
    });

    return items;
  }

  @override
  void initState() {
    this.setMissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listOfWidgets = this.generateMissionWidgets();
    return Scaffold(
        body: SafeArea(
      top: false,
      bottom: false,
      maintainBottomViewPadding: true,
      child: NestedScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading:
                    BackButton(onPressed: () => Navigator.of(context).pop()),
                expandedHeight: 240,
                pinned: true,
                floating: false,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  appBarHeight = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: false,
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(this.widget.rocket.image),
                              fit: BoxFit.fill)),
                    ),
                    title: Container(
                      padding: EdgeInsets.zero,
                      child: Text(this.widget.rocket.name),
                    ),
                  );
                }),
              ),
            ];
          },
          body: this.isLoading
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () => this.setMissions(),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) => listOfWidgets[index],
                      itemCount: listOfWidgets.length),
                )),
    ));
  }
}
