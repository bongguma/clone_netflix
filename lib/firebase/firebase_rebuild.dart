import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseRebuild {
  final Widget rebuildWidget;

  FirebaseRebuild({required this.rebuildWidget});

  Widget rebuildBody(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return rebuildWidget;
      },
    );
  }
}
