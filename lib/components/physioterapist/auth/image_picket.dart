import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:physioapp/model/auth/physio/auth_form.dart';

class ImagePicket extends StatefulWidget {
  const ImagePicket({super.key});

  @override
  ImagePicketState createState() => ImagePicketState();
}

class ImagePicketState extends State<ImagePicket> {
  final AuthForm _authForm = AuthForm();
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
        _authForm.imageProfile = _image;
        print('image: ${_image}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            label: const Text(
              'Selecionar Foto de Perfil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            icon: const Icon(
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
