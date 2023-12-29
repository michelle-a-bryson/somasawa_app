String? validateValueForm(String? value, String errorMessage) {
  if (value == null || value.toString().isEmpty) {
    return errorMessage;
  }
  return null;
}
