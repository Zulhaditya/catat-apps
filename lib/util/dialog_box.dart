import 'package:flutter/material.dart';
import 'package:notes_app/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final controllerDesc;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.controllerDesc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 61, 59, 70),
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Judul Catatan",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 212, 205, 205))),
            ),

            TextField(
              controller: controllerDesc,
              minLines: 5,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Deskripsi",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 212, 205, 205))),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Simpan", onPressed: onSave),

                const SizedBox(
                  width: 7,
                ),

                // cancel button
                MyButton(text: "Batal", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
