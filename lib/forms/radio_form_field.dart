import 'package:flutter/material.dart';

class RadioFormField extends FormField<String> {
  RadioFormField({
    super.key,
    required String title,
    required List<String> options,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
  }) : super(
    validator: validator,
    onSaved: onSaved,
    builder: (FormFieldState<String> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Row(
            children: options.map((e) {
              return Expanded(
                child: RadioListTile<String>(
                  title: Text(e),
                  value: e,
                  groupValue: state.value,
                  onChanged: (value) {
                    state.didChange(value);
                  },
                ),
              );
            }).toList(),
          ),
          if (state.hasError)
            Text(
              state.errorText!,
              style: const TextStyle(color: Colors.red),
            ),
        ],
      );
    },
  );
}