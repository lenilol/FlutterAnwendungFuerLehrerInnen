import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_prototyp_lehrer_anwendung/ClaasBookPreviewAdressDetail.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/changeDataAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/classBookAG.dart';
import 'package:flutter_prototyp_lehrer_anwendung/main.dart';
import 'package:flutter_prototyp_lehrer_anwendung/recycable.dart';
import 'package:path/path.dart';

void main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(ClassBookPreviewAdress(camera: firstCamera));
}

class ClassBookPreviewAdress extends StatefulWidget {
  final CameraDescription camera;

  const ClassBookPreviewAdress({super.key, required this.camera});

  @override
  State<ClassBookPreviewAdress> createState() => _MyAppState();
}

class _MyAppState extends State<ClassBookPreviewAdress> {
  int currentStateOfBottomNavigationBar = 3;
  int currentIndexStudent = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 3
            ? Scaffold(
                appBar: AppBar(
                  leading: IconButton(icon: Icon(Icons.search),onPressed: () => {},),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(
                            () {
                              currentStateOfBottomNavigationBar = 4;
                            },
                          );
                        },
                        child: const Text('Andere Klassenbuchansicht'))
                  ],
                  centerTitle: true,
                  title: Text('Klassenbuch'),
                ),
                body: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      getStudentIndex(),
                      (indexList) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                currentStateOfBottomNavigationBar = 5;
                                currentIndexStudent = indexList;
                              });
                            },
                            shape: Border.all(width: 3, color: Colors.black),
                            child: Text(
                              getStudentName(indexList),
                              style: const TextStyle(
                                fontSize: textSmall,
                              ),
                            ),
                          ),
                        );
                      },
                    )),
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
                      icon: Icon(Icons.add_location),
                    ),
                    BottomNavigationBarItem(
                      label: 'Klassenbuch',
                      icon: Icon(Icons.book),
                    ),
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
                        ? TakePictureScreen(
                            camera: widget.camera,
                            aG: 0,
                          )
                        : currentStateOfBottomNavigationBar == 3
                            ? ClassBookPreviewAdress(camera: widget.camera)
                            : currentStateOfBottomNavigationBar == 4
                                ? ClassBookPreview(camera: widget.camera)
                                : ClassBookPreviewAdressDetail(
                                    camera: widget.camera,
                                    studentIndex: currentIndexStudent));
  }
}
