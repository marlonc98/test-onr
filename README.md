# Prueba Técnica - Ingreso a onr

Este proyecto es una prueba técnica para el proceso de ingreso a la empresa **onr**. A continuación, se describen las características y la arquitectura de la aplicación.

---

## Arquitectura

El proyecto está diseñado para seguir una arquitectura limpia por capas, utilizando **inyección de dependencias** a través de un mecanismo llamado `injectionDependency`. Esta arquitectura asegura una alta flexibilidad y permite adaptar el comportamiento de la aplicación según el entorno de desarrollo.

### Flujo de la Aplicación

1. **Interfaz de Usuario (UI):**  
   Desde la UI se obtienen los casos de uso (Use Cases) necesarios para invocar los servicios requeridos.

2. **Casos de Uso (Use Cases):**  
   Los casos de uso gestionan la lógica del negocio y seleccionan el repositorio adecuado según el modo de desarrollo (por ejemplo, desarrollo local o producción).

3. **Repositorios:**  
   Los repositorios se encargan de acceder a los datos, ya sea desde un servicio remoto, una base de datos local, o simulaciones de datos para pruebas.

---

## Funcionalidades

- **Tema Oscuro y Claro:**  
  La aplicación permite alternar entre un tema oscuro y un tema claro, mejorando la experiencia del usuario según su preferencia.

- **Soporte Multilenguaje:**  
  La aplicación cuenta con una arquitectura preparada para soportar múltiples idiomas. Se utiliza la librería **shared_preferences** para almacenar la configuración de idioma seleccionada por el usuario. Esto permite recordar la preferencia entre sesiones y facilita la implementación de otros idiomas en el futuro sin necesidad de reconfigurar cada vez.  

---

## Librerías Externas

El proyecto utiliza las siguientes librerías externas para facilitar el desarrollo y la funcionalidad:

1. **[get_it: ^8.0.2](https://pub.dev/packages/get_it)**  
   Se utiliza para implementar inyección de dependencias, lo que permite separar la lógica y facilitar el acceso a servicios de manera controlada.  

2. **[provider: ^6.1.2](https://pub.dev/packages/provider)**  
   Actúa como gestor de estado de manera eficiente, reactiva y optimizada en la arquitectura de la aplicación.  

3. **[either_dart: ^1.0.0](https://pub.dev/packages/either_dart)**  
   Se usa para evitar el uso de `try/catch` al manejar errores. Permite parsear funciones de manera flexible, retornando un `Error Entity` en caso de error o el resultado esperado como respuesta positiva.

4. **[infinite_scroll_pagination: ^4.1.0](https://pub.dev/packages/infinite_scroll_pagination)**  
   Se utiliza para implementar paginación en la lista de peliculas al momento de hacer scroll. Esto evita cargar grandes cantidades de datos simultáneamente, lo que puede volver lenta la app y aumentar los costos de consumo de la API.  

5. **[http: ^1.2.2](https://pub.dev/packages/http)**  
   Se emplea para realizar llamadas HTTP y obtener información de las APIs utilizadas en la aplicación.  

6. **[shared_preferences: ^2.3.3](https://pub.dev/packages/shared_preferences)**  
   Se utiliza para almacenar la configuración de idioma seleccionada por el usuario. Esto es útil para admitir múltiples idiomas, permitiendo recordar la preferencia del usuario entre sesiones y facilitar el cambio o la inclusión de otros idiomas en el futuro.

7. **[freezed_annotation: ^2.0.0](https://pub.dev/packages/freezed_annotation)**  
   Se utiliza para generar clases inmutables y con soporte para JSON serialization/deserialization. Facilita la creación de modelos de datos robustos y seguros.

8. **[json_serializable: ^6.0.1](https://pub.dev/packages/json_serializable)**  
   Se utiliza junto con `freezed_annotation` para generar automáticamente el código necesario para la serialización y deserialización de JSON.

9. **[go_router: ^14.8.1](https://pub.dev/packages/go_router)**  
   Se utiliza para la navegación declarativa en Flutter. Facilita la gestión de rutas y la navegación entre pantallas, permitiendo definir rutas de manera clara y concisa, y manejar la navegación de manera eficiente.
---

## Descargar la Aplicación

Si deseas probar la aplicación en Android, puedes descargar el archivo APK desde:  
`/app-prod-release.apk`

---

## Consideraciones

Este proyecto está estructurado para ser fácilmente escalable y adaptable a las necesidades futuras. La separación de responsabilidades y la inyección de dependencias garantizan un código limpio y mantenible.

### Unit Testing

Por tiempo no se realizaron pruebas unitarias, pero si se desean agregar, se podrían incluir pruebas que verifiquen si los widgets se renderizan correctamente y que busquen al menos 2 películas.