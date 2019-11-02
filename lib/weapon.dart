/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

class Weapon {
  int id;
  String name;
  int type;

  Weapon({this.id, this.name, this.type});

  String toJson() {
    return '{'
        '"id":$id,'
        '"name":"$name",'
        '"type":$type'
      '}';
  }
}