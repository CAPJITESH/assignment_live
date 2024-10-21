import 'package:assignment/utils/textbox.dart';
import 'package:flutter/material.dart';

class EditNote extends StatefulWidget {
  final List<Map<String, dynamic>> todoList;
  final int index;
  const EditNote({super.key, required this.todoList, required this.index});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setData();
    super.initState();
  }

  void setData() {
    _titleController.text = widget.todoList[widget.index]['title'];
    _descController.text = widget.todoList[widget.index]['desc'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Add Note",
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(),
              const Text(
                "Edit Note",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Textbox(
                textEditingController: _titleController,
                hintText: "Title",
              ),
              const SizedBox(
                height: 20,
              ),
              Textbox(
                textEditingController: _descController,
                hintText: "Notes Description",
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.todoList[widget.index] = {
                    'title': _titleController.text,
                    "desc": _descController.text,
                    'is_completed': false,
                  };

                  setState(() {});
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Save Note",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
