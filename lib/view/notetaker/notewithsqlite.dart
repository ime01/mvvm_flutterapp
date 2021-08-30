
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_flutterapp/models/Note.dart';
import 'package:mvvm_flutterapp/sqfliteflutter/sqflitedatabase.dart';
import 'package:mvvm_flutterapp/view/notetaker/widget/note_card_widget.dart';

import 'addeditnote.dart';
import 'notedetails.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    MyNoteDataBase.instance.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(title: Text('SQFlite NoteSaver', style: TextStyle(fontSize: 24),),

      actions: [Icon(Icons.search), SizedBox(width: 12)],),

      body: Center(
        child: isLoading ? CircularProgressIndicator()
            : notes.isEmpty
            ?Text('NO NOTES TO DISPLAY', style: TextStyle(color: Colors.white,),)
            : buildNotes(),
      ),

      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.green,

        child: Icon(Icons.add),

        onPressed: ()async{
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddEditNote()));

          refreshNotes();
        },
      ),
    );
  }

  Future refreshNotes() async{

    setState(() => isLoading = true);
    this.notes = await MyNoteDataBase.instance.readAllNotes();

    setState(() => isLoading = false);

  }

 Widget buildNotes() => StaggeredGridView.countBuilder(
     padding: EdgeInsets.all(8),
     itemCount: notes.length,
     crossAxisCount: 4,
     mainAxisSpacing: 4,
     crossAxisSpacing: 4,
     staggeredTileBuilder: (index) => StaggeredTile.fit(2),
     itemBuilder: (context, index){

       final note = notes[index];

       return GestureDetector(
         onTap: () async{
           await Navigator.of(context).push(
               MaterialPageRoute(builder: (context) => NoteDetailPage(noteId: note.id! ),));

         },

         child: NoteCardWidget(note: note, index: index),

       );
     },
 );

}


