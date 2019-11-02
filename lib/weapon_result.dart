/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

import "weapon.dart";

class WeaponResult {
  Weapon weapon;
  int kills;
  int precisionKills;
  double precisionKillsRatio;

  WeaponResult({
    this.weapon,
    this.kills,
    this.precisionKills,
    this.precisionKillsRatio
  });

  String toJson() {
    return '{'
      '"kills":$kills,'
      '"precisionKills":$precisionKills,'
      '"precisionKillsRatio":$precisionKillsRatio,'
      '"weapon":${weapon.toJson()}'
    '}';
  }
}