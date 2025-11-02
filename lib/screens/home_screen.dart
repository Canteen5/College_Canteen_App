import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController _controller;
  bool isLoading = true;

  final String websiteUrl = 'https://example.com'; // 👈 change this to your site

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading = true),
          onPageFinished: (_) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SnackSync',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.transparent, // ✅ transparent so gradient shows
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 232, 108, 19), // warm yellow
                Color.fromARGB(255, 255, 217, 0),  // orange tone
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), // 👈 your JPG
            fit: BoxFit.cover, // ✅ fills entire screen, avoids overflow
          ),
        ),
        child: Column(
          children: [
            // 🌐 Top Half - Web Page
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(color: Colors.deepPurple),
                    ),
                ],
              ),
            ),

            // 🖼️ Bottom Half - Blank for now
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent, // ✅ so background is visible
                child: const Center(
                  child: Text(
                    'Your images will appear here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
