# Plethora
Programatically replace an `.ipa`’s Bundle ID with the App ID from a `.mobileprovision` profile in Swift.

Plethora extracts the App ID from the provided `.mobileprovision` profile and recursively replaces all occurrences of the original Bundle ID within the specified `.ipa`’s `info.plist` with the extracted App ID.

