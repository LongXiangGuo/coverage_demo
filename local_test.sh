#!/bin/sh -e

cd dart_package
lsof -i tcp:8181 | grep dart | head -n 1 | cut -f5 -d " " | xargs kill -9
dart pub global activate coverage 1.2.0
collect_coverage --branch-coverage --function-coverage
genhtml -o coverage coverage/lcov.info 
open coverage/index.html
flutter doctor