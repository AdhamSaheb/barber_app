import 'package:cloud_firestore/cloud_firestore.dart';

class TimeService {
  //reference to Times collection
  final CollectionReference timesCollection =
      Firestore.instance.collection("Times");

  Future<Map<String, int>> getOpenCloseTime() async {
    Map<String, int> times = new Map<String, int>();
    await timesCollection
        .document('times')
        .get()
        .then((data) => {
              times['start'] = data.data['start'],
              times['end'] = data.data['end']
            })
        .catchError((err) => throw ('Database times  Error' + err.toString()))
        .timeout(Duration(seconds: 5),
            onTimeout: () => {throw ('Request Timeout')});
    return times;
  }

  Future<Map<String, bool>> getBarbershopState() async {
    Map<String, bool> state = new Map<String, bool>();
    await timesCollection
        .document('times')
        .get()
        .then((data) => {
              state['isMuradClosed'] = data.data['isMuradClosed'],
              state['isEddyClosed'] = data.data['isEddyClosed'],
            })
        .catchError((err) => throw ('Database state Error' + err.toString()))
        .timeout(Duration(seconds: 5),
            onTimeout: () => {throw ('Request Timeout')});
    return state;
  }
}
