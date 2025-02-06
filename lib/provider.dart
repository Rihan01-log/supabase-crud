import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase1/model.dart';
import 'package:supabase1/service.dart';

class Supapprovider extends ChangeNotifier {
  Supaservice service = Supaservice();
  List<Supamodel> user = [];

  Future<void> addData(Supamodel data) async {
    try {
      await service.addData(data);
      user.add(data);
      log('added in provider${user.length}');
      getData();
      notifyListeners();
    } catch (e) {
      log('$e');
    }
  }

  Future<void> getData() async {
    try {
      user = await service.getAllData();
      //   log('data not getting in provider');
      notifyListeners();
    } catch (e) {
      log('$e');
    }
  }

  Future<void> updataData(Supamodel data, int id) async {
    try {
      await service.update(data, id);
      getData();
      notifyListeners();
      log('upadted in provider');
    } catch (e) {
      log('error in upadted provider:$e');
    }
  }

  Future<void> deleteData(int id) async {
    try {
      await service.delete(id);
      getData();
      notifyListeners();
      log('Deleted');
    } catch (e) {
      log('error in deleting in provider');
    }
  }
}
