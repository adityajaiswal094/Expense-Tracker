// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/adaptive_flatbutton.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrnx;

  const NewTransaction(this.addTrnx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime(1800);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == DateTime(1800)) {
      return;
    }

    widget.addTrnx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Item Name
              TextField(
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),

              // Item Price
              TextField(
                decoration: const InputDecoration(
                  labelText: "Amount",
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),

              const SizedBox(
                height: 8.0,
              ),

              // Date field and Date Picker
              SizedBox(
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Date field
                    Text(
                      _selectedDate == DateTime(1800)
                          ? 'No Date Chosen!'
                          : "Picked Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}",
                      style: Theme.of(context).textTheme.headline1,
                    ),

                    // DATE PICKER
                    AdaptiveFlatButton(
                      'Choose Date',
                      _presentDatePicker,
                    ),
                  ],
                ),
              ),

              // Add to list button
              RaisedButton(
                elevation: 7.0,
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).textTheme.button!.color,
                onPressed: _submitData,
                child: const Text("Add Transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
