import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/changeDataAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/changeDataAdress.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAdress.dart';
import 'package:flutter_prototyp_lehrer_anwendung/main.dart';
import 'package:flutter_prototyp_lehrer_anwendung/recycable.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(PreviewDataScreenAdress(camera: firstCamera));
}

class PreviewDataScreenAdress extends StatefulWidget {
  final CameraDescription camera;

  const PreviewDataScreenAdress({super.key, required this.camera});

  @override
  State<PreviewDataScreenAdress> createState() => _MyAppState();
}

class _MyAppState extends State<PreviewDataScreenAdress> {
  int currentStateOfBottomNavigationBar = 2;
  int nextScreenAg = 1;

  int currentSelectedFieldAGVorname = 0;
  int currentSelectedFieldAGNachname = 0;
  int currentSelectedFieldAG1 = 0;
  int currentSelectedFieldAG2 = 0;
  int currentSelectedFieldAG3 = 0;
  bool showOriginal = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 2
            ? Scaffold(
                appBar: AppBar(
                    title: Row(children: [const Spacer(),const Spacer(), const Center(child: Text('Anzeige')), const Spacer()]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(
                              () {
                                showOriginal = !showOriginal;
                              },
                            );
                          },
                          child: const Text('Zeige Originale'))
                    ]),
                body: Center(
                  child:Column(children: <Widget>[
                          // upper Buttons
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            currentStateOfBottomNavigationBar =
                                                2;
                                            nextScreenAg = 0;
                                          });
                                        },
                                        child: const Icon(Icons.backspace))),
                                Expanded(
                                    child: FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            currentStateOfBottomNavigationBar =
                                                3;
                                          });
                                        },
                                        child: const Icon(Icons.save))),
                                Expanded(
                                    child: FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            currentStateOfBottomNavigationBar =
                                                4;
                                          });
                                        },
                                        child: const Icon(Icons.edit))),
                              ]),
                          // placeholder
                          const Text(''),
                          // select which item is correct KI
                          const Row(
                            children: [
                              Spacer(),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Vorname: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Nachname: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                      style: TextStyle(
                                          fontSize: textSmall,
                                          color: Colors.green)),
                                ),
                              ),
                              showOriginal? Expanded(child: Image(image: AssetImage('images/Vorname.png'),)): Spacer(), 
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
                                  child: const Center(
                                    child: Text('Hillebrand',
                                        style: TextStyle(
                                            fontSize: textSmall,
                                            color: Colors.orange)),
                                  ),
                                ),
                              ),
                              showOriginal? Expanded(child: Image(image: AssetImage('images/Nachname.png'),)): Spacer(), 
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
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
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGVorname = 2;
                                    });
                                  },
                                  shape: currentSelectedFieldAGVorname == 2
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Emilia',
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAGNachname = 2;
                                    });
                                  },
                                  shape: currentSelectedFieldAGNachname == 2
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Hillebrund',
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Text(''),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Straße: ',
                                style: TextStyle(fontSize: textSmall),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                  child: const Text('Falken str. 20',
                                      style: TextStyle(
                                          fontSize: textSmall,
                                          color: Colors.green)),
                                ),
                              ),
                              showOriginal? Expanded(child: Image(image: AssetImage('images/Straße.png'),)): Spacer(), 
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                    'Folken str. 29',
                                    style: TextStyle(
                                        fontSize: textSmall,
                                        color: Colors.orange),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Row(children: [
                            const Spacer(),
                            Expanded(
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    currentSelectedFieldAG1 = 2;
                                  });
                                },
                                shape: currentSelectedFieldAG1 == 2
                                    ? Border.all(width: 3, color: Colors.black)
                                    : Border.all(width: 0),
                                child: const Text(
                                  'Fulken str. 20',
                                  style: TextStyle(
                                      fontSize: textSmall, color: Colors.red),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ]),
                          const Text(''),
                          const Row(
                            children: [
                              Spacer(),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Postleitzahl: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Ort: ',
                                    style: TextStyle(fontSize: textSmall),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                  child: const Text('28215',
                                      style: TextStyle(
                                          fontSize: textSmall,
                                          color: Colors.green)),
                                ),
                              ),
                              showOriginal? Expanded(child: Image(image: AssetImage('images/PLZ.png'),)): Spacer(), 
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
                                  child: const Text(
                                    'Bremen',
                                    style: TextStyle(
                                        fontSize: textSmall,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                              showOriginal? Expanded(child: Image(image: AssetImage('images/Ort.png'),)): const Spacer(), 
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
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
                                  child: const Text('29215',
                                      style: TextStyle(
                                          fontSize: textSmall,
                                          color: Colors.green)),
                                ),
                              ),
                              const Spacer(),
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
                                    'Brummen',
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG2 = 2;
                                    });
                                  },
                                  shape: currentSelectedFieldAG2 == 2
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text('28217',
                                      style: TextStyle(
                                          fontSize: textSmall,
                                          color: Colors.red)),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSelectedFieldAG3 = 2;
                                    });
                                  },
                                  shape: currentSelectedFieldAG3 == 2
                                      ? Border.all(
                                          width: 3, color: Colors.black)
                                      : Border.all(width: 0),
                                  child: const Text(
                                    'Bremsen',
                                    style: TextStyle(
                                        fontSize: textSmall, color: Colors.red),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const Text(''),
                          RichText(
                            text: const TextSpan(
                                style: TextStyle(fontSize: textSmall),
                                children: [
                                  TextSpan(
                                    text: 'Die KI ist sich zu: ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '90%',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  TextSpan(
                                    text: '>',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '70%',
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  TextSpan(
                                    text: '>',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '50%',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  TextSpan(
                                    text: ' Sicher',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                          ),
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
                    ? PreviewDataScreenAdress(camera: widget.camera)
                    : currentStateOfBottomNavigationBar == 2
                        ? TakePictureScreen(
                            camera: widget.camera,
                            aG: nextScreenAg,
                          )
                        : currentStateOfBottomNavigationBar == 3
                            ? ClassBookPreviewAdress(camera: widget.camera)
                            : ChangeDataScreenAdress(
                                camera: widget.camera,
                              ));
  }
}
