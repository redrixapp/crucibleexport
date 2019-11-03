/*
 * Copyright 2019 Mike Chambers, Grant Skinner
 * Released under an MIT License
 * https://opensource.org/licenses/MIT
 */

import "medal_result.dart";
import "weapon_result.dart";
import "experience_type.dart";


class GameReport {


  String mapName;
  String modeName;
  int experienceType;

  //*********** */


  int grenadeKills;
  int superKills;
  int meleeKills;
  int abilityKills;

  int precisionKills;

  int id;
  int result;
  String resultDisplay;
  DateTime period;

  double killsDeaths;
  double killsDeathsAssists;
  double efficiency;
  int kills;
  int opponentsDefeated;
  int assists;
  int deaths;
  bool completed = false;

  double averageScorePerKill;
  double averageScorePerLife;
  int activityDurationSeconds;
  int timePlayedSeconds;
  int score;
  int totalMedalsEarned;

  int teamScore;
  int opponentScore;

  List<MedalResult> medalResults;
  List<WeaponResult> weaponResults;

  String toJson() {

    StringBuffer b = StringBuffer("[");
    for(MedalResult mr in medalResults) {
      b.write(mr.toJson());

      if(mr != medalResults.last) {
        b.write(",");
      }
    }
    b.write("]");

    String medalResultsJson = b.toString();

    b = StringBuffer("[");
    for(WeaponResult wr in weaponResults) {
      b.write(wr.toJson());

      if(wr != weaponResults.last) {
        b.write(",");
      }
    }

    b.write("]");

    String weaponResultsJson = b.toString();

    String json = '{'
      '"mapName":"$mapName",'
      '"modeName":"$modeName",'
      '"experienceType":"${ExperienceType.labelFromType(experienceType)}",'
      '"precisionKills":$precisionKills,'
      '"superKills":$superKills,'
      '"id":$id,'
      '"result":"$resultDisplay",'
      '"date":"${period.toString()}",'
      '"killsDeaths":$killsDeaths,'
      '"killsDeathsAssists":$killsDeathsAssists,'
      '"efficiency":$efficiency,'
      '"kills":$kills,'
      '"deaths":$deaths,'
      '"opponentsDefeated":$opponentsDefeated,'
      '"assists":$assists,'
      '"completed":$completed,'
      '"averageScorePerKill":$averageScorePerKill,'
      '"averageScorePerLife":$averageScorePerLife,'
      '"activityDuration":$activityDurationSeconds,'
      '"score":$score,'
      '"totalMedalsEarned":$totalMedalsEarned,'
      '"teamScore":$teamScore,'
      '"opponentScore":$opponentScore,'
      '"medalResults":$medalResultsJson,'
      '"weaponResults":$weaponResultsJson'
    '}';

    return json;
  }
}