# COVID-19 Flutter App

A Flutter app that provides COVID-19 statistics using data from external APIs. This app uses various libraries to visualize and display COVID-19 data globally and by country.

## Features

- Display global COVID-19 statistics.
- Show COVID-19 statistics for specific countries.
- Visualize data with pie charts.
- Animated text effects for a modern look.
- Loading animations using Flutter Spinkit and Shimmer.

## Dependencies

To use this app, you need to add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  http: ^1.1.0
  animated_text_kit: ^4.2.1
  pie_chart: ^5.1.0
  flutter_spinkit: ^5.1.0
  shimmer: ^2.0.0
```

## API Endpoints

This app uses the following API endpoints to fetch COVID-19 data:

- Global statistics: https://disease.sh/v3/covid-19/all
- Country-specific statistics: https://disease.sh/v3/covid-19/countries
  
To integrate these APIs into your app, you can use the http package to make HTTP requests and fetch data.
