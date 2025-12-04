class Validator{
  static String? validateEmail(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(val.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validateName(String? val) {
    RegExp nameRegex = RegExp(r"^[a-zA-Z ]+$");

    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (!nameRegex.hasMatch(val.trim())) {
      return 'enter valid name';
    } else {
      return null;
    }
  }
  static String? validatePhone(String? val) {
    RegExp phoneRegex = RegExp(r"^[0-9]{10,11}$");

    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (!phoneRegex.hasMatch(val.trim())) {
      return 'enter valid phone';
    } else {
      return null;
    }
  }
  static String? validatePassword(String? val) {
    RegExp passRegex =
    RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

    if (val == null || val.trim().isEmpty) {
      return 'this field is required';
    } else if (!passRegex.hasMatch(val)) {
      return 'password must contain upper, lower, number & symbol and be 8+ chars';
    } else {
      return null;
    }
  }

}