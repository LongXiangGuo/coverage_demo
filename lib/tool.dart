class CoverageFeatureManager {
  final bool isBranchTestEnable;
  final bool isFunctionTestEnable;
  CoverageFeatureManager({
    required this.isBranchTestEnable,
    required this.isFunctionTestEnable,
  });

  void branchFranch() {
    if (isBranchTestEnable) {
      print('isBranchTestEnable true');
    } else {
      print('isBranchTestEnable false');
    }
  }

  void functionTest() {
    switch (isFunctionTestEnable) {
      case true:
        print('isFunctionTestEnable true');
        return;
      case false:
        print('isFunctionTestEnable false');
        return;
    }
  }
}
