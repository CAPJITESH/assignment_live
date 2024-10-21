import 'package:assignment/screens/add_node/add_notes.dart';
import 'package:assignment/screens/all_notes/note_card.dart';
import 'package:assignment/screens/edit_notes/edit_note.dart';
import 'package:flutter/material.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  List<Map<String, dynamic>> todoList = [
    {'title': "Notes 1", 'desc': " descs ", "is_completed": false},
  ];

  List<bool> showButtons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "All Notes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) => AddNotes(todoList: todoList),
                    ),
                  )
                      .then((onValue) {
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add Note",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return NoteCard(
                    data: todoList[index],
                    onCompleted: () {
                      setState(() {
                        todoList[index]['is_completed'] = true;
                      });
                    },
                    onEdit: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EditNote(todoList: todoList, index: index),
                        ),
                      )
                          .then((onavlue) {
                        setState(() {});
                      });
                    },
                    onDelete: () {
                      todoList.removeAt(index);
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
