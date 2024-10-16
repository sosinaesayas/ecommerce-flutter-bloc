import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {

  Future<Either<String, List<Map<String, dynamic>>>> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {

  @override
  Future < Either<String, List<Map<String, dynamic>>>> getCategories() async {
    try {
      var categories = await FirebaseFirestore.instance.collection('Categories').get();
      return Right(
        categories.docs.map((e) => e.data()).toList()
      );
    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }
  
}