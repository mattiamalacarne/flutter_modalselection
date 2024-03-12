import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modalselection/types.dart';

class ModalSelectionModal<T> extends StatelessWidget {

  T? selectedEntity;
  List<T> availableEntitis;
  GenericDelegate<T?> selectedCallback;

  ModalSelectionModal({
    super.key,
    this.selectedEntity,
    required this.availableEntitis,
    required this.selectedCallback
  });

  @override
  Widget build(BuildContext context) {
    return Text("Manca imp");
  }
}
