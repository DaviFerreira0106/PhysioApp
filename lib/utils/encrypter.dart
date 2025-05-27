import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:crypto/crypto.dart' as crypto;
import 'package:physioapp/utils/secure.dart';

class Encrypter {
  // Criando chaves de criptografia
  
  final  _key = encrypt.Key.fromUtf8(Secure.key);
  final _iv = encrypt.IV.fromLength(16);

  // Criando objeto de critação
  final _objEncryper = encrypt.Encrypter(encrypt.AES(_key));
    // final objEncrypter = encrypt.Encrypter(encrypt.AES(key));

    // // Criptografando os dados
    // final uidCipher = objEncrypter.encrypt(uid, iv: iv);
    // final emailCipher =
    //     objEncrypter.encrypt(formData['email'] as String, iv: iv);
    // final crefitoCipher =
    //     objEncrypter.encrypt(formData['numberCrefito'] as String, iv: iv);
    // final nameCipher = objEncrypter.encrypt(formData['name'] as String, iv: iv);
    // final phoneCipher =
    //     objEncrypter.encrypt(formData['phone'] as String, iv: iv);

    // // Criptografando a senha
    // String password = formData['password'] as String;
    // final bytesPassword = utf8.encode(password + Secure.salt);
    // final passwordHash = crypto.sha256.convert(bytesPassword);
    // password = '';

    // final emailTeste = encrypt.Encrypted.fromBase64(emailCipher.base64);
    // final data = objEncrypter.decrypt(emailTeste, iv: iv);
    // print(data);
}