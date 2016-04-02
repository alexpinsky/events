import React from 'react';

import Paris from '../templates/wedding/paris';
import Colaze from '../templates/wedding/colaze';
import CTree from '../templates/wedding/c-tree';
import Simple from '../templates/wedding/simple';
import { EventStates } from '../shared/enums';

const PARIS_TEMPLATE  = 'paris';
const COLAZE_TEMPLATE = 'colaze';
const C_TREE_TEMPLATE = 'c_tree';
const SIMPLE_TEMPLATE = 'simple';

export default class EventWrapper {

  constructor(event) {
    this.event = event;
  }

  isPublished() {
    return this.event.state == EventStates.published;
  }

  isUnsaved() {
    return this.event.id == null;
  }

  template() {
    switch (this.event.template.name) {
      case PARIS_TEMPLATE:
        return <Paris event={this.event} />;
      case COLAZE_TEMPLATE:
        return <Colaze event={this.event} />
      case C_TREE_TEMPLATE:
        return <CTree event={this.event} />
      case SIMPLE_TEMPLATE:
        return <Simple event={this.event} />
    }
  }

  updateWithTemplate() {
    switch (this.event.template.name) {
      case PARIS_TEMPLATE:
        return <Paris event={this.event} />;
      case COLAZE_TEMPLATE:
        return <Colaze event={this.event} />
      case C_TREE_TEMPLATE:
        return <CTree event={this.event} />
      case SIMPLE_TEMPLATE:
        return <Simple event={this.event} />
    }
  }
}
