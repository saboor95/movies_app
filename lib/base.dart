import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseNavigator {
  void showLoading({String message});

  void hideDialog();

  void showMessage(String message);
}

class BaseViewModel<Nav extends BaseNavigator> extends ChangeNotifier {
  Nav? navigator;
}

abstract class BaseView<VM extends BaseViewModel, T extends StatefulWidget>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void showLoading({String message = 'Loading...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Row(
            children: [CircularProgressIndicator(), Text(message)],
          )),
        );
      },
    );
  }

  @override
  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }

  @override
  void hideDialog() {
    Navigator.pop(context);
  }
}
