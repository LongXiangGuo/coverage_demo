import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_package/flutter_package.dart';

void main() {
  test('test tool', () {
    expect(
      CoverageFeatureManager(
        isBranchTestEnable: true,
        isFunctionTestEnable: false,
      ),
      isA<CoverageFeatureManager>(),
    );
  });

  test('test if/else', () {
    final tool = CoverageFeatureManager(
      isBranchTestEnable: true,
      isFunctionTestEnable: false,
    );
    expect(tool.ifElseFunction(), 'if');
  });

  test('test switch', () {
    final tool = CoverageFeatureManager(
      isBranchTestEnable: true,
      isFunctionTestEnable: false,
    );
    expect(tool.switchFunction(), 'case2');
  });
}
