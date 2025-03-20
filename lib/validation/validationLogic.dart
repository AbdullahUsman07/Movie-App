import 'package:movie_app/extensions/stringextension.dart';
import 'package:movie_app/validation/validationModel.dart';

class CheckValidation {
  Validation email = Validation(null, null);
  Validation username = Validation(null, null);
  Validation password = Validation(null, null);
  Validation reEnter = Validation(null, null);

  
  bool get isValidLogin => email.value != null && password.value != null;


  bool get isValidRegister =>
      email.value != null &&
      password.value != null &&
      username.value != null &&
      reEnter.value != null;

  validateUsername(String value) {
    if (value.isValidUsername) {
      username.value = value;
      username.error = null;
    } else {
      username.value = null;
      username.error = "Special characters ot allowed";
    }
  }

  validateEmail(String value) {
    if (value.isvalidEmail) {
      email.value = value;
      email.error = null;
    } else {
      email.value = null;
      email.error = "Incorrect format";
    }
  }

  validatePassword(String value) {
    if (value.isvalidPassword) {
      password.value = value;
      password.error = null;
    } else {
      password.error = "must be 8 characters long";
      password.value = null;
    }
  }

  validateReEnter(String value) {
    if (value == password.value) {
      reEnter.value = value;
      reEnter.error = null;
    } else {
      reEnter.value = null;
      reEnter.error = "password doesn't match";
    }
  }
}
