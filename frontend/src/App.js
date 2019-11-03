import React from "react";
import { BrowserRouter as Router, Route } from "react-router-dom";

import Home from "./components/regions/Home";

// UNCOMMENT the below if you are using redux
//import { Provider } from 'react-redux'
//import PropTypes from 'prop-types'

// read this: https://redux.js.org/advanced/usage-with-react-router#connecting-react-router-with-redux-app

function App({ store }) {
  return (
    // <Provider store={store}> // UNCOMMENT FOR REDUX

    <Router>
      <Route path="/" component={Home} />
    </Router>

    // </Provider> // UNCOMMENT FOR REDUX
  );
}

// UNCOMMENT FOR REDUX
// App.propTypes = {
//     store: PropTypes.object.isRequired
//   }

export default App;
