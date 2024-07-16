import 'package:flutter/cupertino.dart';
import 'package:invoice_genetator/header_files.dart';

Widget imagepicker({required context}) {
  return FloatingActionButton.small(
    onPressed: () async {
      showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text("Profile Picture"),
                content: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();

                            XFile? xFile = await picker.pickImage(
                                source: ImageSource.camera);

                            PersonalGlobal.image = File(xFile!.path);
                            setState(() {});
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.camera_alt),
                          label: const Text("Camera"),
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();

                            XFile? xFile = await picker.pickImage(
                                source: ImageSource.gallery);

                            PersonalGlobal.image = File(xFile!.path);
                            setState(() {});
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.image),
                          label: const Text("Gallery"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Visibility(
                          visible: PersonalGlobal.image != null,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              PersonalGlobal.image != null
                                  ? PersonalGlobal.image = null
                                  : null;
                              setState(() {});
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text("Delete"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    },
    backgroundColor: Colors.white,
    child: Icon(
      Icons.camera_alt,
      weight: 20,
      color: Colors.blueGrey.shade800,
    ),
  );
}
