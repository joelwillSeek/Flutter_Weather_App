import 'package:flutter/material.dart';

class SearchAndFilter extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function searchClicked;

  const SearchAndFilter(
      {super.key,
      required this.textEditingController,
      required this.searchClicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
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
          child: ElevatedButton(
            onPressed: () {
              searchClicked();
            },
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20.0))),
            child: const Icon(Icons.sunny),
          ),
        )
      ],
    );
  }
}
