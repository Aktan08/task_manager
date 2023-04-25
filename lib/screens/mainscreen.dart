import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/assets/images.dart';
import 'package:task_manager/repo/userRepozitor.dart';
import '../bloc/regis_bloc.dart';

List items = ['task1'];

class Mainpage extends StatelessWidget {
  const Mainpage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7C74FD),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 140),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Aktan ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    'Tugolbaev',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Container(
                      width: 57,
                      height: 57,
                      child: Image.network(
                          'https://blackpink.cafe/wp-content/uploads/2022/11/blackpink-221116-jennie-elle-usa-december-january-2022-5.jpg')),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Container(child: MySearchfiled(text: '   search')),
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 270,
                child: ListView.builder(
                  itemCount: items.length,
                  prototypeItem: Container(
                    child: Text("task"),
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(items[index]),
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 330,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          items.add('taskkdcnsjkdncvdajksncakncaklnckd');
                          BlocProvider.of<RegisBloc>(context)
                              .add(AddButtonEvent());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MySearchfiled extends StatelessWidget {
  MySearchfiled({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: text,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    );
  }
}
