import 'package:flutter/cupertino.dart';
import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/from_page/components/imagepicker.dart';

import 'components/form.dart';

class PersonalinfoPage extends StatefulWidget {
  const PersonalinfoPage({super.key});

  @override
  State<PersonalinfoPage> createState() => _PersonalinfoPageState();
}

class _PersonalinfoPageState extends State<PersonalinfoPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Client"),
        actions: [
          GestureDetector(
            onTap: () {
              if (PersonalGlobal.personalInfoKey.currentState!.validate()) {
                PersonalGlobal.personalInfoKey.currentState!.save();
              }
            },
            child: const Icon(
              Icons.check,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: PersonalGlobal.personalInfoKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: s.height * 0.08,
                      foregroundImage: PersonalGlobal.image != null
                          ? FileImage(PersonalGlobal.image!) as ImageProvider
                          : const NetworkImage(
                              "https://static-00.iconduck.com/assets.00/insert-image-icon-1024x962-wzhwqwnm.png",
                            ),
                    ),
                    // image[camera]
                    // imagepicker(context: context),
                    FloatingActionButton.small(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Profile Picture"),
                              content: SizedBox(
                                height: 150,
                                width: 150,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton.icon(
                                        onPressed: () async {
                                          ImagePicker picker = ImagePicker();

                                          XFile? xFile = await picker.pickImage(
                                              source: ImageSource.camera);

                                          PersonalGlobal.image =
                                              File(xFile!.path);
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

                                          PersonalGlobal.image =
                                              File(xFile!.path);
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
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        weight: 20,
                        color: Colors.blueGrey.shade800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Add Logo",
                ),
                IndexedStack(
                  index: PersonalGlobal.SI,
                  children: [
                    form(
                      hide: PersonalGlobal.hide,
                      size: s,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
