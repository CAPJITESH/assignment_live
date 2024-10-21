import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final VoidCallback onCompleted, onEdit, onDelete;

  const NoteCard({
    super.key,
    required this.data,
    required this.onCompleted,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.data['is_completed']
            ? Colors.grey
            : const Color.fromARGB(255, 194, 217, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          setState(() {
            showButtons = !showButtons;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data['title'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(
                    CupertinoIcons.delete,
                    color: Color.fromARGB(255, 45, 45, 45),
                    size: 25,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
              indent: 10,
              endIndent: 10,
            ),
            Text(
              widget.data['desc'],
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            if (showButtons)
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (!widget.data['is_completed'])
                        ElevatedButton(
                          onPressed: widget.onCompleted,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: const Size(150, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Completed",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: widget.onEdit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
