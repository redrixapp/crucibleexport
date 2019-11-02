/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

import "medal.dart";

class MedalResult {
    int count;
    Medal medal;
    
    MedalResult({this.count, this.medal});

    String toJson() {
      return '{'
        '"count":$count,'
        '"medal":${medal.toJson()}'
      '}';
    }
}