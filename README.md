# README

Shop_opening_hours is a web app enabling to manage shops opening hours.
The user can consult shop opening hours and add/edit/delete a shop.

## Install

### Clone the repository

```shell
git clone git@github.com:FabrizioDurand/shop_opening_hours.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version following this link: https://www.ruby-lang.org/fr/documentation/installation/

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

## Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

Launch in two different terminal windows:

```shell
rails s
```

```shell
yarn build --watch
```

## Enjoy

Go to the provided link that should look like `http://127.0.0.1:3000`
