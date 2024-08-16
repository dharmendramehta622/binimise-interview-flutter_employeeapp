part of staff;

class AutoCompleteTextField extends StatefulWidget {
  final List<String> patientNames;
  final String? selectedPatientName;
  final Function(String) onSelected;

  const AutoCompleteTextField({
    super.key,
    required this.patientNames,
    required this.selectedPatientName,
    required this.onSelected,
  });

  @override
  State<AutoCompleteTextField> createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  late TextEditingController _typeAheadController;

  @override
  void initState() {
    super.initState();
    _typeAheadController =
        TextEditingController(text: widget.selectedPatientName);
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _typeAheadController,
        decoration: dropDownDecoration.copyWith(
          hintText: "Enter patient name or ID",
          labelText: "",
        ),
        style: const TextStyle(
          fontSize: 16,
          color: kBlack600,
        ),
      ),
      suggestionsCallback: (pattern) {
        if (pattern.isEmpty) {
          return const Iterable<String>.empty();
        }
        return widget.patientNames.where(
            (name) => name.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (context, String suggestion) {
        return ListTile(
          title: MediumText(suggestion, 16, kBlack600),
        );
      },
      onSuggestionSelected: (String suggestion) {
        _typeAheadController.text = suggestion;
        widget.onSelected(suggestion);
      },
      noItemsFoundBuilder: (context) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No patients found', style: TextStyle(fontSize: 16)),
      ),
      getImmediateSuggestions: true,
      hideSuggestionsOnKeyboardHide: false,
      keepSuggestionsOnLoading: false,
    );
  }
}
