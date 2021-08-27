import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutterapp/models/Note.dart';

class AddEditNote extends StatefulWidget {

  final Note? note;


  const AddEditNote({Key? key, this.note}) : super(key: key);

  @override
  _AddEditNoteState createState() => _AddEditNoteState();
}

class _AddEditNoteState extends State<AddEditNote> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
