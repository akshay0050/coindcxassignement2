import 'dart:async';

import 'package:coindeskassignment2/network/utils.dart';
import 'package:coindeskassignment2/style/Style.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ThirdPageManageState();
  }
}

class ThirdPageManageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPageManageState> {
  bool _hasNetworkConnection = false;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                this._hasNetworkConnection? 'You are Online' : 'You are Offine',
                style: this._hasNetworkConnection? Style.positiveValue : Style.negativeValue,
              ),
            ),
            RaisedButton(
              onPressed: () {
                proceedToNextPage();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:  Text(
                    'Proceed To Page 1',
                    style: TextStyle(fontSize: 10)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void proceedToNextPage() {
    Navigator.popUntil(
      context,
      ModalRoute.withName('/'),
    );
  }
  void _updateConnectivity(dynamic hasConnection){
    setState(() {
      if(hasConnection) {
        _hasNetworkConnection = true;
      }else {
        _hasNetworkConnection = false;
      }
    });

  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    print("result - $result");
    bool value = await Utils.isInternetConnectionAvailable();
    setState(() {
      this._hasNetworkConnection =  value;
    });

  }

}
