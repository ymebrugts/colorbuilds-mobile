import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/infrastructure/exceptions/UnexpectedException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiBuildordersRepositoryIndexException.dart';
import 'package:colorbuilds/infrastructure/exceptions/http/ApiBuildordersRepositoryInternalServerException.dart';
import 'package:colorbuilds/logic/api_response_status.dart';
import 'package:colorbuilds/logic/buildorders/api_buildorders_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'buildorders_event.dart';
part 'buildorders_state.dart';

class BuildordersBloc extends Bloc<BuildordersEvent, BuildordersState> {
  final FlutterSecureStorage storage;
  final ApiBuildOrdersRepository buildOrdersRepository;
  BuildordersBloc({required this.storage, required this.buildOrdersRepository}) : super(BuildordersInitial());

  @override
  Stream<BuildordersState> mapEventToState(BuildordersEvent event) async* {
    if (event is AllBuildordersRequested) {
      yield state.copyWith(
        apiResponseStatus: ApiResponseStatusInProgress(),
      );

      try {
        final String? token = await storage.read(key: 'token');

        final List<Buildorder>? result = await buildOrdersRepository.index(token: token!);

        yield state.copyWith(
          buildorders: result,
          apiResponseStatus: ApiResponseStatusSuccess(),
        );
      } on ApiBuildordersRepositoryInternalServerException catch (e) {
        yield state.copyWith(apiResponseStatus: ApiResponseStatusFailure(e.e));
      } on ApiBuildordersRepositoryIndexException catch (e) {
        yield state.copyWith(apiResponseStatus: ApiResponseStatusFailure(e.e));
      } catch (e) {
        yield state.copyWith(apiResponseStatus: ApiResponseStatusFailure(UnexpectedException(e)));
      }
    }
  }
}
