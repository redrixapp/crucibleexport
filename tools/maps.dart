
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

String _seperator = ",";
String _lineSeperator = "\n";

String _outputPath = "map_history";

void main(List<String> args) async {
  ArgParser parser = ArgParser();

  parser.addOption("input", abbr: "i");
  parser.addOption("output", abbr: "o");

  ArgResults results;
  try {
    results = parser.parse(args);
  } catch(e) {
    printUsage();
    exit(2);
  }

  String inputPath = results["input"];
  if(inputPath == null) {
    printUsage();
    exit(2);
  }

  if(results["output"] != null) {
    _outputPath = results["output"];
  }

  Map<String, dynamic> jData = await loadData(inputPath);

  List<dynamic> reports = jData["reports"];

  Map<String, MapData> maps = {};
  for(Map r in reports) {

    Map report = r["report"];
    String mapName = report["mapName"];

    MapData d = maps[mapName];

    if(d == null) {
      d = MapData(name:mapName);
      maps[mapName] = d;
    }

    d.kills += report["kills"];
    d.deaths += report["deaths"];
    d.assists += report["assists"];
    d.count += 1;
    d.medals += report["totalMedalsEarned"];
    d.precisionKills += report["precisionKills"];
    d.superKills += report["superKills"];

    String resultDisplay = report["result"];
    if(resultDisplay == "Victory") {
      d.wins += 1;
    } else if(resultDisplay == "Defeat") {
      d.losses += 1;
    } else {
      d.draws += 1;
    }
  }

  await writeCSV("$_outputPath.csv", maps);
}

void printUsage() {
  print(
    "dart maps.dart --input JSONDATAFILE [--output OUTPUTPATH]"
    );
}

String createCSVHeader() {

  String out = "MAP$_seperator"
        "PLAYED$_seperator"
        "WINS$_seperator"
        "LOSSES$_seperator"
        "DRAWS$_seperator"
        "WIN_PERCENT$_seperator"
        "KILLS$_seperator"
        "KILLS_GAME$_seperator"
        "DEATHS$_seperator"
        "DEATHS_GAME$_seperator"
        "ASSISTS$_seperator"
        "ASSISTS_GAME$_seperator"
        "KD$_seperator"
        "KAD$_seperator"
        "MEDALS_GAME$_seperator"
        "PRECISION_KILLS$_seperator"
        "PRECISION_KILLS_GAME$_seperator"
        "SUPER_KILLS$_seperator"
        "SUPER_KILLS_GAME$_seperator"
        "$_lineSeperator";
        //"${report.weaponResults}";
      return out;
}

String createCSVRow(MapData map) {

  String out = "${map.name}$_seperator"
        "${map.count}$_seperator"
        "${map.wins}$_seperator"
        "${map.losses}$_seperator"
        "${map.draws}$_seperator"
        "${(map.wins / map.count)}$_seperator"
        "${map.kills}$_seperator"
        "${map.kills / map.count}$_seperator"
        "${map.deaths}$_seperator"
        "${map.deaths / map.count}$_seperator"
        "${map.assists}$_seperator"
        "${map.assists / map.count}$_seperator"
        "${map.kills/map.deaths}$_seperator"
        "${(map.kills + map.assists)/map.deaths}$_seperator"
        "${map.medals/map.count}$_seperator"
        "${map.precisionKills}$_seperator"
        "${map.precisionKills/map.count}$_seperator"
        "${map.superKills}$_seperator"
        "${map.superKills/map.count}$_seperator"
        "$_lineSeperator";
      return out;
}

Future<void> writeCSV(String path, Map<String, MapData> maps) async {

  StringBuffer buffer = StringBuffer(createCSVHeader());

  maps.forEach((k, MapData v){
    buffer.write(createCSVRow(v));
  });

  String csv = buffer.toString();

  File f = new File(path);
  await f.writeAsString(csv);
}

Future<Map<String, dynamic>> loadData(String path) async {

  File f = File(path);

  if(!f.existsSync()) {
    printUsage();
    exit(2);
  }

  String data = await f.readAsString();

  Map<String, dynamic> out;
  try {
    out = jsonDecode(data);
  } catch(e) {
    print("Error parsing JSON file.");
    exit(2);
  }

  return out;
}

class MapData {
  String name;
  int kills = 0;
  int deaths = 0;
  int assists = 0;
  int count = 0;
  int medals = 0;

  int wins = 0;
  int losses = 0;
  int draws = 0;

  int precisionKills = 0;
  int superKills = 0;

  MapData({this.name});
}