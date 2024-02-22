import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter A City"),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: const ElevatedButton(
            onPressed: null,
            style: ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20.0))),
            child: Icon(Icons.sunny),
          ),
        )
      ],
    );
  }
}
