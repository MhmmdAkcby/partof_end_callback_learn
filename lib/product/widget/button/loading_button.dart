import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.onPressed, required this.title});
  final String title;
  final Function() onPressed;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;
  void _changeLaoding() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _WidgetSize().size,
      child: ElevatedButton(
        child: Center(child: _isLoading ? const CircularProgressIndicator() : Text(widget.title)),
        onPressed: () async {
          if (_isLoading) return;
          _changeLaoding();
          await widget.onPressed.call();
          _changeLaoding();
        },
      ),
    );
  }
}

class _WidgetSize {
  final double size = 50;
}
