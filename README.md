# Sweater Weather

Sweater weather is a RESTFUL API built using Rails 5.2 to provide weather forecasts. It uses the Following APIS:

- Google Directions API, to calculate driving time between cities
- Google Geolocation API, to get Lat/Long by place name for use with Darksky API
- Darksky API, to get forecast information for a city
- Flickr API, to get background Images for a city.

The Sweater Weather API is hosted at https://sweater-weather-pd.herokuapp.com/. It can be used in the following ways:

## Get the forecast for a given city
```
GET https://sweater-weather-pd.herokuapp.com/api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

## Get background images for a given city
```
GET https://sweater-weather-pd.herokuapp.com/api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

## Create an account
```
POST https://sweater-weather-pd.herokuapp.com/api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
```
#### Response:
```
status: 201
body:

{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

## Log In
```
POST https://sweater-weather-pd.herokuapp.com/api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
#### Response: 
```
status: 200
body:

{
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

###### Create an account and Log In both return an api key which can be used for the following functionality
## Weather upon arrival at a destination city 
```
POST https://sweater-weather-pd.herokuapp.com/api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO", 
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
