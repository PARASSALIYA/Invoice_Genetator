import 'package:invoice_genetator/header_files.dart';
import 'components/itemform.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Items"),
        actions: [
          GestureDetector(
            onTap: () {
              if (PersonalGlobal.personalInfoKey.currentState!.validate()) {
                PersonalGlobal.personalInfoKey.currentState!.save();
                favorite.add(PersonalGlobal);
                setState(() {});
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
                IndexedStack(
                  index: PersonalGlobal.SI,
                  children: [
                    itemform(
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
