// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  List<dynamic>? errorCodes;
  Data? data;

  TestModel({
    this.errorCodes,
    this.data,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        errorCodes: json["errorCodes"] == null
            ? []
            : List<dynamic>.from(json["errorCodes"]!.map((x) => x)),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "errorCodes": errorCodes == null
            ? []
            : List<dynamic>.from(errorCodes!.map((x) => x)),
        "data": data?.toJson(),
      };
}

class Data {
  List<ListElement>? list;

  Data({
    this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? id;
  int? line;
  List<Element>? elements;
  String? name;
  String? description;
  String? listId;
  String? keyword;
  String? uri;
  List<String>? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ListElement({
    this.id,
    this.line,
    this.elements,
    this.name,
    this.description,
    this.listId,
    this.keyword,
    this.uri,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        line: json["line"],
        elements: json["elements"] == null
            ? []
            : List<Element>.from(
                json["elements"]!.map((x) => Element.fromJson(x))),
        name: json["name"],
        description: json["description"],
        listId: json["id"],
        keyword: json["keyword"],
        uri: json["uri"],
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "line": line,
        "elements": elements == null
            ? []
            : List<dynamic>.from(elements!.map((x) => x.toJson())),
        "name": name,
        "description": description,
        "id": listId,
        "keyword": keyword,
        "uri": uri,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Element {
  DateTime? startTimestamp;
  int? line;
  String? name;
  String? description;
  String? elementId;
  String? type;
  String? keyword;
  List<TestSteps>? steps;
  List<Tag>? tags;
  String? id;

  Element({
    this.startTimestamp,
    this.line,
    this.name,
    this.description,
    this.elementId,
    this.type,
    this.keyword,
    this.steps,
    this.tags,
    this.id,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        startTimestamp: json["start_timestamp"] == null
            ? null
            : DateTime.parse(json["start_timestamp"]),
        line: json["line"],
        name: json["name"],
        description: json["description"],
        elementId: json["id"],
        type: json["type"],
        keyword: json["keyword"],
        steps: json["steps"] == null
            ? []
            : List<TestSteps>.from(
                json["steps"]!.map((x) => TestSteps.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "start_timestamp": startTimestamp?.toIso8601String(),
        "line": line,
        "name": name,
        "description": description,
        "id": elementId,
        "type": type,
        "keyword": keyword,
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "_id": id,
      };
}

class TestSteps {
  Result? result;
  Match? match;
  int? line;
  String? name;
  String? keyword;
  String? id;

  TestSteps({
    this.result,
    this.match,
    this.line,
    this.name,
    this.keyword,
    this.id,
  });

  factory TestSteps.fromJson(Map<String, dynamic> json) => TestSteps(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        match: json["match"] == null ? null : Match.fromJson(json["match"]),
        line: json["line"],
        name: json["name"],
        keyword: json["keyword"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "match": match?.toJson(),
        "line": line,
        "name": name,
        "keyword": keyword,
        "_id": id,
      };
}

class Match {
  String? location;

  Match({
    this.location,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
      };
}

class Result {
  String? status;

  Result({
    this.status,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class Tag {
  String? name;

  Tag({
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
