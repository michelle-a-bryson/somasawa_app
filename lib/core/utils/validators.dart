// validators.dart
String? validateValueForm(String? value, String errorMessage) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }
  // Add any other specific checks here if necessary
  return null; // Return null if the value is valid
}

//this is mainly so that no other errors gets thrown, may require further implementation
