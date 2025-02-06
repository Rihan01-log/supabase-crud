import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase1/model.dart';
import 'package:supabase1/provider.dart';
import 'package:supabase1/update.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Supapprovider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController username = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          ElevatedButton(
              onPressed: () {
                Provider.of<Supapprovider>(context, listen: false).addData(
                    Supamodel(name: name.text, username: username.text));
                name.clear();
                username.clear();
              },
              child: Text('submit')),
          Expanded(
              child: Consumer<Supapprovider>(
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.user.length,
                      itemBuilder: (context, index) {
                        final data = value.user[index];
                        final id = data.id;
                        return Card(
                          child: ListTile(
                            title: Text(data.name!),
                            subtitle: Text(data.username!),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Update(
                                              id: id,
                                              name: name.text,
                                              username: username.text,
                                            ),
                                          ));
                                    },
                                    icon: Icon(Icons.edit)),
                                    IconButton(onPressed: () {
                                      value.deleteData(data.id!);
                                    }, icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        );
                      })))
        ],
      ),
    );
  }
}
