import 'dart:convert';
import 'dart:io';

import 'package:api_assignment/userDetails.dart';
import 'package:api_assignment/userModel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataTile extends StatefulWidget {
  const DataTile({super.key});

  @override
  State<DataTile> createState() => _DataTileState();
}

class _DataTileState extends State<DataTile> {
  Map? login;
  Map? data;

  String word = 'yes';
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // for fecting the api details of name and image of persons
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: data!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return UserDetails(); // function of getting more userdetails from api
                },
              ));
            },
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(4, 4),
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(-4, -4),
                      blurRadius: 3,
                      spreadRadius: 2,
                    )
                  ]),
              child: Center(
                  child: Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        dynamic top = await fetchData();
                        setState(() {
                          word = top.username ?? 'not working';
                          print(word.toString());
                        });
                      },
                      child: Text('click here')),
                  SizedBox(
                    height: 7,
                  ),
                  Text(word.toString()),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(title: Text('yep may be'));
                          },
                        );
                      },
                      icon: Icon(
                        Icons.ac_unit_outlined,
                        color: Colors.yellow,
                      ))
                ],
              )),
            ),
          ),
        );
      },
    );
  }

  Future<Login?> fetchData() async {
    print('e');
    Login? login;
    try {
      final response = await http.get(
          Uri.parse(' https://randomuser.me/api/?results=100&gender=male'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        login = Login.fromJson(data);
      }
    } catch (exception) {
      print(exitCode);
    }
    return login;

    // final body = response.body;
    // final jsonbody = jsonDecode(body) as Map<String, dynamic>;
    // final data = Login.fromJson(jsonbody);
    // print('ok ita s test');
    // return data;
  }
}
