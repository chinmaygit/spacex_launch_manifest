import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spacex_launch_manifest/core/error/exceptions.dart';
import 'package:spacex_launch_manifest/core/service_locator.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';
import 'package:spacex_launch_manifest/presentation/pages/missions_page.dart';
import 'package:spacex_launch_manifest/presentation/widgets/rocket_card.dart';

class RocketsPage extends StatefulWidget {
  const RocketsPage({Key? key}) : super(key: key);

  @override
  _RocketsPageState createState() => _RocketsPageState();
}

class _RocketsPageState extends State<RocketsPage> {
  List<Rocket> rockets = [];
  bool isLoading = false;
  bool onlyActive = false;

  @override
  void initState() {
    this.setRockets();
    super.initState();
  }

  setRockets() async {
    setState(() {
      isLoading = true;
    });
    try {
      var result = await sl<LaunchDetailsRepository>().getRockets();
      setState(() {
        this.rockets = result;
      });
    } on ServerException catch (e) {
      print('ERROR ' + e.toString());
    } finally {}
    setState(() {
      isLoading = false;
    });
  }

  List<Rocket> getRockets() {
    if (onlyActive) {
      return this.rockets.where((element) => element.isActive).toList();
    }
    return this.rockets;
  }

  @override
  Widget build(BuildContext context) {
    var rockets = this.getRockets();

    return Scaffold(
        appBar: AppBar(
          title: Text('SpaceX Launch Manifest'),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          maintainBottomViewPadding: true,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(mainAxisSize: MainAxisSize.max, children: [
                  SwitchListTile(
                      value: onlyActive,
                      title: Text('Show active Rockets'),
                      onChanged: (value) {
                        setState(() {
                          onlyActive = value;
                        });
                      }),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          var width = MediaQuery.of(context).size.width - 32;
                          var height = width / 1.78;
                          return RocketCard(
                              width: width,
                              height: height,
                              rocket: rockets[index]);
                        },
                        itemCount: rockets.length),
                  )
                ]),
        ));
  }

  buildRocketItem(Rocket rocket) {}
}
