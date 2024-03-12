import 'package:flutter/material.dart';
import 'package:flutter_modalselection/types.dart';

class ModalSelectionElement<T> extends StatelessWidget {

  T entity;
  GenericDelegate<T>? onTapCallback;
  T? selectedEntity;

  Widget displayElement;

  ModalSelectionElement({
    super.key,
    required this.entity,
    this.onTapCallback,
    this.selectedEntity,
    required this.displayElement
  });

  void _processOnTap() {
    if(onTapCallback != null) onTapCallback!(entity);
  }

  @override
  Widget build(BuildContext context) {
    if(onTapCallback != null) return GestureDetector(
      onTap: _processOnTap,
      child: _EntityDisplayWdget(e: entity, d: displayElement),
    );

    return  _EntityDisplayWdget(e: entity, d: displayElement);
  }

}

class _EntityDisplayWdget<T> extends StatelessWidget {

  T e;
  Widget d;
  _EntityDisplayWdget({super.key, required this.e, required this.d});

  @override
  Widget build(BuildContext context) {
    return d;
  }
}

