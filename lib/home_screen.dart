import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_pick/pickimage_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(PickImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green.shade100,
          title: Text('Image Pick Using Getx'),
        ),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: controller.file.isNotEmpty
                      ? FileImage(File(controller.file.toString()))
                      : null,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: Text('Image From Gallery ')),
              ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  child: Text('Image From Camera')),
            ],
          ),
        ));
  }
}
