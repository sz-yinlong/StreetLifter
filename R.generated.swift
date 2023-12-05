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

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 16 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: Add Weight
      ///
      /// Key: addWeight
      ///
      /// Locales: en
      var addWeight: RswiftResources.StringResource { .init(key: "addWeight", tableName: "Localizable", source: source, developmentValue: "Add Weight", comment: nil) }

      /// en translation: Dips
      ///
      /// Key: dips
      ///
      /// Locales: en, ru
      var dips: RswiftResources.StringResource { .init(key: "dips", tableName: "Localizable", source: source, developmentValue: "Dips", comment: nil) }

      /// en translation: Done
      ///
      /// Key: done
      ///
      /// Locales: en
      var done: RswiftResources.StringResource { .init(key: "done", tableName: "Localizable", source: source, developmentValue: "Done", comment: nil) }

      /// en translation: Exercise
      ///
      /// Key: exercise
      ///
      /// Locales: en
      var exercise: RswiftResources.StringResource { .init(key: "exercise", tableName: "Localizable", source: source, developmentValue: "Exercise", comment: nil) }

      /// en translation: Good job!  You've done %d reps.
      ///
      /// Key: goodJobMessage
      ///
      /// Locales: en, ru
      var goodJobMessage: RswiftResources.StringResource1<Int> { .init(key: "goodJobMessage", tableName: "Localizable", source: source, developmentValue: "Good job!\n You've done %d reps.", comment: nil) }

      /// en translation: Last 7 sessions
      ///
      /// Key: lastSevenSessions
      ///
      /// Locales: en, ru
      var lastSevenSessions: RswiftResources.StringResource { .init(key: "lastSevenSessions", tableName: "Localizable", source: source, developmentValue: "Last 7 sessions", comment: nil) }

      /// en translation: Main
      ///
      /// Key: main
      ///
      /// Locales: en, ru
      var main: RswiftResources.StringResource { .init(key: "main", tableName: "Localizable", source: source, developmentValue: "Main", comment: nil) }

      /// en translation: No data available
      ///
      /// Key: noData
      ///
      /// Locales: en, ru
      var noData: RswiftResources.StringResource { .init(key: "noData", tableName: "Localizable", source: source, developmentValue: "No data available", comment: nil) }

      /// en translation: Previous training
      ///
      /// Key: previousSession
      ///
      /// Locales: en, ru
      var previousSession: RswiftResources.StringResource { .init(key: "previousSession", tableName: "Localizable", source: source, developmentValue: "Previous training", comment: nil) }

      /// en translation: Progress
      ///
      /// Key: progress
      ///
      /// Locales: en, ru
      var progress: RswiftResources.StringResource { .init(key: "progress", tableName: "Localizable", source: source, developmentValue: "Progress", comment: nil) }

      /// en translation: Pull-ups
      ///
      /// Key: pullups
      ///
      /// Locales: en, ru
      var pullups: RswiftResources.StringResource { .init(key: "pullups", tableName: "Localizable", source: source, developmentValue: "Pull-ups", comment: nil) }

      /// en translation: Reps
      ///
      /// Key: reps
      ///
      /// Locales: en, ru
      var reps: RswiftResources.StringResource { .init(key: "reps", tableName: "Localizable", source: source, developmentValue: "Reps", comment: nil) }

      /// en translation: Set
      ///
      /// Key: set
      ///
      /// Locales: en, ru
      var set: RswiftResources.StringResource { .init(key: "set", tableName: "Localizable", source: source, developmentValue: "Set", comment: nil) }

      /// en translation: Sets
      ///
      /// Key: sets
      ///
      /// Locales: en, ru
      var sets: RswiftResources.StringResource { .init(key: "sets", tableName: "Localizable", source: source, developmentValue: "Sets", comment: nil) }

      /// en translation: Start
      ///
      /// Key: start
      ///
      /// Locales: en, ru
      var start: RswiftResources.StringResource { .init(key: "start", tableName: "Localizable", source: source, developmentValue: "Start", comment: nil) }

      /// en translation: Start Exercise
      ///
      /// Key: startExercise
      ///
      /// Locales: en, ru
      var startExercise: RswiftResources.StringResource { .init(key: "startExercise", tableName: "Localizable", source: source, developmentValue: "Start Exercise", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 4 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `Image`.
    var image: RswiftResources.ImageResource { .init(name: "Image", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `dips`.
    var dips: RswiftResources.ImageResource { .init(name: "dips", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `metalTexture`.
    var metalTexture: RswiftResources.ImageResource { .init(name: "metalTexture", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `pull-ups`.
    var pullUps: RswiftResources.ImageResource { .init(name: "pull-ups", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }
}