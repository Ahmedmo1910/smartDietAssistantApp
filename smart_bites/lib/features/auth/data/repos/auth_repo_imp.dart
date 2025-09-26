import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_bites/core/errors/exceptions.dart';
import 'package:smart_bites/core/errors/failures.dart';
import 'package:smart_bites/core/services/firebase_auth_service.dart';
import 'package:smart_bites/features/auth/domain/entities/user_entity.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});

  @override
  // Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
  //   String email,
  //   String password,
  //   String name,
  // ) async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //       name: name,
  //     );
  //     var userEntity = UserEntity(uId: user.uid, name: name, email: email);
  //     return right(userEntity);
  //   } on CustomException catch (e) {
  //     return left(ServerFailure(e.message));
  //   } catch (e) {
  //     log(
  //       'Exception in AuthRepoIml.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(ServerFailure('An unknown error occurred: $e'));
  //   }
  // }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
  //! امسحي ده بعد م تفكي الكومنت اللي فوق عملته بس عشان اعرف اعمل رن
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
