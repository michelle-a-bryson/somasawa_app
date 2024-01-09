// Define a file for the model 'SelectionPopupModel' within the 'models/selectionPopUpModel' directory.

/// A comment that describes the purpose of the SelectionPopupModel class.
/// This class is a common model used for setting data into dropdown elements in the application.
class SelectionPopupModel {
  // Declare an integer 'id' property. It's nullable as indicated by the '?'.
  // This property can be used to uniquely identify each selection item, though it's optional.
  int? id;

  // Declare a required string property 'title'.
  // This is the text that will be displayed in the dropdown for this item.
  String title;

  // Declare a 'value' property of a dynamic type.
  // This can hold any type of data associated with the selection item.
  dynamic value;

  // Declare a boolean property 'isSelected' with a default value of false.
  // This indicates whether the selection item is currently selected.
  bool isSelected;

  // Define a constructor for SelectionPopupModel.
  // It allows initializing the model with 'id', 'title', 'value', and 'isSelected'.
  // 'title' is required, while others are optional.
  SelectionPopupModel({
    this.id, // Initializes 'id' if provided.
    required this.title, // 'title' must be provided.
    this.value, // Initializes 'value' if provided.
    this.isSelected = false, // Initializes 'isSelected' with a default value of false if not provided.
  });
}

