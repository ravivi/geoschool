// // To parse this JSON data, do
// //
// //     final school = schoolFromJson(jsonString);

// import 'dart:convert';

// School schoolFromJson(String str) => School.fromJson(json.decode(str));



// class School {
//     School({
//          this.id,
//          this.statutetablissentId,
//          this.communeId,
//          this.ddId,
//          this.codeEtab,
//          this.nomEtab,
//          this.codeAdministratif,
//          this.numAutoCreation,
//          this.dateAutoCreation,
//          this.numAutoOuverture,
//          this.dateAutoOuverture,
//          this.dateOuverture,
//          this.adresseEtab,
//          this.telephoneEtab,
//          this.emailEtab,
//          this.bpEtab,
//          this.cellulaireEtab,
//          this.logoEtab,
//         this.longitude,
//         this.latitude,
//          this.createdAt,
//          this.updatedAt,
//          this.createdBy,
//          this.updatedBy,
//          this.active,
//          this.picture1,
//          this.picture2,
//          this.picture3,
//          this.picture4,
//          this.picture5,

//     });

//     int ?id;
//     int ?statutetablissentId;
//     int ?communeId;
//     int ?ddId;
//     String ?codeEtab;
//     String ?nomEtab;
//     String ?codeAdministratif;
//     String ?numAutoCreation;
//     String ?dateAutoCreation;
//     String ?numAutoOuverture;
//     String ?dateAutoOuverture;
//     String ?dateOuverture;
//     String ?adresseEtab;
//     String ?telephoneEtab;
//     String ?emailEtab;
//     String ?bpEtab;
//     String ?cellulaireEtab;
//     String ?logoEtab;
//     dynamic longitude;
//     dynamic latitude;
//     DateTime ?createdAt;
//     DateTime ?updatedAt;
//     String ?createdBy;
//     String ?updatedBy;
//     int ?active;
//     String? picture1;
//     String? picture2;
//     String? picture3;
//     String? picture4;
//     String? picture5;

//     factory School.fromJson(Map<String, dynamic> json) => School(
//         id: json["id"],
//         statutetablissentId: json["statutetablissent_id"],
//         communeId: json["commune_id"],
//         ddId: json["dd_id"],
//         codeEtab: json["code_etab"],
//         nomEtab: json["nom_etab"],
//         codeAdministratif: json["code_administratif"],
//         numAutoCreation: json["num_auto_creation"],
//         dateAutoCreation: json["date_auto_creation"],
//         numAutoOuverture: json["num_auto_ouverture"],
//         dateAutoOuverture: json["date_auto_ouverture"],
//         dateOuverture: json["date_ouverture"],
//         adresseEtab: json["adresse_etab"],
//         telephoneEtab: json["telephone_etab"],
//         emailEtab: json["email_etab"],
//         bpEtab: json["bp_etab"],
//         cellulaireEtab: json["cellulaire_etab"],
//         logoEtab: json["logo_etab"],
//         longitude: json["longitude"],
//         latitude: json["latitude"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         active: json["active"],
//         picture1: json["picture_1"],
//         picture2: json["picture_2"],
//         picture3: json["picture_3"],
//         picture4: json["picture_4"],
//         picture5: json["picture_5"],
//     );

   
// }













import 'dart:convert';

School schoolFromJson(String str) => School.fromJson(json.decode(str));


class School {
    int ?id;
    int ?statutetablissentId;
    int ?communeId;
    int ?ddId;
    String ?codeEtab;
    String ?nomEtab;
    String ?codeAdministratif;
    dynamic numAutoCreation;
    DateTime ?dateAutoCreation;
    String ?numAutoOuverture;
    DateTime ?dateAutoOuverture;
    DateTime ?dateOuverture;
    String ?adresseEtab;
    dynamic telephoneEtab;
    dynamic emailEtab;
    dynamic bpEtab;
    String ?cellulaireEtab;
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
    dynamic picture4;
    dynamic picture5;
    List<Filiere>? filieres;
    List<Cycle> ?cycles;
    List<dynamic>? series;
    Charts ?charts;

    School({
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
         this.filieres,
         this.cycles,
         this.series,
         this.charts,
    });

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        statutetablissentId: json["statutetablissent_id"],
        communeId: json["commune_id"],
        ddId: json["dd_id"],
        codeEtab: json["code_etab"],
        nomEtab: json["nom_etab"],
        codeAdministratif: json["code_administratif"],
        numAutoCreation: json["num_auto_creation"],
        // dateAutoCreation: DateTime.parse(json["date_auto_creation"]),
        numAutoOuverture: json["num_auto_ouverture"],
        //dateAutoOuverture: DateTime.parse(json["date_auto_ouverture"]),
        // dateOuverture: DateTime.parse(json["date_ouverture"]),
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
        filieres: List<Filiere>.from(json["filieres"].map((x) => Filiere.fromJson(x))),
        cycles: List<Cycle>.from(json["cycles"].map((x) => Cycle.fromJson(x))),
        series: List<dynamic>.from(json["series"].map((x) => x)),
        charts: Charts.fromJson(json["charts"]),
    );

}

class Charts {
    Charts();

    factory Charts.fromJson(Map<String, dynamic> json) => Charts(
    );

}

class Cycle {
    int ?id;
    String? libelleCycle;
    String? libelleAbbr;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;

    Cycle({
        this.id,
        this.libelleCycle,
        this.libelleAbbr,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
    });

    factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        libelleCycle: json["libelle_cycle"],
        libelleAbbr: json["libelle_abbr"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
    );

  
}

class Filiere {
    int? id;
    int ?etablissementId;
    int ?filiereId;
    int ?cycleId;
    int ?serieId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? createdBy;
    String? updatedBy;
    String? nomEtab;
    String? libelleCycle;
    String? libelleFiliere;

    Filiere({
        required this.id,
        required this.etablissementId,
        required this.filiereId,
        required this.cycleId,
        required this.serieId,
        required this.createdAt,
        required this.updatedAt,
        required this.createdBy,
        required this.updatedBy,
        required this.nomEtab,
        required this.libelleCycle,
        required this.libelleFiliere,
    });

    factory Filiere.fromJson(Map<String, dynamic> json) => Filiere(
        id: json["id"],
        etablissementId: json["etablissement_id"],
        filiereId: json["filiere_id"],
        cycleId: json["cycle_id"],
        serieId: json["serie_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        nomEtab: json["nom_etab"],
        libelleCycle: json["libelle_cycle"],
        libelleFiliere: json["libelle_filiere"],
    );


}
