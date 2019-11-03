# Crucible activity export command line tools

A collection of Dart based command line tools for aggregating and viewing Destiny 2 
crucible PVP data.

*  **ce.dart** : Downloads and exports historical Destiny 2 Crucible activity data.
*  **maps.dart** : Takes data from ce.dart and exports map specific views of data.


## Included Tools

### ce.dart
ce.dart is a command line tool for downloading and exporting historical Destiny 2
Crucible activity data for users.

It can export all data across characters, filter by class, and output in both csv and json format.

#### Prerequisites

* [Dart runtime](https://dart.dev/)
* Destiny 2 [API key from Bungie](https://www.bungie.net/en/Application)

#### Usage

```
dart ce.dart --apikey APIKEY --platform [xbox|psn|steam] --tag [GAMERTAG|STEAM64ID]
[--verbose]
[--hunter|--titan|--warlock]
[--csv|--json]
[--output OUTPUTPATH]
[--help]
```

#### Example

```
dart ce.dart --apikey 3473846378463874376423 --platform xbox --tag mesh --hunter --json --verbose
```

This will export crucible data in json format for mesh's hunter playing on xbox, and output extra information while running.

#### Options

* **--apikey APIKEY** : Required. API key from Bungie.
* **--platform [xbox|psn|steam]** : Required. The platform that the specified user is playing Destiny 2 on.
* **--tag [GAMERTAG|STEAM64ID]** : Required. The gamertag, or on PC the [Steam64 Id](https://redrix.io/steam/) for the user.
* **--verbose** : Output additional information while running.
* **[--hunter|--titan|--warlock]** : Specify one o
r more classes which data should be retrieved for. If none are specified, all will be retrieved.
* **[--csv|--json]** : Data format for exported data. If nothing is specified, data will be exported as csv.
* **[--output OUTPUTPATH]** Output file path that the file will be saved to. File will have appropriate file extension added to it (csv or json).
* **[--help]** : Print out help information

Note, when exporting as CSV format, medal and weapon information is not included.

### maps.dart

maps.dart takes json data exported from ce.dart, and creates a CSV file which aggregates crucible
data broken down by crucible map.

#### Prerequisites

* [Dart runtime](https://dart.dev/)

#### Usage

```
dart maps.dart --input JSONDATAFILE [--output OUTPUTPATH]
```


## License

Copyright 2019 Mike Chambers, Grant Skinner  
Released under an MIT License  
[https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT)  

