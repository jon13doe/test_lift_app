import 'package:flutter/services.dart';
import 'package:test_lift_app/global_import.dart';

class CustTextFieldRow extends StatefulWidget {
  final String title;
  final bool stringType;
  final TextEditingController controller;

  const CustTextFieldRow({
    super.key,
    required this.title,
    required this.stringType,
    required this.controller,
  });

  @override
  State<CustTextFieldRow> createState() => _CustTextFieldRowState();
}

class _CustTextFieldRowState extends State<CustTextFieldRow> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.stringType ? 15 : 4;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Container(
                height: 23,
                width: width * 10,
                color: Theme.of(context).colorScheme.onPrimary,
                child: TextField(
                  keyboardType: widget.stringType
                      ? TextInputType.text
                      : TextInputType.number,
                  maxLength: widget.stringType ? 15 : 3,
                  controller: _textController,
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  inputFormatters: widget.stringType
                      ? [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9а-яА-Я]'),
                          )
                        ]
                      : [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
