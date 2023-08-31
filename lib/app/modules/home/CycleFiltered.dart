// To parse this JSON data, do
//
//     final cycleFiltered = cycleFilteredFromJson(jsonString);

import 'dart:convert';

CycleFiltered cycleFilteredFromJson(String str) =>
    CycleFiltered.fromJson(json.decode(str));

class CycleFiltered {
  List<FilteredCycle> filteredCycle;

  CycleFiltered({
    required this.filteredCycle,
  });

  factory CycleFiltered.fromJson(Map<String, dynamic> json) => CycleFiltered(
        filteredCycle: List<FilteredCycle>.from(json["query"].map((x) => FilteredCycle.fromJson(x))),
      );
}

class FilteredCycle {
  int? id;
  String? libelleCycle;
  String? libelleAbbr;
  List<FilteredFiliere>? filieres;
  List<FilteredSchool>? schools;

  FilteredCycle({
     this.id,
     this.libelleCycle,
     this.libelleAbbr,
     this.filieres,
     this.schools,
  });

  factory FilteredCycle.fromJson(Map<String, dynamic> json) => FilteredCycle(
        id: json["id"],
        libelleCycle: json["libelle_cycle"],
        libelleAbbr: json["libelle_abbr"],
        filieres: 
        // List<FilteredFiliere>.from(
        //     json["filieres"].map((x) => FilteredFiliere.fromJson(x))),
           (json["filieres"] as List).map((i) => FilteredFiliere.fromJson(i)).toList(),
        schools:
            // List<FilteredSchool>.from(json["schools"].map((x) => FilteredSchool.fromJson(x))),
            (json["schools"] as List).map((i) => FilteredSchool.fromJson(i)).toList(),
      );
}

class FilteredFiliere {
  int? id;
  int? etablissementId;
  int? filiereId;
  int? cycleId;
  int? serieId;
  String? nomEtab;
  String? libelleCycle;
  String? libelleFiliere;

  FilteredFiliere({
     this.id,
     this.etablissementId,
     this.filiereId,
     this.cycleId,
     this.serieId,
     this.nomEtab,
     this.libelleCycle,
     this.libelleFiliere,
  });

  factory FilteredFiliere.fromJson(Map<String, dynamic> json) => FilteredFiliere(
        id: json["id"],
        etablissementId: json["etablissement_id"],
        filiereId: json["filiere_id"],
        cycleId: json["cycle_id"],
        serieId: json["serie_id"],
        nomEtab: json["nom_etab"],
        libelleCycle: json["libelle_cycle"],
        libelleFiliere: json["libelle_filiere"],
      );
}

class FilteredSchool {
  int ?id;
  int ?statutetablissentId;
  int ?communeId;
  int ?ddId;
  String ?codeEtab;
  String ?nomEtab;
  dynamic codeAdministratif;
  dynamic numAutoCreation;
  DateTime ?dateAutoCreation;
  dynamic numAutoOuverture;
  DateTime ?dateAutoOuverture;
  DateTime? dateOuverture;
  String ?adresseEtab;
  dynamic telephoneEtab;
  dynamic emailEtab;
  dynamic bpEtab;
  dynamic cellulaireEtab;
  String ?logoEtab;
  double ?longitude;
  double ?latitude;
  DateTime ?createdAt;
  DateTime ?updatedAt;
  String ?createdBy;
  String ?updatedBy;
  int ?active;
  String ?picture1;
  String ?picture2;
  String ?picture3;
  String ?picture4;
  String ?picture5;

  FilteredSchool({
     this.id,
     this.statutetablissentId,
     this.communeId,
     this.ddId,
     this.codeEtab,
     this.nomEtab,
     this.codeAdministratif,
     this.numAutoCreation,
     this.dateAutoCreation,
     this.numAutoOuverture,
     this.dateAutoOuverture,
     this.dateOuverture,
     this.adresseEtab,
     this.telephoneEtab,
     this.emailEtab,
     this.bpEtab,
     this.cellulaireEtab,
     this.logoEtab,
     this.longitude,
     this.latitude,
     this.createdAt,
     this.updatedAt,
     this.createdBy,
     this.updatedBy,
     this.active,
     this.picture1,
     this.picture2,
     this.picture3,
     this.picture4,
    this.picture5,
  });

  factory FilteredSchool.fromJson(Map<String, dynamic> json) => FilteredSchool(
        id: json["id"],
        statutetablissentId: json["statutetablissent_id"],
        communeId: json["commune_id"],
        ddId: json["dd_id"],
        codeEtab: json["code_etab"],
        nomEtab: json["nom_etab"],
        codeAdministratif: json["code_administratif"],
        numAutoCreation: json["num_auto_creation"],
        dateAutoCreation: DateTime.parse(json["date_auto_creation"]),
        numAutoOuverture: json["num_auto_ouverture"],
        dateAutoOuverture: DateTime.parse(json["date_auto_ouverture"]),
        dateOuverture: DateTime.parse(json["date_ouverture"]),
        adresseEtab: json["adresse_etab"],
        telephoneEtab: json["telephone_etab"],
        emailEtab: json["email_etab"],
        bpEtab: json["bp_etab"],
        cellulaireEtab: json["cellulaire_etab"],
        logoEtab: json["logo_etab"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        active: json["active"],
        picture1: json["picture_1"],
        picture2: json["picture_2"],
        picture3: json["picture_3"],
        picture4: json["picture_4"],
        picture5: json["picture_5"],
      );
}
