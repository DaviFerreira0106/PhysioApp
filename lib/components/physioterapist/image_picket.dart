import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicket extends StatefulWidget {
  const ImagePicket({super.key});

  @override
  ImagePicketState createState() => ImagePicketState();
}

class ImagePicketState extends State<ImagePicket> {
  final ImagePicker _picket = ImagePicker();
  File? _image;

  Future<void> _getImage() async {
    final image = await _picket.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: _image != null ? FileImage(_image!) : null,
            radius: 50,
          ),
          TextButton.icon(
            onPressed: () {
              _getImage();
            },
            label: Text(
              'Selecionar Foto de Perfil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            icon: Icon(
              Icons.photo,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
