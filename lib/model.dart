class Supamodel {
  int? id;
  String? name;
  String? username;

  Supamodel({required this.name, required this.username, this.id});

  factory Supamodel.fromSupa(Map<String, dynamic> supabase) {
    return Supamodel(
        name: supabase['name'],
        username: supabase['username'],
        id: supabase['id']);
  }

  Map<String, dynamic> toSupabase() {
    return {'name': name, 'username': username};
  }
}
