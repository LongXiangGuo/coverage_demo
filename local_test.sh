#!/bin/sh -e

cd dart_package
lsof -i tcp:8181 | grep dart | head -n 1 | cut -f5 -d " " | xargs kill -9
dart pub global activate coverage 1.2.0
collect_coverage --branch-coverage --function-coverage
genhtml -o coverage coverage/lcov.info 
open coverage/index.html
flutter doctor


# 1.3.0 以上,  .dart_tool/package_config.json


# normal
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates && format_coverage --packages=.packages --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info && open coverage/index.html
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates && format_coverage --packages=.dart_tool/package_config.json --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info && open coverage/index.html

# function
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --function-coverage && format_coverage --packages=.packages --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info && open coverage/index.html
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --function-coverage && format_coverage --packages=.dart_tool/package_config.json --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info && open coverage/index.html 

# branch coverage
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --function-coverage --branch-coverage && format_coverage --packages=.packages --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info && open coverage/index.html
 

test_with_coverage --function-coverage
test_with_coverage --branch-coverage --function-coverage

format_coverage --packages=.packages --lcov -i coverage/coverage.json -o coverage/lcov.info && genhtml -o coverage coverage/lcov.info
format_coverage --packages=.dart_tool/package_config.json --lcov -i coverage/coverage.json -o coverage/lcov.info   && genhtml -o coverage coverage/lcov.info && open coverage/index.html



# 1.1.0
# jiodg45@jiodg45s-MacBook-Pro dart_package % dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates
# [2] 79501
# Observatory listening on http://127.0.0.1:8181/
# The Dart DevTools debugger and profiler is available at: http://127.0.0.1:8181/devtools/#/?uri=ws%3A%2F%2F127.0.0.1%3A8181%2Fws
# 00:00 +4: All tests passed!                                                                                                                                                                                                                  
# jiodg45@jiodg45s-MacBook-Pro dart_package % 
# [2]    done       dart run --pause-isolates-on-exit --disable-service-auth-codes  test