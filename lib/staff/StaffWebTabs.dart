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

  final String websiteUrl1 = 'https://example.com'; // 👈 csit website
  final String websiteUrl2 = 'https://example.com'; // 👈 mech website

  @override
  void initState() {
    super.initState();

    _controller1 = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl1));

    _controller2 = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl2));
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
              colors: [Color.fromARGB(255, 64, 205, 51), Color.fromARGB(255, 105, 139, 20)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 30),

          // 🟣 Mid Tab Buttons (Bar 1 and Bar 2)
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
                              ? [const Color.fromARGB(255, 236, 220, 53), const Color.fromARGB(255, 251, 151, 64)]
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
                              ?  [const Color.fromARGB(255, 236, 220, 53), const Color.fromARGB(255, 251, 151, 64)]
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
                            color: !showFirstWeb ? const Color.fromARGB(255, 254, 255, 251) : Colors.black87,
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

          const SizedBox(height: 20),

          // 🌐 Web Content Area
          Expanded(
            child: Stack(
              children: [
                if (showFirstWeb)
                  WebViewWidget(controller: _controller1)
                else
                  WebViewWidget(controller: _controller2),

                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(color: Colors.deepPurple),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
