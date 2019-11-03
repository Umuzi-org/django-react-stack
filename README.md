# django-react-stack

This is a template repo to be used when kicking off projects that make use of Django and React together.

## Clean code

We use autoformatters

- black for Python
- ESLint for JS

## Backend

- Python3.7. However, this stack should just work with 3.8 as well for most purposes. virtualenvwrapper and gae don't work with 3.8 yet
- Django
- Django REST Framework
- Authentication

## Frontend

- React
- React Router DOM: https://reactjs.org/docs/code-splitting.html#route-based-code-splitting
- Redux
- Redux sagas: https://redux-saga.js.org/docs/introduction/BeginnerTutorial.html
- redux logger: https://github.com/LogRocket/redux-logger

- ? NextJS

Please Note: Redux and sagas is hella powerful. BUT it adds a lot of complexity and cognitive load. If you don't need it, rather just use Hooks.

## Database

- Postgresql
- google cloud proxy for interacting with staging/prod databases
