import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter_provider_camera/provider/provider.dart';
import 'package:flutter_provider_camera/camera/camera.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Data(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider and Camera'),
        ),
        body: ListViewWidget(),
        floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          },
          child: Icon(Icons.camera_alt),
        ),
),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final names = Provider.of<Data>(context).names;
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(names[index]),
          onTap: () {
            Provider.of<Data>(context, listen: false).setSelectedIndex(index);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen()),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedName = Provider.of<Data>(context).selectedFullName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Name Screen'),
      ),
      body: Center(
        child: Text('Name selected $selectedName'),
      ),
    );
  }
}