import 'package:flutter/material.dart';

class RequestDetailScreen extends StatefulWidget {
  final String farmerName;
  final String farmerLocation;
  final String farmerPhone;

  const RequestDetailScreen({
    super.key,
    required this.farmerName,
    required this.farmerLocation,
    required this.farmerPhone,
  });

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  
  // Dummy messages to show UI
  final List<Map<String, dynamic>> _messages = [
    {"isMe": false, "text": "Hello Sir, my tomato crop has yellow leaves. Can you help?"},
    {"isMe": false, "text": "I have attached a photo."}, 
    // In a real app, you would handle image rendering here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.farmerName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(widget.farmerLocation, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.green),
            onPressed: () {
              // Action to call farmer
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Visit Request Status Card
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.amber..withValues(alpha: 0.1),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.amber),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "${widget.farmerName} requested a farm visit.",
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showScheduleDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  child: const Text("Schedule"),
                )
              ],
            ),
          ),

          // 2. Chat Area
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'] as bool;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.green[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(msg['text']),
                  ),
                );
              },
            ),
          ),

          // 3. Input Area
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 18),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({"isMe": true, "text": _messageController.text});
        _messageController.clear();
      });
    }
  }

  void _showScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Schedule Visit"),
        content: const Text("Select a date and time for the farm visit."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              // API Call to schedule visit goes here
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Visit Scheduled Successfully!")),
              );
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}