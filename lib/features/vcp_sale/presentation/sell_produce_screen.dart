import 'package:flutter/material.dart';

class SellProduceScreen extends StatefulWidget {
  const SellProduceScreen({super.key});

  @override
  State<SellProduceScreen> createState() => _SellProduceScreenState();
}

class _SellProduceScreenState extends State<SellProduceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCrop;
  final TextEditingController _qtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sell Today's Produce")), //
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. Select Crop
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Select Crop"),
                items: ["Grapes", "Tomato", "Wheat"].map((String crop) {
                  return DropdownMenuItem(value: crop, child: Text(crop));
                }).toList(),
                onChanged: (val) => setState(() => selectedCrop = val),
              ),
              const SizedBox(height: 10),

              // 2. Enter Quantity
              TextFormField(
                controller: _qtyController,
                decoration: const InputDecoration(labelText: "Quantity (kg)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // 3. Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call your Microservice API here
                    // e.g. VcpRepository.submitSale(selectedCrop, _qtyController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sale Recorded! Pending VCP Weighing.")), //
                    );
                  }
                },
                child: const Text("Submit to VCP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}