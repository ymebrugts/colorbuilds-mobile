import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colorbuilds/domain/data/models/Buildorder.dart';
import 'package:colorbuilds/infrastructure/exceptions/UnexpectedException.dart';
import 'package:colorbuilds/infrastructure/exceptions/bloc/BuildordersFilterByNameException.dart';
import 'package:colorbuilds/infrastructure/exceptions/bloc/BuildordersFilterByRaceException.dart';
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
          filtered: result,
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

    /// Filtering by Races
    else if (event is FilteredByRace) {
      try {
        List<Buildorder>? _filtered = [];
        final List<Buildorder> buildorders = state.buildorders;

        if (buildorders.isNotEmpty) {
          _filtered = buildorders.where((Buildorder model) {
            if (event.opponentRace != null && event.yourRace != null) {
              return model.getOpponentRace == event.opponentRace && model.getYourRace == event.yourRace;
            } else if (event.opponentRace != null) {
              return model.getOpponentRace == event.opponentRace;
            } else if (event.yourRace != null) {
              return model.getYourRace == event.yourRace;
            }

            return true;
          }).toList();

          if (event.yourRace == null && event.opponentRace == null) {
            yield state.copyWith(filtered: buildorders);
          } else {
            yield state.copyWith(filtered: _filtered);
          }
        }
      } catch (e) {
        throw BuildordersFilterByRaceException(e);
      }
    }

    /// Filtering by Name
    else if (event is FilteredByName) {
      try {
        List<Buildorder>? _filtered = [];
        final List<Buildorder> buildorders = state.buildorders;

        if (buildorders.isNotEmpty) {
          _filtered = buildorders.where((Buildorder model) => event.name == model.name).toList();

          if (event.name != null) {
            yield state.copyWith(filtered: _filtered);
          } else {
            yield state.copyWith(filtered: buildorders);
          }
        }
      } catch (e) {
        throw BuildordersFilterByNameException(e);
      }
    }
  }
}
