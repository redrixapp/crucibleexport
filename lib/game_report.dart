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


  int grenadeKills = 0;
  int superKills = 0;
  int meleeKills = 0;
  int abilityKills = 0;

  int precisionKills = 0;

  int id;
  int result;
  String resultDisplay;
  DateTime period;

  double killsDeaths = 0;
  double killsDeathsAssists = 0;
  double efficiency = 0;
  int kills = 0;
  int opponentsDefeated = 0;
  int assists = 0;
  int deaths = 0;
  bool completed = false;

  double averageScorePerKill = 0;
  double averageScorePerLife = 0;
  int activityDurationSeconds = 0;
  int timePlayedSeconds = 0;
  int score = 0;
  int totalMedalsEarned = 0;

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