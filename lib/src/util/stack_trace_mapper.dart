// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.util.stack_trace_mapper;

import 'package:path/path.dart' as p;
import 'package:source_map_stack_trace/source_map_stack_trace.dart' as mapper;
import 'package:source_maps/source_maps.dart';

import 'io.dart';

final _sdkRoot = p.toUri(sdkDir);

class StackTraceMapper {
  final Mapping _mapping;
  final Uri _packageRoot;

  StackTraceMapper(String contents, {Uri mapUrl, String root,
          String packageRoot})
    : _mapping = parse(contents, mapUrl: mapUrl),
      _packageRoot= p.toUri(packageRootFor(root, packageRoot));

  StackTrace mapStackTrace(StackTrace trace) =>
      mapper.mapStackTrace(_mapping, trace,
          packageRoot: _packageRoot, sdkRoot: _sdkRoot);
}
