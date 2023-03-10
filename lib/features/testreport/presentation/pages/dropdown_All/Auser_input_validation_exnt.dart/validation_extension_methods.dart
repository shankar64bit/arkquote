// ignore_for_file: camel_case_extensions, non_constant_identifier_names

extension extString on String {
  bool get isValidEmail {
    // final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z.]{1,})+[A-Za-z]+\.?\s*$");
    //final nameRegExp = new RegExp(r"[A-Za-z.]{1,}");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidTrNo {
    final nameRegExp = RegExp(r"\d[0-9]+");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get IsValueEmpty {
    final isEmptyRegExp = RegExp(r"[^\s]");
    return isEmptyRegExp.hasMatch(this);
  }

  ///////////////////////ADD_ACB_PAGE////////////////////////
  bool get isPolesLimit {
    final panelRegExp = RegExp(r"^\+?0[3-5]{1}$");
    return panelRegExp.hasMatch(this);
  }
  ///////////////////////ADD_ACB_PAGE////////////////////////
}
