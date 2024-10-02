
import 'package:flutter/cupertino.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> Formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ? title , subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: Formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children:  [
         const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value){
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value){
              subtitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            onTap: (){
              if(Formkey.currentState!.validate()){
                Formkey.currentState!.save();
                print(title);
                print(subtitle);
              }
              else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                });
              }
            },
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
