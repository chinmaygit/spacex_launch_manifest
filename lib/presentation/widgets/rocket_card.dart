import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:spacex_launch_manifest/domain/entities/rocket.dart';
import 'package:spacex_launch_manifest/presentation/pages/missions_page.dart';

class RocketCard extends StatelessWidget {
  final double width, height;
  final Rocket rocket;
  const RocketCard(
      {Key? key,
      required this.width,
      required this.height,
      required this.rocket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedBuilder: (context, action) => Container(
            width: width,
            height: height,
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: NetworkImage(rocket.image), fit: BoxFit.cover)),
            child: Stack(children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.all(16),
                      height: height / 2.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(1),
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.6),
                                Colors.black.withOpacity(0.2),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(rocket.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .apply(bodyColor: Colors.white)
                                          .subtitle1),
                                  Text(rocket.country,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: Theme.of(context)
                                          .textTheme
                                          .apply(bodyColor: Colors.white)
                                          .subtitle2)
                                ]),
                            Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text('Engines: ${rocket.engineCount}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .apply(bodyColor: Colors.white)
                                        .bodyText1))
                          ])))
            ])),
        openBuilder: (context, _) => MissionsPage(rocket: rocket));
  }
}
