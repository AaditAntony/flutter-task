// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Bottomtile extends StatefulWidget {
  const Bottomtile({super.key});

  @override
  State<Bottomtile> createState() => _BottomtileState();
}

class _BottomtileState extends State<Bottomtile> {
  List<String> letters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  @override
  Widget build(BuildContext context) {
    // for building the alpabetical container inorder to sort the name
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: letters.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(4, 4),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: const Offset(-4, -4),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]),
            child: Center(
                child: Text(
              letters[index],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }
}
