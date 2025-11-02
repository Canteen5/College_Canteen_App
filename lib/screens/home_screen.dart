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

  final String websiteUrl = 'https://machinelearning-rho.vercel.app/'; // 👈 your website

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
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
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 232, 108, 19),
                Color.fromARGB(255, 255, 217, 0),
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
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        // 🔥 Make everything scrollable
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🌐 Website Section
              SizedBox(
                height: 1200,//ght for the WebView portion
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

              const SizedBox(height:20),

              // 🖼️ Image Section (full image visible)
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.amber[300], // 👈 yellow background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // 👇 Your image
          Image.asset(
            'assets/images/food_banner.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),

          // 👇 A semi-transparent layer for text readability
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 👇 Text at the bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'CHOLE BHATURE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

               const SizedBox(height:20),

              // 🖼️ Image Section (full image visible)
             Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.amber[300], // 👈 yellow background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // 👇 Your image
          Image.asset(
            'assets/images/chole.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),

          // 👇 A semi-transparent layer for text readability
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 👇 Text at the bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'CHOLA SAMOSA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

               const SizedBox(height:20),

              // 🖼️ Image Section (full image visible)
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.amber[300], // 👈 yellow background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // 👇 Your image
          Image.asset(
            'assets/images/kulche.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),

          // 👇 A semi-transparent layer for text readability
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 👇 Text at the bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'CHOLE KULCHE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

               const SizedBox(height:20),

              // 🖼️ Image Section (full image visible)
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.amber[300], // 👈 yellow background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // 👇 Your image
          Image.asset(
            'assets/images/paratha.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),

          // 👇 A semi-transparent layer for text readability
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 👇 Text at the bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'MALABARI PARANTHA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

               const SizedBox(height:20),

              // 🖼️ Image Section (full image visible)
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.amber[300], // 👈 yellow background
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // 👇 Your image
          Image.asset(
            'assets/images/sandwitch.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 180,
          ),

          // 👇 A semi-transparent layer for text readability
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.0), Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 👇 Text at the bottom
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'VEG SANDWITCH',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

               
              const SizedBox(height: 24),

              // 📜 Optional text or section below image
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Explore more delicious items and offers!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
