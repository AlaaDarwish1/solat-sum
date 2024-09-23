import 'package:flutter/material.dart';
import 'NumberService.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberInputScreen(),
    );
  }
}

class NumberInputScreen extends StatefulWidget {
  @override
  _NumberInputScreenState createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final _controller = TextEditingController();
  final NumberService _numberService = NumberService();
  int totalSum = 0;
  int total_sum = 0;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Fetch the initial sum when the app starts
    _loadSum();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Rebuilds the widget on focus change
    });

    // Start listening for updates
    _numberService.listenForSumUpdates((newSum) {
      setState(() {
        total_sum = newSum!;
      });
    });
  }

  Future<void> _loadSum() async {
    int sum = await _numberService.fetchSum();
    setState(() {
      totalSum = sum;
    });
  }

  Future<void> _submitNumber() async {
    int number = int.tryParse(_controller.text) ?? 0;
    await _numberService.addNumber(number);
    _controller.clear();
    // Reload the total sum after adding the number
    await _loadSum();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  double getResponsiveFontSize(BuildContext context, double size) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Use the smaller dimension to scale the font size
    return size * (screenHeight < screenWidth ? screenHeight : screenWidth) / 375;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/almadinah1.jpg'), // Your image here
              fit: BoxFit.cover, // Ensures the image covers the entire background
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
              screenWidth * 0.07, // 7% of screen width for horizontal padding
              vertical:
              screenHeight * 0.07, // 3% of screen height for top padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Grup 1 juta sholawat\nمليون الصلاة على النبي صلى الله عليه وآله وسلم",
                  style: TextStyle(color: Color(0xFF132a13),
                      fontSize: getResponsiveFontSize(context, 20), fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.1),
                Container(
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xFFedf2fb),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      textDirection: TextDirection.rtl,
                      controller: _controller,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                        labelText: 'اكتبي الرقم',
                        labelStyle: TextStyle(
                          fontSize: getResponsiveFontSize(context, 15),
                          color:
                          _focusNode.hasFocus ? Color(0xFF31572c) : Colors.grey,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        hintTextDirection: TextDirection.rtl, // Ensures the text inside the input is RTL
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.05, // Responsive padding for content
                          horizontal: screenWidth * 0.02,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                          borderSide: BorderSide(strokeAlign: BorderSide.strokeAlignOutside,color: Color(0xFF004b23), width : 0.5), // Border color when focused
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: screenHeight * 0.09,
                  width: screenWidth * 0.9,
                  child: ElevatedButton(
                    onPressed: _submitNumber,
                    child: Text(
                      "إرسال",
                      style: TextStyle(fontSize: getResponsiveFontSize(context, 20), color: Colors.white),
                    ),
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color(0xFF49a078), ),padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 15)),),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  height: screenHeight * 0.19,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xFFedf2fb),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مجموع الصلوات: ",
                        style: TextStyle(fontSize: getResponsiveFontSize(context, 20),color: Color(0xFF132a13)),
                        textDirection: TextDirection.rtl,
                      ),
                      Text("$total_sum",style: TextStyle(fontSize: getResponsiveFontSize(context, 25),color: Color(0xFF132a13)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
