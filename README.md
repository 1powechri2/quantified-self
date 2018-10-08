# Quantified Self

ruby version 2.5.1
rails version 5.2.1

Quantified Self is an API application that calculates calorie intake for daily meals
and snacks. All endpoint are JSON. Endpoints include a food index, which shows database items, a food
show page that displays a specific food with name and calories, a post to create new foods,
a patch to update preexisting food items and a delete to destroy preexisting food items.

site url: https://murmuring-temple-61451.herokuapp.com

In order to use the api locally perform these commands in your shell
```
$ git clone git@github.com:1powechri2/quantified-self.git
$ bundle
$ rake db:{create,migrate,seed}
$ rspec
```

## Specific Endpoints

```
GET /api/v1/foods
```

Returns JSON data of all foods in the database

The index will have the following format

```
[ {
    "id": 1,
    "name": "Banana",
    "calories": 150
},
{
    "id": 2,
    "name": "chocolate",
    "calories": 50
} ]

```

```
GET /api/v1/foods/:id
```

Returns a specific food object with the specific :id passed in,
if the :id is invalid a 404 JSON is returned

```
POST /api/v1/foods
```

Creates a new food in the database

the new food needs to be posted in the parameters instead of the body of the post request
in this format

```
{ "food": { "name": "Name of food here", "calories": "Calories here"} }
```

If the food item is successfully created, the food item will be returned. If the food
item is not successfully created a 400 JSON is returned. Name and calories are required fields.

```
PATCH /api/v1/foods/:id
```

Updates an existing food item

just like post the new data needs to be sent by way of parameters in an identical
format like this

```
{ "food": { "name": "Mint", "calories": "14"} }
```

If food item is successfully updated it will be returned. If the food item
is not successfully updated, a 400 JSON will be returned.

```
DELETE /api/v1/foods/:id
```

Deletes the food item with the :id passed in,
if successful a 204 JSON is returned. If the food can’t be found by :id a 404 JSON is returned.
