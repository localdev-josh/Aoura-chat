//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:rxdart/rxdart.dart';
//import 'package:aoura_chat/models/user.dart';
//import 'package:aoura_chat/utils/utilities.dart';
//
//class FirebaseMethods {
//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final Firestore _db = Firestore.instance;
//
//  Observable<FirebaseUser> user; // firebase user
//  Observable<Map<String, dynamic>> profile; // firebase user
//  PublishSubject loading = PublishSubject();
//
//  FirebaseMethods() {
//    user = Observable(_auth.onAuthStateChanged);
//    profile = user.switchMap((FirebaseUser u) {
//      if(u != null) {
//        return _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data);
//      }else {
//        return Observable.just({ });
//      }
//    });
//  }
//
//  Future<FirebaseUser> googleSignIn() async {
//    loading.add(true);
//    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication _signInAuthentication =
//    await _signInAccount.authentication;
//    AuthCredential userCredential = GoogleAuthProvider.getCredential(
//        accessToken: _signInAuthentication.accessToken,
//        idToken: _signInAuthentication.idToken);
//    updateUserData(userCredential);
////    print("Signed in "+ userCredential);
//  }
//
//  void updateUserData(AuthCredential user) {}
//
//  void signOut() {}
//
//
//  //user class
//  User userModelObject = User();
//
//  Future<FirebaseUser> getCurrentUser() async {
//    FirebaseUser currentUser;
//    currentUser = await _auth.currentUser();
//    return currentUser;
//  }
//
//  Future<FirebaseUser> signIn() async {
//    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
//    GoogleSignInAuthentication _signInAuthentication =
//    await _signInAccount.authentication;
//
////    final AuthCredential credential = GoogleAuthProvider.getCredential(
////        accessToken: _signInAuthentication.accessToken,
////        idToken: _signInAuthentication.idToken);
//
////    FirebaseUser user = await _auth.signInWithCredential(credential);
////    return user;
//  }
//
////  Future<bool> authenticateUser(FirebaseUser user) async {
////    QuerySnapshot result = await firestore
////        .collection("users")
////        .where("email", isEqualTo: user.email)
////        .getDocuments();
////
////    final List<DocumentSnapshot> docs = result.documents;
////
////    //if user is registered then length of list > 0 or else less than 0
////    return docs.length == 0;
////  }
////
////  Future<void> addDataToDb(FirebaseUser currentUser) async {
////    String username = Utils.getUsername(currentUser.email);
////
////    user = User(
////        uid: currentUser.uid,
////        email: currentUser.email,
////        name: currentUser.displayName,
////        profilePhoto: currentUser.photoUrl,
////        username: username);
////
////    firestore
////        .collection("users")
////        .document(currentUser.uid)
////        .setData(user.toMap(user));
////  }
////}
//
////final FirebaseMethods firebaseMethod = FirebaseMethods();