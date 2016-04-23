import { _ } from 'lodash';

import { ERROR, UPDATE_EVENT, CLOSE_NOTIFICATION } from '../constants';
import { NotificationTypes } from '../enums';

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case ERROR:
      let newAlerts = {}

      _.each(action.payload.messages, (message) => {
        let alert = {};
        alert[_.uniqueId()] = message;
        _.merge(newAlerts, alert);
      })

      return _.merge({}, state, { alerts: newAlerts });
    case CLOSE_NOTIFICATION:
      if (action.payload.type == NotificationTypes.notice) {
        return Object.assign({}, state, { notices: _.omit(state.notices, [action.payload.id]) });;
      }
      else {
        return Object.assign({}, state, { alerts: _.omit(state.alerts, [action.payload.id]) });;
      }
    case UPDATE_EVENT:
      let newNotices = {};
      newNotices[_.uniqueId()] = 'Your event has been saved';
      return Object.assign({}, state, { notices: newNotices });
  }

  return state;
}

const INITIAL_STATE = {
  alerts: {},
  notices: {}
}
