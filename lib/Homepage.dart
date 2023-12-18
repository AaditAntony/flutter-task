// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:api_assignment/dataTile.dart';

import 'package:flutter/material.dart';


import 'BottomTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
          child: Stack(
        // for separating Api container and bottom container
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            child: DataTile(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  FloatingActionButton(
                    //   for entering  visitor details
                    onPressed: () {},
                    child: Icon(Icons.group_rounded),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    // for the function of payment and attendance
                    onPressed: () {},
                    child: Icon(Icons.attach_money_rounded),
                  )
                ],
              ),
            ),
          ),
          //for sorting the name in alphebitical order
          Container(height: 100, color: Colors.grey, child: Bottomtile()),
        ],
      )),
    );
  }
}
