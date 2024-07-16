import 'package:invoice_genetator/header_files.dart';

Widget Texformfield(
    {required hintText,
    required prefixIcon,
    required validator,
    required onsaved,
    required keyboardType,
   }) {
  return TextFormField(

    onSaved: onsaved,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.black, width: 2.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      prefixIcon: prefixIcon,
    ),
    validator: validator,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
  );
}
