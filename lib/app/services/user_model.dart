// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User? data) => json.encode(data!.toJson());

class User {
    User({
        this.employelogin,
        this.token,
    });

    Employelogin? employelogin;
    String? token;

    factory User.fromJson(Map<String, dynamic> json) => User(
        employelogin: Employelogin.fromJson(json["employelogin"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "employelogin": employelogin!.toJson(),
        "token": token,
    };
}

class Employelogin {
    Employelogin({
        this.deleted,
        this.isAdmin,
        this.id,
        this.nom,
        this.prenom,
        this.role,
        this.travailPour,
        this.statut,
        this.email,
        this.numero,
        this.adresse,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    bool? deleted;
    bool? isAdmin;
    String? id;
    String? nom;
    String? prenom;
    String? role;
    String? travailPour;
    String? statut;
    String? email;
    String? numero;
    String? adresse;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Employelogin.fromJson(Map<String, dynamic> json) => Employelogin(
        deleted: json["deleted"],
        isAdmin: json["isAdmin"],
        id: json["_id"],
        nom: json["nom"],
        prenom: json["prenom"],
        role: json["role"],
        travailPour: json["travail_pour"],
        statut: json["statut"],
        email: json["email"],
        numero: json["numero"],
        adresse: json["adresse"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "deleted": deleted,
        "isAdmin": isAdmin,
        "_id": id,
        "nom": nom,
        "prenom": prenom,
        "role": role,
        "travail_pour": travailPour,
        "statut": statut,
        "email": email,
        "numero": numero,
        "adresse": adresse,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
