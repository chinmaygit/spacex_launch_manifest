import 'package:flutter/material.dart';
import 'package:spacex_launch_manifest/core/service_locator.dart';
import 'package:spacex_launch_manifest/presentation/pages/rockets_page.dart';

import 'package:spacex_launch_manifest/domain/repository/launch_details_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  Future<void> _showMyDialog(context) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SpaceX Launch Manifest'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is spacex launch manifest.'),
                Text('Tap on rockets to know more'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OKAY'),
              onPressed: () {
                sl<LaunchDetailsRepository>().isAppOpened = true;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!sl<LaunchDetailsRepository>().isAppOpened) {
      Future.delayed(Duration.zero, () => this._showMyDialog(context));
    }
    return RocketsPage();
  }
}
