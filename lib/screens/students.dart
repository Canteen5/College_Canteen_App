import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WebViewController _controller1;
  late WebViewController _controller2;
  bool isLoading1 = true;
  bool isLoading2 = true;

  final String websiteUrl1 = 'https://example.com'; // 👈 change this
  final String websiteUrl2 = 'https://example.com'; // 👈 change this

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _controller1 = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading1 = true),
          onPageFinished: (_) => setState(() => isLoading1 = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl1));

    _controller2 = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading2 = true),
          onPageFinished: (_) => setState(() => isLoading2 = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl2));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "SnackSync 😋🍽️😋",
    style: TextStyle(fontWeight: FontWeight.w600),
  ),
  centerTitle: true,
  elevation: 2,
  // Remove backgroundColor because we’ll use a gradient
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 240, 118, 4), // Deep orange
          Color.fromARGB(255, 232, 183, 37), // Amber yellow
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  bottom: TabBar(
    controller: _tabController,
    indicatorColor: Colors.white,
    indicatorWeight: 3,
    labelColor: Colors.white,
    unselectedLabelColor: const Color.fromARGB(179, 23, 16, 16),
    tabs: const [
      Tab(icon: Icon(Icons.dinner_dining), text: "CSIT-Canteen"),
      Tab(icon: Icon(Icons.food_bank), text: "Mechanical-Canteen"),
    ],
  ),
),

      body: TabBarView(
        controller: _tabController,
        children: [
          // 🌐 First Website
          Stack(
            children: [
              WebViewWidget(controller: _controller1),
              if (isLoading1)
                const Center(
                  child: CircularProgressIndicator(color: Colors.deepPurple),
                ),
            ],
          ),

          // 🌐 Second Website
          Stack(
            children: [
              WebViewWidget(controller: _controller2),
              if (isLoading2)
                const Center(
                  child: CircularProgressIndicator(color: Colors.purple),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
