import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

/*
* This class is used for maintain state behaviour
* */
class HomePageState extends State<HomePage> {

  ArCoreController arCoreController;

  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ar Demo App"),
        ),
        // add your AR Core View Widget here
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
        ));
  }

/*
* This is a AR core view controller
* */
  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    //add view in ar core view controller.
    _addSphere(arCoreController);
    _addCylindre(arCoreController);
    _addCube(arCoreController);
  }

/*
* This method is used for the create sphere view
* */
  void _addSphere(ArCoreController controller) {
    // add colors
    final material = ArCoreMaterial(color: Color.fromARGB(120, 66, 134, 244));
    // create sphere view
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    // add sphere view in the AR code node
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

/*
* This method is used for the create cylinder view
* */
  void _addCylindre(ArCoreController controller) {
    // add colors
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    // create cylinder view
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    // add cylinder view in AR Core node
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

/*
* This method is used for the create cube view
* */
  void _addCube(ArCoreController controller) {
    // add color
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    // create Cube view
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    // add your cube view in the AR Core Node
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }
}
