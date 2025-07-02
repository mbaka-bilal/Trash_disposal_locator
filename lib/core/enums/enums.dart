enum AppFlavours {
  production,
  staging,
  development;

  bool get isProduction => this == AppFlavours.production;

  bool get isStaging => this == AppFlavours.staging;

  bool get isDevelopment => this == AppFlavours.development;

  U when<U>(
      {U Function()? production,
      U Function()? staging,
      U Function()? development}) {
    switch (this) {
      case AppFlavours.production:
        return production!.call();
      case AppFlavours.staging:
        return staging!.call();
      case AppFlavours.development:
        return development!.call();
    }
  }
}
