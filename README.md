# Sweater Weather

### Specs

* Ruby 2.4.1
* Rails 5.2.3

## Details

This is a solo project completed at the Turing School of Software and Design in the back-end program.

Sweater Weather allows users to obtain forecast information regarding a specified city. If visitors create an account, they can also obtain informatin regarding a city that they are driving to and the weather upon arrival.

## Website

The code is hosted at https://sleepy-harbor-42563.herokuapp.com/

Here are all the possible endpoints:

### Endpoint 1: Forecast
~~~
Get request to https://sleepy-harbor-42563.herokuapp.com/api/v1/forecast

Params - Location: city (e.g. denver, co)

example get request: https://sleepy-harbor-42563.herokuapp.com/api/v1/forecast?location=denver,co


~~~


### Endpoint 2: Background
~~~
Get request to https://sleepy-harbor-42563.herokuapp.com/api/v1/backgrounds

Params - Location: city (e.g. denver, co)

example get request: https://sleepy-harbor-42563.herokuapp.com/api/v1/backgrounds?location=denver,co


~~~


### Endpoint 3: User Registration
~~~
Post request to https://sleepy-harbor-42563.herokuapp.com/api/v1/users

Body - email, password, password confirmation
Headers - content-type, accept

example post request: https://sleepy-harbor-42563.herokuapp.com/api/v1/users

---Headers---

Content-Type: application/json
Accept: application/json

---Body---

{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}

~~~


### Endpoint 4: User Login
~~~
Post request to https://sleepy-harbor-42563.herokuapp.com/api/v1/sessions

Body - email, password
Headers - content-type, accept

example post request: https://sleepy-harbor-42563.herokuapp.com/api/v1/sessions

---Headers---

Content-Type: application/json
Accept: application/json

---Body---

{
  "email": "whatever@example.com",
  "password": "password"
}

~~~


### Endpoint 5: Travel Forecast
~~~
Post request to https://sleepy-harbor-42563.herokuapp.com/api/v1/road_trip

Body - email, password
Headers - content-type, accept

example post request: https://sleepy-harbor-42563.herokuapp.com/api/v1/road_trip

---Headers---

Content-Type: application/json
Accept: application/json

---Body---

{
  "origin": "Denver,CO",
  "destination": "Orlando, FL",
  "api_key": "GdISaQHo-mRkkKWWxIcQyQ"
}

(note: api key is generated when user is created or when you log in)

~~~


