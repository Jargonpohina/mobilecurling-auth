# mobilecurling_auth

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

Authentication node for the Mobilecurling project.

Running in GCloud here: https://auth-ic4hp354na-ew.a.run.app/


## Components of the application

- [Client](https://github.com/Jargonpohina/mobilecurling-client)
- [Real-time node](https://github.com/Jargonpohina/mobilecurling)
- [Lobby node](https://github.com/Jargonpohina/mobilecurling-lobby)

## Install

```sh
~$ git clone git@github.com:Jargonpohina/mobilecurling-auth.git
~$ cd mobilecurling-auth
~/mobilecurling-auth$ dart pub get
```

To run the project, you need to install [Dart Frog](https://dartfrog.vgv.dev/docs/overview), which itself requires 
[Dart SDK](https://dart.dev/get-dart). 

After installing Frog, you're good to go.

## Run

To start the dev server (default port 8080):

```sh
~/mobilecurling-auth$ dart_frog dev 
```

Build for production:

```sh
~/mobilecurling-auth$ dart_frog build
```
