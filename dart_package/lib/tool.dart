class CoverageFeatureManager {
  final bool isBranchTestEnable;
  final bool isFunctionTestEnable;
  CoverageFeatureManager({
    required this.isBranchTestEnable,
    required this.isFunctionTestEnable,
  });

  String ifElseFunction() {
    if (isBranchTestEnable) {
      return 'if';
    } else {
      return 'else';
    }
  }

  String switchFunction() {
    final condition = isFunctionTestEnable ? 'left' : 'right';
    switch (isFunctionTestEnable) {
      case true:
        print(condition);
        return 'case1';
      default:
        return 'case2';
    }
  }
}
