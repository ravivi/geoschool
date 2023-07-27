import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/school_model.dart';

class DetailController extends GetxController {
  var school = Get.arguments as School;
  List<Filiere> cap = [],bep = [],bt = [],bp = [],bts = [],cqp = [],pcap = [],bac = [];

  @override
  void onInit() {
    school.filieres!.map((e) {
      if (e.libelleCycle == "Certificat d'Aptitude Professionnelle (CAP)") {
        cap.add(e);
      }
    }).toList();

    school.filieres!.map((e) {
      if (e.libelleCycle == "Brevet d'Etude Professionnelle (BEP)") {
        bep.add(e);
      }
    }).toList();

     school.filieres!.map((e) {
      if (e.libelleCycle == "Brevet d'Etude Professionnelle (BEP)") {
        bep.add(e);
      }
    }).toList();

       school.filieres!.map((e) {
      if (e.libelleCycle == "Brevet de Technicien(BT)") {
        bt.add(e);
      }
    }).toList();

    school.filieres!.map((e) {
      if (e.libelleCycle == "Brevet de Technicien Supérieur (BTS)") {
        bts.add(e);
      }
    }).toList();

    school.filieres!.map((e) {
      if (e.libelleCycle == "Brevet Professionnel(BP)") {
        bp.add(e);
      }
    }).toList();
    school.filieres!.map((e) {
      if (e.libelleCycle == "Certificat de Qualification Professionnelle(CQP)") {
        cqp.add(e);
      }
    }).toList();

     school.filieres!.map((e) {
      if (e.libelleCycle == "Prépa-CAP") {
        pcap.add(e);
      }
    }).toList();

     school.filieres!.map((e) {
      if (e.libelleCycle == "Baccalauréat") {
        bac.add(e);
      }
    }).toList();

    print("=====================>$cap");
    print("=====================>$bep");
    print("=====================>$bt");
    print("=====================>$bts");
    print("=====================>$bp");
    print("=====================>$cqp");
    print("=====================>$pcap");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
