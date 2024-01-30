import 'package:flutter/material.dart';
import 'package:somasawa_app/main.dart';

class ServerException implements Exception {}  //initialized exception error messages here

class CacheException implements Exception {}  //intialized cache exception here, error relevant to cache errors

class NetworkException implements Exception {} //initialized network exception here, error relevant to network errors

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;  //print out the corresponding error message in string format

  NoInternetException([String message = 'NoInternetException Occurred']) { //in the case that no Internet related errors have occured
    var globalMessengerKey; //temporary placeholder, place in garbage after printing out
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState! 
          .showSnackBar(SnackBar(content: Text(message)));
    }
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

