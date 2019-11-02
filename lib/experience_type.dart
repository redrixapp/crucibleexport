/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

class ExperienceType {
  static const int glory = 0;
  static const int valor = 1;

  static String labelFromType(int experienceType) {
    String out = "glory";

    if(experienceType == valor) {
      out = "valor";
    }

    return out;
  }
}
