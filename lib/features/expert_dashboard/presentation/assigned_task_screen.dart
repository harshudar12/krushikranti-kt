import 'package:flutter/material.dart';

class AssignedTaskScreen extends StatelessWidget {
  final String farmerName;
  final String farmerPhone;
  final String farmerLocation;
  final String farmerImageUrl;

  const AssignedTaskScreen({
    super.key,
    required this.farmerName,
    required this.farmerPhone,
    required this.farmerLocation,
    required this.farmerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Modern Light Grey Background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          children: [
             Text(
              "KrushiKranti",
              style: TextStyle(
                color: Color(0xFF2E7D32), // Brand Green
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
             Text(
              "Kisan Market",
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.green, size: 30),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. FARMER PROFILE HEADER
            _buildProfileSection(),

            const SizedBox(height: 20),

            // 2. MAIN TASK CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Text(
                    "Assigned Task",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Assigned By: Krushitadnya",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const Divider(height: 30),

                  // Task Details
                  _buildIconRow(Icons.assignment_turned_in_outlined, "Task:", "Purchase Sugarcane Seeds"),
                  const SizedBox(height: 15),
                  _buildIconRow(Icons.calendar_today_outlined, "Assigned on:", "19 JAN 2025"),
                  const SizedBox(height: 15),
                  _buildIconRow(Icons.verified_user_outlined, "Instruction:", "Purchase certified sugarcane from the approval vendor"),

                  const SizedBox(height: 25),

                  // Work Completed Section
                  const Text(
                    "Work Completed",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildCheckItem("Purchased Sugarcane Seeds"),
                  _buildCheckItem("Purchased Paddy Seeds"),

                  const SizedBox(height: 25),

                  // Proof Photos Section
                  const Text(
                    "Proof Photos:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPhoto("https://picsum.photos/id/102/200/200"), // Placeholder seeds
                      _buildPhoto("https://picsum.photos/id/104/200/200"), // Placeholder scale
                      _buildPhoto("https://picsum.photos/id/106/200/200"), // Placeholder bag
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                          label: const Text("Approve", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E7D32), // Dark Green
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.cancel_outlined, color: Colors.white),
                          label: const Text("Deny", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC62828), // Red
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green.withValues(alpha: 0.2), width: 2),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(farmerImageUrl),
          ),
        ),
        const SizedBox(width: 15),
        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    farmerName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Online",
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                farmerPhone,
                style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Text(
                    farmerLocation,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF2E7D32), size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 14, fontFamily: 'Roboto'), // Explicit font to ensure rendering
              children: [
                TextSpan(text: "$label ", style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF2E7D32), size: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPhoto(String url) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          url, 
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}