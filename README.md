# django-react-stack

This is a template repo to be used when kicking off projects that make use of Django and React together.

## Autoformatters

We use autoformatters

- black for Python
- ESLint+Prettier for JS

## Backend

- Python3.7. However, this stack should just work with 3.8 as well for most purposes. virtualenvwrapper and gae don't work with 3.8 yet
- Django
- CORS headers are managed with this: https://pypi.org/project/django-cors-headers/

That's more or less where it ends. Bolt on what you need:

### Authentication

recommend trying out https://django-allauth.readthedocs.io/en/latest/

### Exposing APIs

- REST: https://www.django-rest-framework.org/
- GraphQL: https://docs.graphene-python.org/projects/django/en/latest/
  (note, using GraphQL increases the FE learning curve by a lot. But it is a powerful thing. Approach with caution)

## Frontend

- React
- React Router DOM: https://reactjs.org/docs/code-splitting.html#route-based-code-splitting
- Redux
- Redux sagas: https://redux-saga.js.org/docs/introduction/BeginnerTutorial.html
- redux logger: https://github.com/LogRocket/redux-logger

Please Note: Redux and sagas is hella powerful. BUT it adds a lot of complexity and cognitive load. If you don't need it, rather just use Hooks.

Whether you use redux or not, try to avoid class based compoents (rather use function components as much as possible). If you need to use stuff like ComponentDidMount rather use effect hooks. It's the merging best practice and leads to a more optimised application

### posible future changes

- NextJS

## Database

- Postgresql
- google cloud proxy for interacting with staging/prod databases

## Localhost development

Launch the database in one terminal:

```
cd database/localhost
docker-compose up
```

Then Django is already set up ot play with it nicely. In another terminal this will all just work:

```
cd backend
python manage.py migrate
python manage.py test
python manage.py runserver
python manage.py dbshell
python manage.py shell
```

Then in another terminal you can launch the React app

```
cd frontend
npm start
```
