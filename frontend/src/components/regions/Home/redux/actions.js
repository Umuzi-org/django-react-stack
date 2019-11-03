// action creators

import types from "./types.js";

export default {
  doThing: value => {
    return {
      type: types.ACTION_TYPE_1,
      value: value
    };
  }
};
