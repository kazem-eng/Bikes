import 'package:bike_catalog/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType {
  text,
  password,
  email,
  digit,
}

class TextInput extends StatefulWidget {
  TextInput({
    required TextController controller,
    ValueChanged<bool>? onValidateChanged,
    ValueChanged<String>? onChanged,
    bool isMultiline = false,
    bool isEnable = true,
    InputType inputType = InputType.text,
    String? hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
    void Function()? onSuffixIconClick,
    Color? backgroundColor,
    Key? key,
  })  : _onChanged = onChanged,
        _controller = controller,
        _hint = hint,
        _inputType = inputType,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _isMultiline = isMultiline,
        _isEnable = isEnable,
        _backgroundColor = backgroundColor,
        _onValidateChanged = onValidateChanged,
        _onSuffixIconClick = onSuffixIconClick,
        super(key: key) {
    _selectInputType();
  }

  final String? _hint;
  final InputType _inputType;
  final IconData? _prefixIcon;
  final IconData? _suffixIcon;
  final void Function()? _onSuffixIconClick;
  final ValueChanged<String>? _onChanged;
  final TextEditingController _controller;
  final bool _isMultiline;
  final bool _isEnable;
  final Color? _backgroundColor;
  final ValueChanged<bool>? _onValidateChanged;
  late final TextInputType _keyboardType;
  late final bool _passwordMode;

  void _selectInputType() {
    switch (_inputType) {
      case InputType.email:
        _keyboardType = TextInputType.emailAddress;
        _passwordMode = false;
        break;
      case InputType.password:
        _keyboardType = TextInputType.visiblePassword;
        _passwordMode = true;
        break;
      case InputType.text:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
      case InputType.digit:
        _keyboardType = TextInputType.number;
        _passwordMode = false;
        break;
      default:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
    }
  }

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late bool _isPasswordHidden;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _isPasswordHidden = widget._passwordMode;
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    const defaultPadding = EdgeInsets.all(8.0);

    return Padding(
      padding: defaultPadding,
      child: TextField(
        enabled: widget._isEnable,
        keyboardType: widget._keyboardType,
        obscureText: _isPasswordHidden,
        controller: widget._controller,
        maxLines: widget._isMultiline ? 3 : 1,
        textInputAction: TextInputAction.done,
        inputFormatters: [
          if (widget._inputType == InputType.digit)
            FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          fillColor: widget._backgroundColor ?? appTheme.colors.transparent,
          filled: true,
          errorText: errorMessage,
          hintText: widget._hint,
          border: appTheme.inputBorder,
          contentPadding: defaultPadding,
          prefixIcon:
              widget._prefixIcon != null ? Icon(widget._prefixIcon) : null,
          suffixIcon: _buildSuffixIcon(),
        ),
        onChanged: _onChange,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    switch (widget._inputType) {
      case InputType.password:
        return InkWell(
          onTap: _toggle,
          child: Icon(
            _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
          ),
        );
      default:
        return widget._onSuffixIconClick != null
            ? InkWell(
                onTap: () {
                  widget._onSuffixIconClick!.call();
                },
                child: Icon(
                  widget._suffixIcon,
                ),
              )
            : Icon(widget._suffixIcon);
    }
  }

  void _toggle() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _onChange(newValue) {
    widget._onValidateChanged?.call(errorMessage == null);
    setState(() {});
    if (widget._onChanged != null) {
      widget._onChanged!(newValue);
    }
  }
}

class TextController extends TextEditingController {
  TextController({String? text}) {
    this.text = text;
  }

  @override
  set text(String? newText) {
    if (newText != null) {
      value = value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
          composing: TextRange.empty);
    }
  }
}
