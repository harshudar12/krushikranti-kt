import 'package:flutter/material.dart';

class SellProduceScreen extends StatefulWidget {
  const SellProduceScreen({super.key});

  @override
  State<SellProduceScreen> createState() => _SellProduceScreenState();
}

class _SellProduceScreenState extends State<SellProduceScreen> {
  String? _selectedCrop;
  final TextEditingController _qtyController = TextEditingController();
  
  // Crop list
  final List<String> _cropList = [
    "Tomato", 
    "Grapes", 
    "Sugarcane", 
    "Wheat", 
    "Onion", 
    "Pomegranate"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Sell Produce (VCP)",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. INFO CARD
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9), // Light Green
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.storefront_outlined, color: Color(0xFF2E7D32)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "Submit your produce details before reaching the VCP center for faster processing.",
                      style: TextStyle(fontSize: 13, color: Color(0xFF1B5E20)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // 2. FORM SECTION
            const Text(
              "Produce Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // Crop Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCrop,
                  hint: const Text("Select Crop Category"),
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green),
                  items: _cropList.map((String crop) {
                    return DropdownMenuItem(value: crop, child: Text(crop));
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedCrop = val),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Quantity Input
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: TextField(
                controller: _qtyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Quantity (e.g. 500)",
                  labelText: "Quantity (kg)",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixText: "KG",
                  suffixStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 3. PHOTO UPLOAD UI
            const Text(
              "Add Photo (Optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3), style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_rounded, size: 40, color: Colors.grey[400]),
                  const SizedBox(height: 10),
                  Text(
                    "Tap to upload produce photo",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 4. SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Produce Submitted! Pending VCP Weighing."),
                      backgroundColor: Colors.green,
                    )
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  elevation: 5,
                  shadowColor: Colors.green.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  "Submit to VCP",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}