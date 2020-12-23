import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verify/domain/values/verification_status.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/logic/verify_hash_logic.dart';

class HashVerificationResult extends StatefulWidget {
  @override
  _HashVerificationResultState createState() => _HashVerificationResultState();
}

class _HashVerificationResultState extends State<HashVerificationResult> {

  @override
  Widget build(BuildContext context) {
    //@Todo _obj wrap in own service
    //@Todo improve this line
    return Consumer<VerifyHashLogic>(
      builder: (context, _obj, child) {
        return FutureBuilder(
          future: _obj.verificationResult,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            Widget _resultDisplay = Container(child: LinearProgressIndicator());
            _setStatus(_obj, VerificationStatus.waitingForResult);

            if (snapshot.connectionState == ConnectionState.done) {
              _setStatus(_obj, VerificationStatus.resultReceived);
              _resultDisplay = _response(_obj.result["valid"]);
            } else if(!snapshot.hasData) {
              _resultDisplay = _response(0);
            } else if (snapshot.hasError) {
              _setStatus(_obj, VerificationStatus.completedWithError);
              _resultDisplay = _response(-1);
            }

            return Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child : Text(
                    "Verification Result",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                _resultDisplay
              ],
            );
          }
        );
      }
    );
  }

  Widget _response(result) {
    switch (result) {
      case 0: return Container(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: LinearProgressIndicator()
      );
      case -1: return Container(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
          "Error Occurred!",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
      default: 
        return Container(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text(
            (result == 'true') ? "Valid": "Input combination is invalid",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: (result == 'true')? Colors.green : Colors.red
            ),
          ),
        );
    }
  }

  void _setStatus(provider, status) {
    provider.setVerificationStatus(status);
  }
}