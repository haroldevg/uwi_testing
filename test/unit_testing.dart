import 'package:example_test/utils/field_validator_mixin.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeFieldValidator with FieldValidatorMixin{

}

void main(){
  group('email validation test', () {
    
    test('should return null when email is valid', () => (){

      var result = FakeFieldValidator().validateEmail('prueba@hotmail.com');

      expect(result, null);

    });

    test('should return enter email message when email is empty', () => (){

      var result = FakeFieldValidator().validateEmail('');

      expect(result, 'Ingresar correo');

    });

    test('should return enter email message when email is null', () => (){

      var result = FakeFieldValidator().validateEmail(null);

      expect(result, 'Ingresar correo');

    });

  });

  group('password validation test', () {

    test('should return null when password is valid', () => (){

      var result = FakeFieldValidator().validatePassword('23424242');

      expect(result, null);

    });

    test('should return enter password message when password is empty', () => (){

      var result = FakeFieldValidator().validatePassword('');

      expect(result, 'Ingresar password');

    });

    test('should return enter password message when password is null', () => (){

      var result = FakeFieldValidator().validatePassword(null);

      expect(result, 'Ingresar password');

    });

    test('should return a message when password have seven characters', () => (){

      var result = FakeFieldValidator().validatePassword('2313133');

      expect(result, 'La contrasena debe tener como minimo 7 caracteres');

    });

    test('should return a message when password is less than seven characters', () => (){

      var result = FakeFieldValidator().validatePassword('23131');

      expect(result, 'La contrasena debe tener como minimo 7 caracteres');

    });

    test('should return a message when password is upper than seven characters', () => (){

      var result = FakeFieldValidator().validatePassword('231324242421');

      expect(result, 'La contrasena debe tener como minimo 7 caracteres');

    });

  });

}