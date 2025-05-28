import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart' as crypto;
import 'package:physioapp/utils/secure.dart';

class Encrypter {
  // Criando chaves de criptografia

  final _key = encrypt.Key.fromUtf8(Secure.key);
  final encrypt.IV _iv = encrypt.IV.fromBase64(Secure.iv);

  // Criando objeto de critação
  Map<String, String> encrypter(
      {required Map<String, Object> data, required String uid}) {
    final objEncryper = encrypt.Encrypter(encrypt.AES(_key));
   
    // Criptografando os dados
    final uidCipher = objEncryper.encrypt(uid, iv: _iv);
    final emailCipher = objEncryper.encrypt(data['email'] as String, iv: _iv);
    final crefitoCipher =
        objEncryper.encrypt(data['numberCrefito'] as String, iv: _iv);
    final nameCipher = objEncryper.encrypt(data['name'] as String, iv: _iv);
    final phoneCipher = objEncryper.encrypt(data['phone'] as String, iv: _iv);

    // Criptografando a senha
    String password = data['password'] as String;
    final bytesPassword = utf8.encode(password + Secure.salt);
    final passwordHash = crypto.sha256.convert(bytesPassword);
    password = '';

    return {
      'uid': uidCipher.base64,
      'email': emailCipher.base64,
      'numberCrefito': crefitoCipher.base64,
      'name': nameCipher.base64,
      'phone': phoneCipher.base64,
      'password': passwordHash.toString(),
      // 'iv': _iv.base64,
    };
  }

  Map<String, String> decrypter({required dynamic data}) {
    final objEncryper = encrypt.Encrypter(encrypt.AES(_key));
    
    // Pegando os dados do BD e convertendo para tipo Encrypted
    final uidCipher = encrypt.Encrypted.fromBase64(data['uid'] as String);
    final emailCipher = encrypt.Encrypted.fromBase64(data['email'] as String);
    final crefitoCipher =
        encrypt.Encrypted.fromBase64(data['numberCrefito'] as String);
    final nameCipher = encrypt.Encrypted.fromBase64(data['name'] as String);
    final phoneCipher =
        encrypt.Encrypted.fromBase64(data['telephone'] as String);

    // Descriptografando dados
    final uidDecrypt = objEncryper.decrypt(uidCipher, iv: _iv);
    final emailDescrypt = objEncryper.decrypt(emailCipher, iv: _iv);
    final crefitoDecrypt = objEncryper.decrypt(crefitoCipher, iv: _iv);
    final nameDecrypt = objEncryper.decrypt(nameCipher, iv: _iv);
    final phoneDecrypt = objEncryper.decrypt(phoneCipher, iv: _iv);

    return {
      'uid': uidDecrypt,
      'email': emailDescrypt,
      'numberCrefito': crefitoDecrypt,
      'name': nameDecrypt,
      'phone': phoneDecrypt,
    };
  }
}
