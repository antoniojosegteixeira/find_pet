mixin Validations {
  static String? validatePasscode(String? value) {
    if (value?.length == 8) {
      if (value == null || value.isEmpty) {
        return 'Passcode required';
      }
      if (value.length != 8) {
        return 'Invalid Password. Please review it.';
      }
      for (var i = 0; i < value.length - 2; i++) {
        try {
          final first = int.parse(value[i]);
          final second = int.parse(value[i + 1]);
          final third = int.parse(value[i + 2]);
          if (first == second && first == third) {
            return 'Passcode cannot contain 3 or more equal numbers';
          }
          if (first == second - 1 && first == third - 2) {
            return 'Passcode cannot contain sequence of 3 or more numbers';
          }
        } catch (e) {
          return 'Invalid Password. Please review it.';
        }
      }
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'You need to informe a date.';
    }
    try {
      final data = DateTime.parse(value);
      final now = DateTime.now();
      if (data.isAfter(DateTime(now.year - 18, now.month, now.day))) {
        return 'You must be 18 or older to create an\n account.';
      }
      if (data.isBefore(DateTime(1900))) {
        return 'Please enter a valid date.';
      }
    } catch (e) {
      return 'Please enter a date in mm/dd/yyyy format.';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Enter your Name';
    }
    return null;
  }

  static String? validateRequired(
    String? value, {
    String? errorText = 'This field cannot be empty',
  }) {
    if (value == null || value.isEmpty) {
      return errorText;
    }
    return null;
  }

  static String? validateCellPhone(String? value) {
    if (value == null || value.length < 14) {
      return 'Please enter a valid a phone number';
    }
    return null;
  }
}
