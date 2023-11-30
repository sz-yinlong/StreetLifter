//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func validate() throws {

  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizableEn: localizableEn { .init(source: .init(bundle: bundle, tableName: "LocalizableEn", preferredLanguages: preferredLanguages, locale: locale)) }
    var localizableRu: localizableRu { .init(source: .init(bundle: bundle, tableName: "LocalizableRu", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizableEn(preferredLanguages: [String]) -> localizableEn {
      .init(source: .init(bundle: bundle, tableName: "LocalizableEn", preferredLanguages: preferredLanguages, locale: locale))
    }
    func localizableRu(preferredLanguages: [String]) -> localizableRu {
      .init(source: .init(bundle: bundle, tableName: "LocalizableRu", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizableEn` struct is generated, and contains static references to 2 localization keys.
    struct localizableEn {
      let source: RswiftResources.StringResource.Source

      /// Value: Dips
      ///
      /// Key: dips
      var dips: RswiftResources.StringResource { .init(key: "dips", tableName: "LocalizableEn", source: source, developmentValue: nil, comment: nil) }

      /// Value: Pull-ups
      ///
      /// Key: pullUps
      var pullUps: RswiftResources.StringResource { .init(key: "pullUps", tableName: "LocalizableEn", source: source, developmentValue: nil, comment: nil) }
    }

    /// This `_R.string.localizableRu` struct is generated, and contains static references to 2 localization keys.
    struct localizableRu {
      let source: RswiftResources.StringResource.Source

      /// Value: Отжимания
      ///
      /// Key: dips
      var dips: RswiftResources.StringResource { .init(key: "dips", tableName: "LocalizableRu", source: source, developmentValue: nil, comment: nil) }

      /// Value: Подтягивания
      ///
      /// Key: pullUps
      var pullUps: RswiftResources.StringResource { .init(key: "pullUps", tableName: "LocalizableRu", source: source, developmentValue: nil, comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 2 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `dips`.
    var dips: RswiftResources.ImageResource { .init(name: "dips", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `pull-ups`.
    var pullUps: RswiftResources.ImageResource { .init(name: "pull-ups", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }
}