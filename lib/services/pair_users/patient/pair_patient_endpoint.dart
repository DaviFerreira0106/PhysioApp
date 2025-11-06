import 'package:http/http.dart' as http;

class PairPatientEndpoint {
  // static const String _url = 'http://10.8.121.9:8080';
  static const String _url = 'http://192.168.15.2:8080';
  // static const String _url = 'http://10.8.116.1:8080';

  Future<http.Response> pairWithPhysio(
      {required String physioId, required String token}) async {
    return await http.get(
      Uri.parse('$_url/users/$physioId'),
      headers: {
        "Authorization": "Bearer $token",
      },
    ).timeout(
      const Duration(seconds: 5),
    );
  }
}
