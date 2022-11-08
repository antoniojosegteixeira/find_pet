mixin Validations {
  static String? validatePasscode(String? value) {
    final isValid = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    ).hasMatch(value ?? '');

    if (!isValid) {
      return 'Insira uma senha de ao menos 8 dígitos';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Insira seu nome';
    }
    return null;
  }

  static String? validateRequired(
    String? value, {
    String? errorText = 'Este campo não pode ficar vazio',
  }) {
    if (value == null || value.isEmpty) {
      return errorText;
    }
    return null;
  }

  static String? validateCellPhone(String? value) {
    if (value == null || value.length < 11) {
      return 'Insira um telefone válido';
    }
    return null;
  }

  static String? validateMail(String? value) {
    final valid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value ?? '');

    if (!valid) {
      return 'Insira um email válido';
    }
    return null;
  }
}
