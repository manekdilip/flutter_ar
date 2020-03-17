# Flutter Ar Demo App

![alt](https://www.manektech.com/images/logo_with_text.png)

With use of below code you can create AR demo app at your end. You just need to follow below steps 

# Installation
 - Add below plugins in your project. 
```sh
dependencies:   arcore_flutter_plugin: ^0.0.2+2
```
 - Save the file and run the below command. 
```sh
$  flutter pub get
```
- You can download the plugin and import the dart file in your project. 
```sh
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
```
- Enable your AR support in your project. Open android menifiest file and add below code
```sh
//add this permissions 
<uses-sdk android:minSdkVersion="24" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" />

// add below metadata
<meta-data
android:name="com.google.ar.core"
android:value="required" />
```
- Add below depedancies in the build.gradle file. 
```sh
implementation 'com.google.ar.sceneform.ux:sceneform-ux:1.8.0'
implementation 'com.google.ar.sceneform:core:1.8.0'
implementation 'com.google.ar:core:1.8.0'
```
- AR plugin requires android x support. Please make sure the app has that support and add below code in gradle.properties. 
 ```sh
org.gradle.jvmargs=-Xmx1536M
android.enableR8=true
android.useAndroidX=true
android.enableJetifier=true
 ```
 - Create  HomePage Stateful Class and return ArCoreView in Scafold body like below,
```sh
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
```
- The important widget from the plugin is ArCoreView() The Constructor takes 4 named arguments
```sh
onArCoreViewCreated,enableTapRecognizer,enableUpdateListener,key
```
- Import Following Packages :
```sh
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
```
- do not forget to dispose in dispose() Override method.
```sh
  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();
  }
```
- create Sphere to AecoreNode 
```sh
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
```
- You can visit below offical site for get more details link(https://flutter.dev/) 

- Thank you for the reading
