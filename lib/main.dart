import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAG.dart';

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatefulWidget {
  final CameraDescription camera;

  const MyApp({
    super.key,
    required this.camera,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentStateOfBottomNavigationBar = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 0
            ? Scaffold(
                appBar: AppBar(
                  title: const Center(child: Text('Übersicht')),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Sehr geehrte Nutzer*In,'),
                      const Text(''),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'mit dem ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.add_task, size: 14),
                            ),
                            TextSpan(
                              text: ' Icon können Sie eine AG aufnehmen.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Text(''),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'mit dem ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.add_location, size: 14),
                            ),
                            TextSpan(
                              text: ' Icon können Sie eine Adresse aufnhemen.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Text(''),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'mit dem ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.book, size: 14),
                            ),
                            TextSpan(
                              text: ' Icon kommen Sie zum Klassenbuch.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Text(''),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'mit dem ',
                              style: TextStyle(color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.home, size: 14),
                            ),
                            TextSpan(
                              text:
                                  ' Icon kommen Sie wieder auf diese Übersichts-Seite.',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(Icons.home),
                    ),
                    BottomNavigationBarItem(
                      label: 'AG Aufnehmen',
                      icon: Icon(Icons.add_task),
                    ),
                    BottomNavigationBarItem(
                        label: 'Adresse Aufnehmen',
                        icon: Icon(Icons.add_location)),
                    BottomNavigationBarItem(
                        label: 'Klassenbuch', icon: Icon(Icons.book)),
                  ],
                  currentIndex: currentStateOfBottomNavigationBar,
                  onTap: (int index) {
                    setState(() {
                      currentStateOfBottomNavigationBar = index;
                    });
                  },
                ),
              )
            : currentStateOfBottomNavigationBar == 1
                ? TakePictureScreen(
                    camera: widget.camera,aG: 1,
                  )
                : currentStateOfBottomNavigationBar == 2
                    ? TakePictureScreen(
                        camera: widget.camera,aG: 0,
                      )
                    : currentStateOfBottomNavigationBar == 3
                        ? ClassBookPreview(
                            camera: widget.camera,
                          )
                        : MyApp(
                            camera: widget.camera,
                          ));
  }
}
