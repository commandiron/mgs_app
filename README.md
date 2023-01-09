<h1 align="center">MgsApp</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"> 
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white">
</p>

<p align="center">  
MgsApp is a Metal Gear Solid fan app written in Dart using Flutter Framework with self-written RestApi <a href="https://github.com/commandiron/mgs-server/">Mgs Server </a> written in Kotlin using Ktor.
</p>
</br>

<p align="center">
<img src="https://user-images.githubusercontent.com/50905347/194304178-16ac8e1c-16ae-40ff-b767-c0a725303c0a.png#gh-dark-mode-only" width="750" height="366">
<img src="https://user-images.githubusercontent.com/50905347/194304140-0cb14446-521b-4016-b939-55b8aa67bac1.png#gh-light-mode-only" width="750" height="366">
</p>

* Ux 🧪

<img src="art/topRatedTenFilms-overview.gif" width="250" height="530">

* Application - Features ☕
   * One time animated splash screen
   * Search
   * Paging
   * Nested navigation
   * Watchlist db
   * Language - English
* Tech-stack ⚛️
    * [Kotlin](https://kotlinlang.org/) + [Coroutines](https://kotlinlang.org/docs/reference/coroutines-overview.html) - perform background operation
    * [Jetpack](https://developer.android.com/jetpack)
        * [Compose](https://developer.android.com/jetpack/compose) - toolkit for building native UI
        * [Navigation](https://developer.android.com/topic/libraries/architecture/navigation/) - deal with whole in-app navigation      
        * [ViewModel](https://developer.android.com/topic/libraries/architecture/viewmodel) - store and manage UI-related data in a lifecycle conscious way
    * [Retrofit](https://square.github.io/retrofit/) - HTTP client
    * [Coil](https://coil-kt.github.io/coil/compose/) - image loading library
    * [Paging](https://developer.android.com/jetpack/androidx/releases/paging) -  load and display pages from a remote server.
    * [Room](https://developer.android.com/jetpack/androidx/releases/room) - database object mapping
    * [Accompanist](https://github.com/google/accompanist)
        * navigationAnimation
        * pager
        * systemUi
    * [Hilt](https://dagger.dev/hilt/) - DI
    * [Material 3](https://m3.material.io) - design
* Architecture 🏗️
    * Model-View-ViewModel
    * [Android Architecture components](https://developer.android.com/topic/libraries/architecture) ([ViewModel](https://developer.android.com/topic/libraries/architecture/viewmodel), [Navigation](https://developer.android.com/jetpack/androidx/releases/navigation))
 
 * Todo ✔️
   * Shimmer Effect ✔️
   * Movie Details ✔️
   * by Country ❌
   * Different Screen Sizes and Orientation ❌
   * Light Theme ❌
   * Turkish Language ❌
