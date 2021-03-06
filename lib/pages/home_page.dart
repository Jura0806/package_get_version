import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectCode = '';
  String _projectAppID = '';
  String _projectName = '';

  @override
  void initState() {
    _initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }

    String projectName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectCode = projectCode;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Get Version Example'),
      ),
      body: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Container(
              height: 10.0,
            ),
            new ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Name'),
              subtitle: new Text(_projectName),
            ),
            const Divider(height: 20.0),
            new ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Running on'),
              subtitle: new Text(_platformVersion),
            ),
            const Divider(height: 20.0),
            new ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Version Name'),
              subtitle: new Text(_projectVersion),
            ),
            const Divider(height: 20.0),
            new ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Version Code'),
              subtitle: new Text(_projectCode),
            ),
            const Divider(height: 20.0),
            new ListTile(
              leading: const Icon(Icons.info),
              title: const Text('App ID'),
              subtitle: new Text(_projectAppID),
            ),
          ],
        ),
      ),
    );
  }
}
