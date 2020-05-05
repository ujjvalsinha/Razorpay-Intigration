import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Razorpay _razorpay;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
void _handlePaymentSuccess(PaymentSuccessResponse response) {
 Fluttertoast.showToast(
        msg: "Payment Succsessful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
void _handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(
        msg: "pament Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
  
  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "Payment from Wallet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  
}

@override
  void dispose() {
    _razorpay.clear(); 
    super.dispose();
  }

  var options = {
  'key': 'rzp_test_BVe6wPulOmFq6y',
  'amount': 100, //in the smallest currency sub-unit.
  'name': 'PG@Jagatpura',
  'description': 'Near LCO Jgatpura',
  'prefill': {
  'contact': '8434277416',
  'email': 'ujjvalsinha06@gmail.com'
  }
};

payNow(){
  _razorpay.open(options);
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network(
                  "https://images.pexels.com/photos/164558/pexels-photo-164558.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "PG in Jagatpura only at ",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "Price - 200/Day",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: MaterialButton(
                minWidth: 200,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {payNow();},
                color: Colors.amber,
                child: Text("Buy Now"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
