import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/changeDataAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/main.dart';
import 'package:flutter_prototyp_lehrer_anwendung/recycable.dart';

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(PreviewDataScreen(camera: firstCamera));
}

class PreviewDataScreen extends StatefulWidget {
  final CameraDescription camera;

  const PreviewDataScreen({super.key, required this.camera});

  @override
  State<PreviewDataScreen> createState() => _MyAppState();
}

class _MyAppState extends State<PreviewDataScreen> {
  int currentStateOfBottomNavigationBar = 1;
  int nextScreenAg = 0;

  int currentSelectedFieldAGVorname = 0;
  int currentSelectedFieldAGNachname = 0;
  int currentSelectedFieldAG1 = 0;
  int currentSelectedFieldAG2 = 0;
  int currentSelectedFieldAG3 = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 1
            ? Scaffold(
                appBar: AppBar(
                  title: const Center(child: Text('Anzeige')),
                ),
                body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // upper Buttons
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          currentStateOfBottomNavigationBar = 2;
                                          nextScreenAg = 1;
                                        });
                                      },
                                      child: const Icon(Icons.backspace))),
                              Expanded(
                                  child: FloatingActionButton(
                                      onPressed: () {setState(() {
                                        currentStateOfBottomNavigationBar = 3;
                                      });},
                                      child: const Icon(Icons.save))),
                              Expanded(
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          currentStateOfBottomNavigationBar = 4;
                                        });
                                      },
                                      child: const Icon(Icons.edit))),
                            ]),
                        // placeholder
                        const Text(''),
                        const Text(''),
                        // select which item is correct KI
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Vorname: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGVorname = 0;
                                    });
                                  },
                                  shape: currentSelectedFieldAGVorname == 0
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('Emil',
                                      style: TextStyle(fontSize: textSmall)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGVorname = 1;
                                    });
                                  },
                                  shape: currentSelectedFieldAGVorname == 1
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Emily',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                            ]),
                        const Text(''),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Nachname: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGNachname = 0;
                                    });
                                  },
                                  shape: currentSelectedFieldAGNachname == 0
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('Hillebrand',
                                      style: TextStyle(fontSize: textSmall)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGNachname = 1;
                                    });
                                  },
                                  shape: currentSelectedFieldAGNachname == 1
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Hillebrond',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                            ]),
                        const Text(''),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'AG1: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG1 = 0;
                                    });
                                  },
                                  shape: currentSelectedFieldAG1 == 0
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('Basketball',
                                      style: TextStyle(fontSize: textSmall)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG1 = 1;
                                    });
                                  },
                                  shape: currentSelectedFieldAG1 == 1
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Basketballer',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                            ]),
                        const Text(''),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'AG2: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG2 = 0;
                                    });
                                  },
                                  shape: currentSelectedFieldAG2 == 0
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('Handball',
                                      style: TextStyle(fontSize: textSmall)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG2 = 1;
                                    });
                                  },
                                  shape: currentSelectedFieldAG2 == 1
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Handbuch',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                            ]),
                        const Text(''),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'AG3: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG3 = 0;
                                    });
                                  },
                                  shape: currentSelectedFieldAG3 == 0
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('Brettspiele',
                                      style: TextStyle(fontSize: textSmall)),
                                ),
                              ),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG3 = 1;
                                    });
                                  },
                                  shape: currentSelectedFieldAG3 == 1
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Bettspiele',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                            ]),
                        const Text(''),
                      ]),
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
            : currentStateOfBottomNavigationBar == 0
                ? MyApp(
                    camera: widget.camera,
            )
            : currentStateOfBottomNavigationBar == 1
                ? PreviewDataScreen(camera: widget.camera
            )
            : currentStateOfBottomNavigationBar == 2
                ? TakePictureScreen(
                    camera: widget.camera, aG: nextScreenAg,
            )
            : currentStateOfBottomNavigationBar == 3
                ? ClassBookPreview(camera: widget.camera
            ) 
            : ChangeDataScreen(
                    camera: widget.camera,
            ));
  }
}
