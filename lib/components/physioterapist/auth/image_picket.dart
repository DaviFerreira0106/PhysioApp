import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:physioapp/services/auth/physio/auth_form.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

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
      setState(() => _image = File(image.path));

      // Acessando o diretorio de documentos
      final appDir = await syspath.getApplicationDocumentsDirectory();

      // Pegando o nome do arquivo em questão
      final imageName = path.basename(_image!.path);

      // Salvando o arquivo em um caminho corrente nos documentos do dispositivo
      final saveImage = await _image!.copy('${appDir.path}/$imageName');

      AuthFormData.imageProfile = saveImage;
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
