/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

class Medal {
  String id;
  String description;
  String iconUrl;
  String name;
  int tierIndex;

  Medal({
    this.id,
    this.description, 
    this.iconUrl,
    this.name,
    this.tierIndex}
  );

  String toJson() {
    return '{'
        '"id":"$id",'
        '"name":"$name",'
        '"tierIndex":$tierIndex'
      '}';
  }
}