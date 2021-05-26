MARVEL

- El proyecto utiliza Cocoapods como gestor de dependencias de librerías externas, así que para instalar el proyecto hay que hacer 'pod install' en la raíz del proyecto y abrir el archivo Marvel.xcworkspace
- La arquitectura está basada en VIPER, que es una implementación adaptada a iOS de Clean Architecture, cumpliendo las reglas de SOLID. En este artículo explico de forma más detallada la filosofía y reglas de esta arquitectura: https://alfonsomiranda.com/posts/clean-architecture-ios-viper/
- Cada módulo o "pantalla" del proyecto está compuesto por un ViewController (+ xib), un Presenter, un Router y un Interactor. Esto se construye a partir de un assembly
- Para cada capa tenemos una clase Base, junto a sus protocolos, que unifican y aseguran ciertas funcionalidades y comportamientos comunes de cada una de ellas.
- En el BaseProvider funcionamos con un manager de conexiones, donde implementando el BaseProviderProtocol podemos añadir las diferentes implementaciones que queramos. En este ejemplo se está usando Alamofire, con "AlamofireManager", pero se podría cambiar al otro Manager que hay en el proyecto llamado "NativeManager", que no hace uso de ninguna librería externa, y todo seguiría funcionando igual.
- En el proyecto están creado 4 targets: Local, desarrollo, pre-producción y producción. Todo está preparado para tener esos cuatro entornos consumiendo de diferentes entornos. En este caso todos los targets consumen los mismos, pero ya está preparado para cuando en un proyecto real tengamos ese backend.
- Se está usando un manager para las tablas (TableViewManager) que delega toda la responsabilidad en el presenter.
- Se usa SwiftLint para mantener la calidad del código.
