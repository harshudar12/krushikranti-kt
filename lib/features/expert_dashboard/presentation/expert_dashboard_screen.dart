import 'package:flutter/material.dart';
import 'assigned_task_screen.dart';
// Import VCP Screen
import '../../vcp_sale/presentation/sell_produce_screen.dart'; 

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
      backgroundColor: const Color(0xFFF5F7FA), // Light grey background
      
      // --- APP BAR ---
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "KrushiKranti",
          style: TextStyle(
            color: Color(0xFF2E7D32), // Brand Green
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black87),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),

      // --- DRAWER ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2E7D32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.engineering, color: Colors.white, size: 40),
                  SizedBox(height: 10),
                  Text("Dev Navigation", style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.storefront, color: Colors.orange),
              title: const Text('Switch to VCP (Farmer View)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c) => const SellProduceScreen()));
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. FIXED PROFILE CARD
            const _ProfileHeaderCard(),
            const SizedBox(height: 15),

            // 2. ASSIGNED VILLAGES BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5)
                ],
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF2E7D32)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Assigned Villages: Ganeshwadi, Shivpur",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // 3. STATS ROW
            const _StatsRow(),
            const SizedBox(height: 20),

            // 4. RECENT REQUEST SECTION
            const Text(
              "Recent Request",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            _buildRequestCard(
              context,
              name: "Yogesh Jadhav",
              location: "Kolhapur, Maharashtra",
              image: "https://picsum.photos/id/10/200/200",
            ),
            const SizedBox(height: 10),
            _buildRequestCard(
              context,
              name: "Sunil Kadam",
              location: "Shivpur, Maharashtra",
              image: "https://picsum.photos/id/12/200/200",
            ),

            const SizedBox(height: 20),

            // 5. PRIORITY FARMER SECTION
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Priority Farmer",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8A978), 
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "High Priority",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5), 
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/id/10/200/200"),
                    radius: 25,
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Yogesh Jadhav", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        Text("Ganeshwadi, Sugarcane", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.amber, shape: BoxShape.circle)),
                      const SizedBox(width: 5),
                      const Text("Pending for 5 days", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 80), 
          ],
        ),
      ),

      // --- BOTTOM NAVIGATION ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Farmer"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Task"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context, {required String name, required String location, required String image}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 5)
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 25,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssignedTaskScreen(
                    farmerName: name,
                    farmerPhone: "+91 9876543210",
                    farmerLocation: location,
                    farmerImageUrl: image,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF386641), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minimumSize: const Size(0, 36), 
            ),
            child: const Text("View Request", style: TextStyle(color: Colors.white, fontSize: 12)),
          )
        ],
      ),
    );
  }
}

// --- FIXED PROFILE HEADER WIDGET (Using Column for safety) ---

class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230, // Fixed height to maintain card size
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allows profile image to overflow if needed
        children: [
          // 1. Column ensures Image is ALWAYS on top, Text ALWAYS on bottom
          Column(
            children: [
              // Top Half: Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1500382017468-9049fed747ef?q=80&w=600&auto=format&fit=crop",
                  height: 120, // Fixed image height
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Bottom Half: Text Details (White background automatically)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ramesh Tayde",
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.black87
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "ID : F0782575735",
                        style: TextStyle(
                          fontSize: 12, 
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "Kolhapur Region", 
                            style: TextStyle(
                              fontSize: 12, 
                              color: Colors.grey[800], 
                              fontWeight: FontWeight.w600
                            )
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 8, 
                            height: 8, 
                            decoration: const BoxDecoration(
                              color: Colors.green, 
                              shape: BoxShape.circle
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 2. Profile Image (Floating on the right)
          Positioned(
            top: 75, // Vertically centered on the seam (120 - 45 = 75)
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=200&auto=format&fit=crop",
                  height: 80,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.05), blurRadius: 5)],
      ),
      child: const IntrinsicHeight(
        child: Row(
          children: [
            _StatItem(label: "Village Assigned\nFarmer", count: "58"),
            VerticalDivider(color: Colors.grey, thickness: 0.5, indent: 5, endIndent: 5),
            _StatItem(label: "Register\nFarmer", count: "52"), 
            VerticalDivider(color: Colors.grey, thickness: 0.5, indent: 5, endIndent: 5),
            _StatItem(label: "Active Task", count: "25"),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String count;
  const _StatItem({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 12, height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}