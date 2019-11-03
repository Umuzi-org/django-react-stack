import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App";
import * as serviceWorker from "./serviceWorker";

ReactDOM.render(<App />, document.getElementById("root"));

// REDUX VERSION

// import React from "react";
// import { render } from "react-dom";
// import { applyMiddleware, combineReducers, createStore } from "redux";

// // Logger with default options
// import logger from "redux-logger";
// see https://github.com/LogRocket/redux-logger

// import { Home, Profile, Whatever } from "./reducers";
// import App from "./App";

// const store = createStore(
//   combineReducers({ Home, Profile, Whatever }),
//   applyMiddleware(logger)
// );

// render(<App store={store} />, document.getElementById("root"));

////////////////

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
