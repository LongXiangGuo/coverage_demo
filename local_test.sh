#!/bin/sh -e
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test &
dart '/Users/jiodg45/Downloads/coverage-1.3.0/bin/collect_coverage.dart' --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --scope-output=foo
dart '/Users/jiodg45/Downloads/coverage-1.3.0/bin/format_coverage.dart' --packages=.dart_tool/package_config.json --lcov -i coverage/coverage.json -o coverage/lcov.info