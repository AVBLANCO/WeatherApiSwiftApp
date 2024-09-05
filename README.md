# Weather API SwiftUI App

## Descripción

Este proyecto es una aplicación en SwiftUI que consume la API de Open Weather. Implementa una arquitectura limpia (Clean Architecture) con el patrón MVVM (Model-View-ViewModel). La aplicación permite visualizar datos meteorológicos y navegar entre vistas utilizando un coordinador.

## Funcionalidades

- **Página Principal**: La página principal contiene tres botones que permiten la navegación entre diferentes vistas:
  1. **Mostrar MapView**: Reemplaza la vista principal por una vista `MapViews`, que muestra un mapa basado en las coordenadas obtenidas de la API.
  2. **Mostrar OtherFragment**: Reemplaza la vista actual (`MapViews`) por una vista llamada `OtherFragment`, que muestra un historial de datos meteorológicos.
  3. **Obtener Datos Meteorológicos**: Realiza una petición a la API para obtener datos meteorológicos y actualiza la vista correspondiente.

## Arquitectura

La aplicación utiliza una arquitectura limpia basada en el patrón MVVM:
- **Model**: Define las estructuras de datos para la API de Open Weather.
- **ViewModel**: Contiene la lógica de presentación y maneja la comunicación entre el modelo y la vista.
- **View**: La interfaz de usuario implementada en SwiftUI.

## Uso del Coordinador

El coordinador (`AppCoordinator`) gestiona la navegación entre vistas, facilitando el cambio de vistas en la aplicación sin que las vistas individuales se conozcan entre sí.

## API

La aplicación consume la API de Open Weather a través de la siguiente URL:
- **Endpoint**: [Open Weather API](https://rapidapi.com/worldapi/api/open-weather13/playground/apiendpoint_d15cd885-e8e5-49e7-b94b-588c41687aa1)

**Headers**:
- `x-rapidapi-key`: Tu clave de API
- `x-rapidapi-host`: `open-weather13.p.rapidapi.com`

## Instrucciones para Ejecutar

1. **Clona el Repositorio**:
   ```bash
   git clone https://github.com/AVBLANCO/WeatherApiSwiftApp.git
   
2. **Instala las Dependencias**: 
Asegúrate de tener las dependencias necesarias instaladas utilizando Swift Package Manager o CocoaPods.

Configura el Token de la API: Asegúrate de reemplazar la clave de API en el archivo MainViewModel.swift con tu propia clave.

Ejecuta la Aplicación: Abre el proyecto en Xcode y ejecuta la aplicación en un simulador o dispositivo.
