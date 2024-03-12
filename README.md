# flutter_modalselection


This Flutter plugin implements a modal selection with selection callback,
Create an element that hide a selectionlist and update on selection

## Platform Support

| Android | iOS | MacOS | Web  | Linux | Windows |
|:-------:|:---:|:-----:|:----:|:-----:|:-------:|
|    ✅    |  ✅  |       |      |       |         |

## Usage

You can use the package by importing it and initialize with a list of widget

#### Import the plugin
```dart
import 'package:carousel_listview/carousel_listview.dart';
```
#### Define the UI for the element that will be displayed as selection item
```dart
/// Define the UI for the element in selection
class SimpleElement extends StatelessWidget {
  String text;
  Function(String)? onTapCallback;
  SimpleElement({super.key, required this.text, this.onTapCallback});

  void _processOnTap() {
    if(onTapCallback != null) onTapCallback!(text);
  }
  /// Determine if display with callback or not (not essential)
  /// This in case you will reuse the element ui and not need a callback
  @override
  Widget build(BuildContext context) {
    if(onTapCallback != null) return GestureDetector(
      onTap: _processOnTap,
      child: _SimpleElement(text: text)
    );

    return _SimpleElement(text: text);
  }
}
/// Define the real UI
class _SimpleElement extends StatelessWidget {
  String text;

  _SimpleElement({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(children: [Expanded(child: Text(text))]
        ,),
      ),
    );
  }
}
```

#### Define the modal UI
Must extend ModalSelectionModal, this grant access to needed property in the element
```dart
/// Define the modal UI it must extends ModalSelection
class SelecteStringModal extends ModalSelectionModal<String> {
  SelecteStringModal({required super.availableEntitis, required super.selectedCallback, super.selectedEntity});

  /// Define the build method like this
  @override
  Widget build(BuildContext context) {

    void manageCallback(String? s) {
      selectedCallback(s);
      Navigator.of(context).pop();
    }

    return Container(
        padding: const EdgeInsets.all(25),
        height: MediaQuery.of(context).copyWith().size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Definisce il titolo del modal
                Text("Seleziona elemento")
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: availableEntitis.length,
                  itemBuilder: (context, index) => SimpleElement(
                    onTapCallback: manageCallback,
                    /// Access the possibile entities using the property of ModalSelectionWidget
                    text: availableEntitis[index],
                  )
              ),
            ),
          ],
        )
    );
  }
}
```

#### Use the component in the UI
Must extend ModalSelectionModal, this grant access to needed property in the element
```dart
class MainAppUI extends StatefulWidget {
  const MainAppUI({super.key});

  @override
  State<MainAppUI> createState() => _MainAppUIState();
}

class _MainAppUIState extends State<MainAppUI> {

  /// Current element selected
  String selectedText = "Seleziona un elemento";
  /// List of selection
  List<String> avbTexts = ["Testo 1", "Testo2", "Testo3"];
  /// On selection callback
  void onSelection(String? s) {
    setState(() {
      selectedText = s ?? "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: const EdgeInsets.all(20),
      child: ModalSelection<String>(
        availableEntitis: avbTexts,
        selectionCallback: onSelection,
        selectedEntity: selectedText,
        modalContent: SelecteStringModal(availableEntitis: avbTexts, selectedCallback: onSelection, selectedEntity: selectedText),
        selectElement: ModalSelectionElement<String>(entity: selectedText, displayElement: SimpleElement(text: selectedText)),
      ),
    ));
  }
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MainAppUI()
      ),
    );
  }
}
```