//defines the model for the class, will be helpful in regards to state management

class ClassModel {
  final String title;
  final String term;
  final bool isArchived;
  //define the constructor function to intialize the properties of the class
  ClassModel({required this.title, required this.term, this.isArchived=false});  //set the archived status to false by default
}
