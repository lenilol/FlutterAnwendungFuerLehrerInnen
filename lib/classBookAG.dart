import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_prototyp_lehrer_anwendung/cameraScreen.dart';
import 'package:flutter_prototyp_lehrer_anwendung/changeDataAG.dart';
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

  runApp(ClassBookPreview(camera: firstCamera));
}

class ClassBookPreview extends StatefulWidget {
  final CameraDescription camera;

  const ClassBookPreview({super.key, required this.camera});

  @override
  State<ClassBookPreview> createState() => _MyAppState();
}

class _MyAppState extends State<ClassBookPreview> {
  int currentStateOfBottomNavigationBar = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: currentStateOfBottomNavigationBar == 3
            ? Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => {},
                  ),
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
                  padding: const EdgeInsets.all(8.0),
                  children: List.generate(getStudentIndex(), (indexList) {
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        child: Container(
                            decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Column(
                                  children: [
                                    Text(
                                      getStudentName(indexList),
                                      style: TextStyle(fontSize: textSmall),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Column(
                                            children: [
                                              Text('Adresse: '),
                                              Text('AGs: ')
                                            ],
                                          ),
                                          Column(children: [
                                            Text(
                                                '${getStudent(indexList)[2]} ${getStudent(indexList)[3]}, ${getStudent(indexList)[4]}, ${getStudent(indexList)[5]}'),
                                            Text(
                                                '${getStudent(indexList)[6]}, ${getStudent(indexList)[7]}, ${getStudent(indexList)[8]}')
                                          ])
                                        ])
                                  ],
                                ))));
                    // return SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //       children: List.generate(
                    //     getStudent(0).length,
                    //     (indexListInner) {
                    //       return Container(
                    //           padding: const EdgeInsets.all(3.0),
                    //           decoration: BoxDecoration(border: Border.all()),
                    //           child: Text(
                    //             getStudent(indexList)[indexListInner],
                    //             style: const TextStyle(
                    //               fontSize: textSmall,
                    //             ),
                    //           ));
                    //     },
                    //   )),
                    // );
                  }),
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
                        : currentStateOfBottomNavigationBar == 4
                            ? ClassBookPreviewAdress(
                                camera: widget.camera,
                              )
                            : ClassBookPreview(camera: widget.camera));
  }
}
