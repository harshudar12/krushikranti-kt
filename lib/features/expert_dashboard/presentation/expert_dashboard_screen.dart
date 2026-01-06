import 'package:flutter/material.dart';
// 1. IMPORT THE DETAIL SCREEN
import 'request_detail_screen.dart'; 

class ExpertDashboardScreen extends StatefulWidget {
  const ExpertDashboardScreen({super.key});

  @override
  State<ExpertDashboardScreen> createState() => _ExpertDashboardScreenState();
}

class _ExpertDashboardScreenState extends State<ExpertDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. TOP HEADER (Mascot + Welcome + Bell)
                const _HeaderSection(),
                const SizedBox(height: 20),

                // 2. OVERVIEW SECTION
                const Text(
                  "Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const _OverviewStatsCard(),

                const SizedBox(height: 25),

                // 3. RECENT REQUESTS TITLE
                Row(
                  children: [
                    const Text(
                      "Recent Requests",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "From Farmer",
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // 4. REQUEST LIST
                const _RequestCard(
                  name: "Prakash Patil",
                  phone: "+91 9876894520",
                  location: "Kolhapur, Maharashtra",
                  imageAsset: "assets/farmer_1.png",
                ),
                const _RequestCard(
                  name: "Vinod Gaikwad",
                  phone: "+91 9903267976",
                  location: "Pune, Maharashtra",
                  imageAsset: "assets/farmer_2.png",
                ),
              ],
            ),
          ),
        ),
      ),
      
      // 5. BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: "Area overview"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: "Task"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}

// --- WIDGETS EXTRACTED FOR CLEAN CODE ---

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Mascot Image
        Image.asset(
          'assets/mascot.png', 
          height: 80,
          errorBuilder: (c, o, s) => const Icon(Icons.person, size: 60),
        ),
        
        // Welcome Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Welcome", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                "Krushitadnya !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[800]),
              ),
            ],
          ),
        ),

        // Notification Bell
        Stack(
          children: [
            const Icon(Icons.notifications_none, size: 32),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 10)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _OverviewStatsCard extends StatelessWidget {
  const _OverviewStatsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _StatItem(
            icon: Icons.location_on_outlined, 
            label: "village-Wise\nFarmer Assign", 
            count: "120", 
            color: Colors.green
          ),
          _VerticalDivider(),
          _StatItem(
            icon: Icons.people_outline, 
            label: "Registered\nFarmer", 
            count: "150", 
            color: Colors.green
          ),
          _VerticalDivider(),
          _StatItem(
            icon: Icons.assignment_outlined, 
            label: "Active\nTask", 
            count: "40", 
            color: Colors.amber
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String count;
  final Color color;

  const _StatItem({required this.icon, required this.label, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        Text(
          count,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();
  @override
  Widget build(BuildContext context) {
    return Container(height: 50, width: 1, color: Colors.grey.shade300);
  }
}

class _RequestCard extends StatelessWidget {
  final String name;
  final String phone;
  final String location;
  final String imageAsset;

  const _RequestCard({
    required this.name,
    required this.phone,
    required this.location,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5, spreadRadius: 1)
        ],
      ),
      child: Row(
        children: [
          // Farmer Photo
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
                onError: (e, s) {}, 
              ),
              color: Colors.grey.shade200, 
            ),
            child: const Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    
                    // --- UPDATED: CLICKABLE "VIEW REQUEST" BUTTON ---
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestDetailScreen(
                              farmerName: name,
                              farmerPhone: phone,
                              farmerLocation: location,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber, 
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "View Request",
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                    // ------------------------------------------------
                  ],
                ),
                const SizedBox(height: 5),
                Text(phone, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}