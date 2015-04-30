// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.util.stack_trace_mapper;

import 'package:source_map_stack_trace/source_map_stack_trace.dart' as mapper;
import 'package:source_maps/source_maps.dart';

class StackTraceMapper {
  final Mapping _mapping;
  final Uri _packageRoot;
  final Uri _sdkRoot;

  StackTraceMapper(String contents, {Uri mapUrl, Uri packageRoot, Uri sdkRoot})
    : _mapping = parse(contents, mapUrl: mapUrl),
      _packageRoot = packageRoot,
      _sdkRoot = sdkRoot;

  StackTrace mapStackTrace(StackTrace trace) =>
      mapper.mapStackTrace(_mapping, trace,
          packageRoot: _packageRoot, sdkRoot: _sdkRoot);
}
