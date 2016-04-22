import { CLOSE_NOTIFICATION } from './constants';

export function closeNotification(id, type) {

  return {
    type: CLOSE_NOTIFICATION,
    payload: { id: id, type: type }
  };
}
