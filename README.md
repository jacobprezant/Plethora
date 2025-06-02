# Plethora
Plethora is an iOS proof-of-concept application, written entirely in Swift, that serves to recursively replace an `.ipa`’s Bundle ID based on the parsed and extracted App ID of a `.mobileprovision`.

Plethora is built as an educational resource and starting point for developers seeking to implement data extraction and replacement in `.mobileprovision` and `.ipa` files. 

![](/Images/mobileprovision.swift.png)
Take a look at the application identifier extractor function &#8593;, or more directly [here](/plethora/mobileprovision.swift).

## How does it work?

How Plethora works is somewhat involved, so I would advise you to take a [look at the source code](plethora.xcodeproj), but more on that later.

In sum, Plethora uses Apple's [Foundation](https://developer.apple.com/documentation/foundation/) and the wonderful open-source [ZIPFoundation](https://github.com/weichsel/ZIPFoundation) libraries to format, retrieve, and modify/extract keys within a `.mobileprovision`, which is essentially a complex property-list (plist). We can also do this with `.ipa` packages, which once formatted and extracted properly, contain their own property-list, `Info.plist`.

## Usage
As mentioned earlier, the primary purpose of Plethora is to serve as a resource. To examine the source code or contribute, `git clone https://github.com/jacobprezant/plethora.git`, and `cd plethora && open plethora.xcodeproj`.

If you wish to install Plethora standalone, you can either build from Xcode or install an unsigned .ipa file by your method of choice, found in [Releases](https://github.com/jacobprezant/plethora/releases). Plethora does not require any additional capabilities, nor does it use any exploits of any kind. Note that the UI is very simplistic.

## Issues and PRs
If you have questions, feel free to [make an Issue](https://github.com/jacobprezant/plethora/issues). [Contributions](https://github.com/jacobprezant/plethora/pulls) are encouraged!

## License
Plethora is licensed under the GNU General Public License v3.0. By contributing to this project, you agree to license your code under the GPL-3.0 license as well, ensuring that your work, like all other contributions, remains freely accessible and open. Note our sole dependency, ZIPFoundation, is under the MIT license.
