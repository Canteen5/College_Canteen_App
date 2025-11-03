import 'package:SnackSync/data/booking_data.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  late WebViewController _controller1;
  late WebViewController _controller2;
  bool showFirstWeb = true;
  bool isLoading1 = true;
  bool isLoading2 = true;

  final String websiteUrl1 =
      'https://frontend-backened.vercel.app/csitcanteen.html'; // CSIT
  final String websiteUrl2 =
      'https://frontend-backened.vercel.app/mecanteen.html'; // ME

  final List<Map<String, dynamic>> dishes = [
  {'image': 'assets/images/burger.jpg', 'name': 'Veg Burger'},
  {'image': 'assets/images/food_banner.jpg', 'name': 'chole bhature'},
  {'image': 'assets/images/sandwitch.jpg', 'name': 'Sandwich'},
  {'image': 'assets/images/kulche.jpg', 'name': 'chole kulche'},
  {'image': 'assets/images/paratha.jpg', 'name': 'malabari parantha'},
  {'image': 'assets/images/chole.jpg', 'name': 'cholesamose'},
  {'image': 'assets/images/maggie.jpg', 'name': 'maggie'},
  {'image': 'assets/images/pav.jpg', 'name': 'pav bhaji'},
  {'image': 'assets/images/thali.jpg', 'name': 'thali'},
];


  @override
  void initState() {
    super.initState();

    _controller1 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading1 = true),
          onPageFinished: (_) => setState(() => isLoading1 = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl1));

    _controller2 = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => isLoading2 = true),
          onPageFinished: (_) => setState(() => isLoading2 = false),
        ),
      )
      ..loadRequest(Uri.parse(websiteUrl2));
  }

  void _bookDish(String dish, String category) {
  addBooking(dish, category);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("$dish booked successfully for $category canteen!"),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 1), // 👈 set your desired time here
    ),
  );
}


  Widget _buildDishBar(String category) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 40, bottom: 40),
      child: SingleChildScrollView(
        child: Column(
          children: dishes.map((dish) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () => _bookDish(dish['name'], category),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.orange.shade50,
                      child: ClipOval(
                        child: Image.asset(
                          dish['image'],
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dish['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  );
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 240, 118, 4),
                Color.fromARGB(255, 232, 183, 37),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      /// 🔹 Smooth Gradient Tabs (like Staff Page)
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
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
                          "CS/IT-Canteen",
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
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
                          "ME-Canteen",
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

          /// 🔹 Main WebView + Dish Bars
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: WebViewWidget(
                    controller: showFirstWeb ? _controller1 : _controller2,
                  ),
                ),
                if (showFirstWeb && isLoading1)
                  const Center(
                      child: CircularProgressIndicator(color: Colors.deepPurple)),
                if (!showFirstWeb && isLoading2)
                  const Center(
                      child: CircularProgressIndicator(color: Colors.purple)),
                _buildDishBar(showFirstWeb ? "CSIT" : "ME"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
