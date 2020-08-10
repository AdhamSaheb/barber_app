
//import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/Models/Slot.dart';

class DatabaseService{
  //reference to slots collection 
  final CollectionReference slotcollection = Firestore.instance.collection("Slots");
  final CollectionReference slotcollection2 = Firestore.instance.collection("Slots2");


  
  List<Slot> _slotListFromSnapshot(QuerySnapshot snapshot){
    
    return snapshot.documents.map ( (doc) {
      return Slot(
        time: doc.data['Time'] ?? '',
        phone: doc.data['Phone'] ?? '',
        name: doc.data['Name'] ?? '',
        reservationTime: doc.data['reservationTime'] ?? Timestamp.now() ,
        pending : doc.data['pending'] ?? false, 

        );
       
    }
       ).toList() ;   
  
  }

  void updatedata(String name, String phone, String time) {
    slotcollection.document(time).updateData({
       'Phone' : phone,
       'Name' : name , 
       //'reservationTime' : Timestamp.now(),
       'pending' : true ,
    });
  }

  void updatedata2(String name, String phone, String time) {
  slotcollection2.document(time).updateData({
      'Phone' : phone,
      'Name' : name , 
      //'reservationTime' : Timestamp.now(),
      'pending' : true 
  });
  }

    void confirmReservation(String collection ,String name, String phone, String time) {
       if(collection == 'slotcollection') {
          slotcollection.document(time).updateData({
          'Phone' : phone,
          'Name' : name , 
          'reservationTime' : Timestamp.now(),
          'pending' : false 
      });}
      else{

        slotcollection2.document(time).updateData({
        'Phone' : phone,
        'Name' : name , 
        'reservationTime' : Timestamp.now(),
        'pending' : false 
      });
      }
  }

      void declineReservation(String collection , String time) {
       if(collection == 'slotcollection') {
          slotcollection.document(time).updateData({
          'pending' : false 
      });}
      else{

        slotcollection2.document(time).updateData({

        'pending' : false 
      });
      }
  }

//  void init(String time) {
//   slotcollection2.document(time).updateData({

//     'pending' : false
      
//   });
//   }
  
    //Slot Stream
  Stream<List<Slot>> get slots {
    return slotcollection.snapshots()
    .map(_slotListFromSnapshot);
  }


  //Slot Stream
  Stream<List<Slot>> get slots2 {
    return slotcollection2.snapshots()
    .map(_slotListFromSnapshot);
  }
  




  


}
