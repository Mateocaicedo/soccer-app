// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
// ignore_for_file: public_member_api_docs

import 'package:repository/src/models/league.dart';
import 'package:service/service.dart';

/// {@template repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class Repository {
  /// {@macro repository}
  Repository();

  final Service _service = const Service();

  Future<List<League>> leagues() async {

    final leagues = await _service.getLeagues();

    return leagues;

  }

}
