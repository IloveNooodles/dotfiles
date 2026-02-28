# Overlays to apply to both stable and unstable package sets
{ rust-overlay }:
[
  rust-overlay.overlays.default
  
  # Add your custom overlays here
  # Example:
  # (final: prev: {
  #   my-custom-package = prev.some-package.override { ... };
  # })
]
