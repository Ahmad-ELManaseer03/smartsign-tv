import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for Firebase Auth singleton instance.
/// 
/// This provider ensures a single instance of FirebaseAuth is used throughout
/// the application. All authentication operations should go through this provider.
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

/// Provider for Firebase Firestore singleton instance.
/// 
/// This provider ensures a single instance of FirebaseFirestore is used throughout
/// the application. All Firestore operations should go through this provider.
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});
