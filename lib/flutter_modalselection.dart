library flutter_modalselection;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modalselection/types.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Widget per la selezione di un elemento generico.
///
/// Questo widget consente di visualizzare un elemento selezionato e di aprire
/// un modulo di selezione per scegliere un nuovo elemento tra quelli disponibili.
///
/// [T] è il tipo dell'elemento da selezionare.
class ModalSelection<T> extends StatelessWidget {
  /// L'elemento attualmente selezionato.
  final T? selectedEntity;

  /// La lista degli elementi disponibili tra cui scegliere.
  final List<T> availableEntitis;

  /// Il callback chiamato quando viene selezionato un nuovo elemento.
  final GenericDelegate<T?> selectionCallback;

  /// Il contenuto da visualizzare nel modulo di selezione.
  final Widget modalContent;

  /// L'elemento visibile per avviare la selezione.
  final Widget selectElement;

  /// Crea una nuova istanza di [CElementSelectorWidget].
  ///
  /// [availableEntitis] è obbligatorio e rappresenta la lista degli elementi
  /// disponibili tra cui scegliere.
  ///
  /// Gli altri parametri sono opzionali:
  /// - [selectedEntity] rappresenta l'elemento attualmente selezionato.
  /// - [selectionCallback] è il callback chiamato quando viene selezionato un nuovo elemento.
  /// - [modalContent] è il contenuto da visualizzare nel modulo di selezione.
  /// - [selectElement] è l'elemento visibile per avviare la selezione.
  ModalSelection({
    super.key,
    this.selectedEntity,
    required this.availableEntitis,
    required this.selectionCallback,
    required this.modalContent,
    required this.selectElement
  });

  @override
  Widget build(BuildContext context) {

    void _showeEntitySelection(T? selectedCustomer, List<T> availableCustomer, GenericDelegate<T?> selectionCallback) {
      showBarModalBottomSheet(
          context: context,
          builder: (context) => modalContent
      );
    }

    return Column(
      children: [
        GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => _showeEntitySelection(selectedEntity, availableEntitis, selectionCallback), child: selectElement)
      ],
    );
  }
}



