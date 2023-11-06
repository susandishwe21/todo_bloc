import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: buildToDoListRecord(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget buildToDoListRecord() {
    return Container(
      child: ListView.separated(
        itemBuilder: (context, index) => Row(
          children: [
            Icon(
              Icons.check_box_outline_blank_rounded,
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              child: Text(
                " Hello Do",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.edit, color: Theme.of(context).colorScheme.primary),
            SizedBox(width: 10),
            Icon(Icons.delete, color: Colors.red)
          ],
        ),
        separatorBuilder: (context, index) => Container(),
        itemCount: 10,
      ),
    );
  }
}
