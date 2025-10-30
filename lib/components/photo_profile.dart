import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class PhotoProfile extends StatefulWidget {
  const PhotoProfile({super.key});

  @override
  PhotoProfileState createState() => PhotoProfileState();
}

class PhotoProfileState extends State<PhotoProfile> {
  final ImagePicker _picket = ImagePicker();
  File? _image;

  Future<void> _getImage({required AuthPatientService currentUser}) async {
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

      currentUser.currentPatientUser!.imageProfile = File(saveImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthPatientService();
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage:
                FileImage(currentUser.currentPatientUser!.imageProfile),
            maxRadius: 50,
          ),
          Positioned(
            bottom: 3,
            right: 7,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => _getImage(currentUser: currentUser),
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: Theme.of(context).textTheme.labelSmall?.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
