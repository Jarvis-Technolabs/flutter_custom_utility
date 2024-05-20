import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool isObscure;
  final bool? isMandatoryField;
  final String hintText;
  final String labelText;
  final String? errorText;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? inputFormatters;
  final String? inputFormatterRegex;
  final bool? autocorrect;
  final bool? enabled;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? textStyle;
  final bool enableSuggestions;
  final bool autoFocus;
  final int minLines;
  final int errorMaxLine;

  const CustomTextFieldWidget({
    super.key,
    this.controller,
    this.isObscure = false,
    required this.hintText,
    required this.labelText,
    this.errorText,
    this.inputFormatterRegex,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines = 1,
    this.errorMaxLine = 2,
    this.autocorrect = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.isMandatoryField = false,
    this.onTap,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.textStyle,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                widget.labelText,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
              widget.isMandatoryField == true
                  ? const Text(
                      "*",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: widget.controller,
            style: widget.textStyle ??
                const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
            obscureText: widget.isObscure,
            focusNode: widget.focusNode,
            autocorrect: widget.autocorrect!,
            keyboardType: widget.keyboardType,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textAlignVertical: TextAlignVertical.center,
            onTap: widget.onTap,
            validator: widget.validator,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            autofocus: widget.autoFocus,
            enableSuggestions: widget.enableSuggestions,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.inputFormatters),
              if (widget.inputFormatterRegex != null) ...[
                FilteringTextInputFormatter.allow(
                  RegExp(widget.inputFormatterRegex!),
                ),
              ],
              FilteringTextInputFormatter.deny('  '),
            ],
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization!,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(
                15,
                15,
                15,
                15,
              ),
              hintText: widget.hintText,
              suffixIcon: widget.suffixIconWidget,
              prefixIcon: widget.prefixIconWidget,
              errorMaxLines: widget.errorMaxLine,
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Color(0xFF8F959E),
                fontWeight: FontWeight.w400,
              ),
              errorStyle: const TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.transparent,
              border: InputBorder.none,
              enabledBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(
                borderColor: Colors.black,
              ),
              errorBorder: outlineInputBorder(
                borderColor: Colors.red,
              ),
              disabledBorder: outlineInputBorder(),
              focusedErrorBorder: outlineInputBorder(),
              counterText: "",
            ),
            onChanged: widget.onChanged,
          ),
          const SizedBox(
            height: 7,
          ),
          (widget.errorText != "" && widget.errorText != null)
              ? Text(
                  widget.errorText!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              : const SizedBox.shrink(),
        ],
      );
}

OutlineInputBorder? outlineInputBorder({
  Color? borderColor,
}) =>
    OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey,
        width: 1.5,
      ),
    );
