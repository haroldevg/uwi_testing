mixin FieldValidatorMixin {

  String? validateEmail(String? value){
    if(value == null || value.isEmpty) return 'Ingresar correo';

    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if(!regex.hasMatch(value)){
      return 'Ingrese un correo valido';
    }

    return null;

  }

  String? validatePassword(String? value){
    if(value == null || value.isEmpty) return 'Ingresar password';
    if(value.length < 7) {
      return 'La contrasena debe tener como minimo 7 caracteres';
    }
    return null;
  }

}