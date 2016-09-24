## Shrimp

Shrimp is a full-featured, micro-blogging platform which allows users to blog.

Main showcase: https://limitless-reaches-55599.herokuapp.com/

> Credentials:
>
> Email    - example-1@user.com
>
> Password - password

![Cover Image](image.png)


### Features:

 - Registration, authentication
 - Allows users to blog
 - Supports image uploading too. Resizing done in backend
 - Image uploads resricted to less than 5MB
 - Can browse profiles and microposts
 - Gravatar support included
 - Account-activation link sent to the registered email-id
 - 'Forgot password' feature included. Can reset password through a reset-link sent to the registered email-id
 - Pagination
 - 'Remember me' feature included
 - Uses Bcrypt hashing algorithm to store passwords 
 - Responsive UI. Uses Saas.
 - Extensive test coverage using minitest


### Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org), [Bundler](http://bundler.io) and the [Heroku Toolbelt](https://toolbelt.heroku.com/) installed.

```sh
git clone https://github.com/saileshdev/shrimp
cd shrimp
bundle install --without production
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake test
rails server
```

Your app should now be running on [localhost:3000](http://localhost:3000/).


### Deploying to Heroku

```sh
heroku create
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
heroku open
```


### License
MIT License. See LICENSE file. 


### Contributing

Contribution is most welcome, that's the whole idea! Together as a community we can build cool products that can solve real life problems and make our lives easier.

Please take a moment to review the [guidelines for contributing](CONTRIBUTING.md).

* [Bug reports](CONTRIBUTING.md#bugs)
* [Feature requests](CONTRIBUTING.md#features)
* [Pull requests](CONTRIBUTING.md#pull-requests)




 
