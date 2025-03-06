enum Flavor {
  dev,
  routerdev,
  localdev,
  fake,
  preprod,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '[DEV] LAC Gestion';
      case Flavor.routerdev:
        return '[ROUTERDEV] LAC Gestion';
      case Flavor.localdev:
        return '[LOCALDEV] LAC Gestion';
      case Flavor.fake:
        return '[FAKE] LAC Gestion';
      case Flavor.preprod:
        return '[PREPORD] LAC Gestion';
      case Flavor.prod:
        return 'LAC Gestion';
      default:
        return 'title';
    }
  }

}
