import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modalselection/types.dart';

class ModalSelectionModal<T> extends StatelessWidget {

  final T? selectedEntity;
  final List<T> availableEntitis;
  final GenericDelegate<T?> selectedCallback;

  ModalSelectionModal({
    super.key,
    this.selectedEntity,
    required this.availableEntitis,
    required this.selectedCallback
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Manca imp");
  }
}
