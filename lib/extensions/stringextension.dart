


extension StringExtension on String {
  
  bool get isvalidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isvalidPassword =>
      RegExp(r'[a-zA-Z0-9!@#$%^&*()]{8}').hasMatch(this);

   bool get isValidUsername => RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(this);


}