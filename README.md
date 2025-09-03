This docker container can be used to make a website available via onion service
on Heroku.

To find out how to use containers on Heroku please check:

https://devcenter.heroku.com/articles/container-registry-and-runtime

To deploy this container please run:

```
$ heroku container:push web -a <app-id>

$ heroku container:release web -a <app-id>

```

You can open your app on the clear web and you will find the address to the onion
service.

There are things that might still go wrong and have not been tested. 
