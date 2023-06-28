import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextAndFormFieldWidget extends StatelessWidget {
  final TextEditingController textFieldController;
  final String label;
  final bool isDOB;
  final bool isRequired;

  const TextAndFormFieldWidget(
      {required this.label,
      required this.textFieldController,
      this.isDOB = false,
      this.isRequired = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        // height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 3,
              child: TextFormField(
                controller: textFieldController,
                readOnly: isDOB,
                onTap: () async {
                  if (isDOB) {
                    DateTime selectedDate = textFieldController.text.isNotEmpty
                        ? DateFormat("dd/MM/yyyy")
                            .parse(textFieldController.text)
                        : DateTime.now();
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2030));
                    if (picked != null && picked != selectedDate) {
                      selectedDate = picked;
                      String newDate =
                          DateFormat("dd/MM/yyyy").format(selectedDate);
                      textFieldController.text = newDate;
                    }
                  }
                },
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  textFieldController.text = val;
                },
                autovalidateMode: isRequired
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (value) {
                  if (isRequired) {
                    if (value == null || value == '') {
                      return 'This field cannot be empty';
                    } else {
                      return null;
                    }
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your $label',
                    border: const OutlineInputBorder(),
                    suffixIcon: isDOB
                        ? const Icon(Icons.calendar_today_outlined)
                        : null),
              ),
            ),
          ],
        ));
  }
}
