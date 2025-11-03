import 'package:SnackSync/data/booking_data.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StaffWebTabs extends StatefulWidget {
  const StaffWebTabs({super.key});

  @override
  State<StaffWebTabs> createState() => _StaffWebTabsState();
}

class _StaffWebTabsState extends State<StaffWebTabs> {
  late WebViewController _controller1;
  late WebViewController _controller2;
  bool showFirstWeb = true;
  bool isLoading = true;

  final String websiteUrl1 = 'https://frontend-backened.vercel.app/csitstaff.html'; // CSIT
  final String websiteUrl2 = 'https://frontend-backened.vercel.app/mestaff.html'; // ME

  @override
  void initState() {
    super.initState();
    _controller1 = WebViewController()
     ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl1));

    _controller2 = WebViewController()
     ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl2));
  }

  Widget _buildBookingList(String category) {
    final notifier = category == "CSIT" ? csitBookings : mechBookings;

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, List<Booking> bookings, _) {
        if (bookings.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "No current bookings 🍽️",
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 57, 42, 6)),
              ),
            ),
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: bookings.map((b) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 181, 71),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.deepOrange.shade400,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.fastfood,
                        color: Colors.deepOrange, size: 24),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          b.dishName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Booked: ${b.time.hour}:${b.time.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.check_circle,
                          color: Colors.green, size: 26),
                      onPressed: () => removeBooking(b.dishName, category),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Booking Page"),
        centerTitle: true,
        elevation: 2,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 64, 205, 51),
                Color.fromARGB(255, 105, 139, 20)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showFirstWeb = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: showFirstWeb
                              ? [
                                  const Color.fromARGB(255, 236, 220, 53),
                                  const Color.fromARGB(255, 251, 151, 64)
                                ]
                              : [Colors.grey.shade300, Colors.grey.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "CS/IT-Staff",
                          style: TextStyle(
                            color: showFirstWeb ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showFirstWeb = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: !showFirstWeb
                              ? [
                                  const Color.fromARGB(255, 236, 220, 53),
                                  const Color.fromARGB(255, 251, 151, 64)
                                ]
                              : [Colors.grey.shade300, Colors.grey.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "ME-Staff",
                          style: TextStyle(
                            color: !showFirstWeb ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: WebViewWidget(
                    controller: showFirstWeb ? _controller1 : _controller2,
                  ),
                ),
                if (isLoading)
                  const Center(
                      child:
                          CircularProgressIndicator(color: Colors.deepPurple)),

                /// 👇 Booking list now shown at bottom as horizontal scroll
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 88, 203, 99).withOpacity(0.95),
                      border: const Border(
                        top: BorderSide(color: Colors.orange, width: 2),
                      ),
                    ),
                    child: _buildBookingList(showFirstWeb ? "CSIT" : "ME"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
