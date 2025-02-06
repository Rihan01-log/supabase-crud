import 'dart:developer';

import 'package:supabase1/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supaservice {
  final supabaseData = Supabase.instance.client.from('rihan');

  Future<List<Supamodel>> getAllData() async {
    try {
      final response = await supabaseData.select('*');
      log(response.toString());
      return response.map((e) => Supamodel.fromSupa(e)).toList();
    } catch (e) {
      log('error in getting data:$e');
    }
    return [];
  }

  Future<void> addData(Supamodel data) async {
    try {
      await supabaseData.insert([data.toSupabase()]);
      getAllData();
      log('data added');
    } catch (e) {
      log('error in adding:$e');
    }
  }

  Future<void> update(Supamodel data, int id) async {
    try {
      await supabaseData.update(data.toSupabase()).eq('id', id);
      getAllData();
      log('service deleted');
    } catch (e) {
      log('$e');
    }
  }
}
