/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

class ServerStatusException implements Exception {
  String message;
  int code;

  ServerStatusException({this.message, this.code});

  String toString() {
    return "ServerStatusException : code $code : $message";
  }
}