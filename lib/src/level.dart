// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

/// [Level]s to control logging output. Logging can be enabled to include all
/// levels above certain [Level]. [Level]s are ordered using an integer
/// value [Level.value]. The predefined [Level] constants below are sorted as
/// follows (in descending order): [Level.FATAL], [Level.ERROR],
/// [Level.WARNING], [Level.INFO], [Level.DEBUG], [Level.TRACE], and [Level.ALL].
///
/// We recommend using one of the predefined logging levels. If you define your
/// own level, make sure you use a value between those used in [Level.ALL] and
/// [Level.OFF].
class Level implements Comparable<Level> {
  final String name;

  /// Unique value for this level. Used to order levels, so filtering can
  /// exclude messages whose level is under certain value.
  final int value;

  const Level(this.name, this.value);

  /// Special key to turn on logging for all levels ([value] = 0).
  static const Level ALL = Level('ALL', 0);

  /// Special key to turn off all logging ([value] = 2000).
  static const Level OFF = Level('OFF', 2000);

  /// Key for tracing information ([value] = 300).
  static const Level TRACE = Level('TRACE', 300);

  /// Key for debug messages ([value] = 400).
  static const Level DEBUG = Level('DEBUG', 400);

  /// Key for informational messages ([value] = 500).
  static const Level INFO = Level('INFO', 500);

  /// Key for potential problems ([value] = 600).
  static const Level WARNING = Level('WARNING', 600);

  /// Key for serious failures ([value] = 700).
  static const Level ERROR = Level('ERROR', 700);

  /// Key for extra debugging loudness ([value] = 800).
  static const Level FATAL = Level('FATAL', 800);

  static const List<Level> LEVELS = [
    ALL,
    TRACE,
    DEBUG,
    INFO,
    WARNING,
    ERROR,
    FATAL,
    OFF
  ];

  @override
  bool operator ==(Object other) => other is Level && value == other.value;

  bool operator <(Level other) => value < other.value;

  bool operator <=(Level other) => value <= other.value;

  bool operator >(Level other) => value > other.value;

  bool operator >=(Level other) => value >= other.value;

  @override
  int compareTo(Level other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
