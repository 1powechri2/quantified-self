# Quantified Self

ruby version 2.5.1
rails version 5.2.1

Quantified Self is an API application that calculates calorie intake for daily meals
and snacks. All endpoint are JSON. Endpoints include a food index, which shows database items, a food
show page that displays a specific food with name and calories, a post to create new foods,
a patch to update preexisting food items and a delete to destroy preexisting food items.

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
}]

```


* ...
