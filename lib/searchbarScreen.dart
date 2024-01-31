import 'package:flutter/material.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});
  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}
class _SearchBarScreenState extends State<SearchBarScreen> {
    final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];
  List<Map<String,dynamic>> _searchUsers=[];
  @override
initState(){
  _searchUsers=List.from(_allUsers);
  super.initState();
}
 void _search(String enteredKey) {
  List<Map<String, dynamic>> results = [];

  if (enteredKey.isEmpty) {
    results = List.from(_allUsers);
  } 

  else {
    results = _allUsers
        .where((user) =>
            user["name"].toString().toLowerCase().contains(enteredKey.toLowerCase()) ||
            user["id"].toString().toLowerCase().contains(enteredKey.toLowerCase()) ||
             user["age"].toString().toLowerCase().contains(enteredKey.toLowerCase())
            )
        .toList();
  }

  setState(() {
    _searchUsers = results;
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                _search(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                itemCount: _searchUsers.length,
                itemBuilder: (context,index){
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    key:  ValueKey(_searchUsers[index]['id']),
                    elevation: 8,
                    child: ListTile(
                      leading: Text(
                       _searchUsers[index]['id'].toString(),
                      ),
                      title: Text(
                        _searchUsers[index]['name']
                      ),
                      subtitle: Text(
                        _searchUsers[index]['age'].toString() ,
                      ),
                    ),
                  );
                }),
              ),
            ],
        )
      ),
    );
  }
}
