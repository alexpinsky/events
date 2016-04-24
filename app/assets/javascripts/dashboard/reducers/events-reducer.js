import * as constants from '../../shared/constants';

export default function(state = {}, action) {

  switch (action.type) {
    case constants.FETCH_EVENTS:
      return action.payload.data;
    case constants.UPDATE_EVENT:
      return Object.assign({}, state, changedEvent(action));
    case constants.PUBLISH_EVENT:
      return Object.assign({}, state, changedEvent(action));
    case constants.UNPUBLISH_EVENT:
      return Object.assign({}, state, changedEvent(action));
  }

  return state;
}

function changedEvent(action) {
  let changedEvent = {};
  changedEvent[action.payload.data.id] = action.payload.data;
  return changedEvent;
}
