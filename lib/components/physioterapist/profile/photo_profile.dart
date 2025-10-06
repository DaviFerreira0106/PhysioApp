import 'package:flutter/material.dart';

class PhotoProfile extends StatefulWidget {
  const PhotoProfile({super.key});

  @override
  PhotoProfileState createState() => PhotoProfileState();
}

class PhotoProfileState extends State<PhotoProfile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: Stack(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
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
                onPressed: () {},
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
