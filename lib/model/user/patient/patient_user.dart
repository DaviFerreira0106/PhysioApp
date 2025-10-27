import 'dart:io';

class PatientUser {
  final String id;
  final String name;
  final String email;
  final File imageProfile;

  const PatientUser({
    required this.id,
    required this.name,
    required this.email,
    required this.imageProfile,
  });
}
