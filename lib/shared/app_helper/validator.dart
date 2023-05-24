class Validators {

  static bool isValidPhoneNumber(String number) {
    const pattern = r'^([8]{2,2})?01[3456789]{1}[0-9]{8}$';
    //const pattern = r'^([8]{2,2})?1[3456789]{1}[0-9]{8}$';
    final  regExp = RegExp(pattern);

    return regExp.hasMatch(number);
  }

  static bool isValidEmail(String email) {
    const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final  regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

}