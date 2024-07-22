import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
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
  const int studentIndex = 0;

  runApp(ClassBookPreviewAdressDetail(
    camera: firstCamera,
    studentIndex: studentIndex,
  ));
}

class ClassBookPreviewAdressDetail extends StatefulWidget {
  final CameraDescription camera;
  final int studentIndex;
  const ClassBookPreviewAdressDetail(
      {super.key, required this.camera, required this.studentIndex});

  @override
  State<ClassBookPreviewAdressDetail> createState() => _MyAppState();
}

class _MyAppState extends State<ClassBookPreviewAdressDetail> {
  int currentStateOfBottomNavigationBar = 3;
  int currentIndexStudent = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 3
            ? Scaffold(
                appBar: AppBar(
                  title: const Center(child: Text('Klassenbuch')),
                ),
                body: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(8.0),
                    children: List.generate(
                      9,
                      (indexList) {
                        return Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (indexList == 0)
                              const Text(
                                "Name:",
                                style: const TextStyle(
                                  fontSize: textSmall,
                                ),
                              ),
                            if (indexList == 2)
                              const Text(
                                "Adresse:",
                                style: const TextStyle(
                                  fontSize: textSmall,
                                ),
                              ),
                            if (indexList == 6)
                              const Text(
                                "AG's:",
                                style: const TextStyle(
                                  fontSize: textSmall,
                                ),
                              ),
                            Padding(padding: EdgeInsets.all(1)),
                            Padding(padding: const EdgeInsets.fromLTRB(10,0,10,0), child: 
                            Container(
                              padding: EdgeInsets.fromLTRB(5,1,5,1),
                              decoration: BoxDecoration(border: Border.all()),
                              child: Text(
                                getStudent(widget.studentIndex)[indexList],
                                style: const TextStyle(
                                  fontSize: textSmall,
                                ),
                              ),
                            ),),
                            Padding(padding: EdgeInsets.all(1)),
                          ],
                        );
                      },
                    )),
                bottomSheet: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          currentStateOfBottomNavigationBar = 4;
                        });
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
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
                            : ClassBookPreviewAdress(camera: widget.camera));
  }
}
