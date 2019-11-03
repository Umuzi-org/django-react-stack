# REDUX folder structure

based on this: https://levelup.gitconnected.com/structure-your-react-redux-project-for-scalability-and-maintainability-618ad82e32b7

TLDR;

- index.js exports everything that should be used outside the redux folder
- types.js exports an object literal with all our action types
- actions.js exports an object made up of action creators
- reducer.js the usual
- operations.js exports the actual functions that should be called to disspatch these actions. Basically acttion creaters are usually wrappen in other logic. That logic goes here
