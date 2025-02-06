import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase1/model.dart';
import 'package:supabase1/provider.dart';

// ignore: must_be_immutable
class Update extends StatefulWidget {
  int? id;
  String? name;
  String? username;
  Update(
      {super.key,
      required this.id,
      required this.name,
      required this.username});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    username = TextEditingController(text: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: username,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<Supapprovider>(
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.updataData(
                        Supamodel(name: name.text, username: username.text),
                        widget.id!);
                    Navigator.pop(context);
                  },
                  child: Text('Save')))
        ],
      ),
    );
  }
}
