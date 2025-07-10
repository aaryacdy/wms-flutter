class RegexConstants {
  static const specialCharacterregex = r'(?=.*?[#?!@$%^&*-])';
  static const upperCaseRegex = r'(?=.*?[A-Z])';
  static const lowerCaseRegex = r'(?=.*?[a-z])';
  static const numberRegex = r'(?=.*?[0-9])';
  static const nepaliMobileNumberRegex = r'^(\98[0-9]{8})$';
  static const emailRegex = r'^[^@]+@[^@]+\.[^@]+';
}
