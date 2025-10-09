import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_bites/core/errors/exceptions.dart';
import 'package:smart_bites/core/errors/failures.dart';
import 'package:smart_bites/core/services/database_service.dart';
import 'package:smart_bites/core/services/firebase_auth_service.dart';
import 'package:smart_bites/core/utils/backend_endpoint.dart';
import 'package:smart_bites/features/auth/data/models/user_model.dart';
import 'package:smart_bites/features/auth/domain/entities/user_entity.dart';
import 'package:smart_bites/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  //signUp WithEmailAndPassword  ........)
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoIml.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  //signIn WithEmailAndPassword ........)
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserdata(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoIml.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var exists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        docId: user.uid,
      );
      if (exists) {
        await getUserdata(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoIml.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var exists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.isUserExists,
        docId: user.uid,
      );
      if (exists) {
        await getUserdata(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoIml.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      docId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserdata({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      docId: uId,
    );
    return UserModel.fromJson(userData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }
}
