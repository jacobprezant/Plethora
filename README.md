> [!NOTE]
> Plethora is being totally overhauled for v1.0. Currently, Plethora is in extremely early beta.

# Plethora

Programmatical modification, extraction, and generation related to `.ipa`, `.mobileprovision` & `.p12` files.

#### Current Features: 

- Programmatically replace the bundle ID of a `.ipa` with the App ID from a `.mobileprovision` [^1].

See the compiled (unsigned) `.ipa` [here](https://github.com/jacobprezant/Plethora/releases).

[^1]: Plethora extracts the App ID from the provided `.mobileprovision` profile and recursively replaces all occurrences of the original Bundle ID within the specified `.ipa`’s `info.plist` with the extracted App ID.

