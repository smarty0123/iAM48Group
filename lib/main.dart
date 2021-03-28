import 'package:flutter/material.dart';
import 'Member.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "iAM48",
        home: MyHomePage(),
        theme: ThemeData(primarySwatch: Colors.green));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Member> members;
  @override
  void initState() {
    super.initState();
    getMembersProfile();
  }

  Future<void> getMembersProfile() async {
    var url = Uri.parse('https://public.bnk48.io/members/all');
    var response = await http.get(url);
    setState(() {
      members = memberFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("สมาชิกวง",
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      ),
      body: members?.length == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: members?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Member member = members[index];
                    return ListTile(
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                member?.brand.toString() == "Brand.BNK48"
                                    ? Colors.purple.shade200
                                    : Colors.teal.shade200,
                            backgroundImage:
                                NetworkImage(member?.profileImageUrl)),
                        title: Text("${member?.displayName}",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                        subtitle: Text("${member?.subtitle}"),
                        onTap: () => {
                              print("Id ${member?.id} clicked")
                              //TODO: Go to another page
                            });
                  }),
            ),
    );
  }
}
