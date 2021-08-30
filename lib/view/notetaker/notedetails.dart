import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_flutterapp/models/Note.dart';
import 'package:mvvm_flutterapp/sqfliteflutter/sqflitedatabase.dart';
import 'package:mvvm_flutterapp/view/notetaker/addeditnote.dart';

class NoteDetailPage extends StatefulWidget {
  // final Note? note;
  final int noteId;

  const NoteDetailPage({Key? key, required this.noteId,}) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  @override
  Widget build(BuildContext context) => Scaffold (

    backgroundColor: Colors.black,

    appBar: AppBar(
      title: Text('NOTE DETAILS'),
      actions: [editButton(), deleteButton()],
    ),

    body: isloading ? Center(child: CircularProgressIndicator(),)
        : Padding(
        padding: EdgeInsets.all(12),

        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),

          children: [
            Text(note.title, style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,),),

            SizedBox(height: 8),

            Text(
              DateFormat.yMMMd().format(note.createdTime),
              style: TextStyle(color: Colors.white38,),
            ),

            SizedBox(height: 8),

            Text(
              note.description,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            )



          ],
        )
    )

  );

 Widget editButton() => IconButton(
      icon:  Icon(Icons.edit_outlined),

      onPressed: () async{

        if(isloading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNote(note: note),
        ));
        refreshNote();
      },

  );

 Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    onPressed: ()async{

      await MyNoteDataBase.instance.delete(widget.noteId);

      Navigator.of(context).pop;
    },
  );


  Future refreshNote() async {

    setState(() => isloading = true);
    
    this.note = await MyNoteDataBase.instance.readNote(widget.noteId);

    setState(() => isloading = false);

  }

}
