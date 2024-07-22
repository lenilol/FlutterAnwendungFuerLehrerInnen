import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAdress.dart';
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

  runApp(ChangeDataScreenAdress(camera: firstCamera));
}

class ChangeDataScreenAdress extends StatefulWidget {
  final CameraDescription camera;

  const ChangeDataScreenAdress({super.key, required this.camera});

  @override
  State<ChangeDataScreenAdress> createState() => _MyAppState();
}

class _MyAppState extends State<ChangeDataScreenAdress> {
  int currentStateOfBottomNavigationBar = 2;
  @override
  Widget build(BuildContext context) {
    var txtVorname = TextEditingController();
    txtVorname.text = 'Emil';
    var txtNachname = TextEditingController();
    txtNachname.text = 'Hillebrand';
    var txtAG1 = TextEditingController();
    txtAG1.text = 'Falken str. 20';
    var txtAG2 = TextEditingController();
    txtAG2.text = '28215';
    var txtAG3 = TextEditingController();
    txtAG3.text = 'Bremen';

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 2
            ? Scaffold(
                appBar: AppBar(
                  title: const Center(child: Text('Korrektur')),
                ),
                body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // show items to correct (KI)
                        const Text(
                          'Vorname: ',
                          style: TextStyle(fontSize: textSmall),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: txtVorname,
                                  style: const TextStyle(fontSize: textSmall),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          'Nachname: ',
                          style: TextStyle(fontSize: textSmall),
                        ),

                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: txtNachname,
                                  style: const TextStyle(fontSize: textSmall),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          'Straße: ',
                          style: TextStyle(fontSize: textSmall),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: txtAG1,
                                  style: const TextStyle(fontSize: textSmall),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          'Postleitzahl: ',
                          style: TextStyle(fontSize: textSmall),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: txtAG2,
                                  style: const TextStyle(fontSize: textSmall),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          'Ort: ',
                          style: TextStyle(fontSize: textSmall),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              child: Center(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: txtAG3,
                                  style: const TextStyle(fontSize: textSmall),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        const Spacer(),
                FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            currentStateOfBottomNavigationBar = 5;
                          });
                        },
                        child: const Icon(size: 50, Icons.done))
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
                    ? TakePictureScreen(
                        camera: widget.camera,
                        aG: 1,
                      )
                    : currentStateOfBottomNavigationBar == 2
                        ? ChangeDataScreenAdress(
                            camera: widget.camera,
                          )
                        : currentStateOfBottomNavigationBar == 3
                            ? ClassBookPreviewAdress(camera: widget.camera)
                            : ClassBookPreviewAdress(
                                camera: widget.camera,
                              ));
  }
}
