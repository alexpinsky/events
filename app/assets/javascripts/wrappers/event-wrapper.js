import { EventStates } from '../shared/enums';

export default class EventWrapper {

  constructor(event) {
    this.event = event;
  }

  isPublished() {
    return this.event.state == EventStates.published;
  }

  isUnsaved() {
    return this.event.id === null;
  }
}
