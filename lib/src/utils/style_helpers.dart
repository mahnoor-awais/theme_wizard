/// Helper functions for style manipulation and merging.
///
/// These utilities will evolve as the package matures. For now, we expose a
/// simple merging helper that prefers custom values, falling back to defaults.
library;

/// Merges user-provided styles with defaults.
T mergeWithDefaults<T>(T? custom, T fallback) {
  return custom ?? fallback;
}

class StyleHelpers {
  StyleHelpers._();
}
