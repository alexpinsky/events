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

const INITIAL_STATE = {
  id: null,
  name: null,
  url: null,
  state: null,
  template: { name: 'paris' },
  texts: {
    1: {},
    2: {},
    3: {}
  },
  pictures: {
    1: {},
    2: {},
    3: {},
    4: {}
  },
  appearance: {
    background: {
      type: 'color',
      color: 'white'
    }
  },
  information: {
    in_use: false,
    summary: null,
    location: null,
    start_time: null,
    end_time: null
  }
};

export default class EventWrapper {

  constructor(event) {
    this.event = event;
  }

  static newEvent() {
    // TODO: The text keeps it style when flipping through templates -
    // Need to update the text's style upon template change !
    return Object.assign({}, INITIAL_STATE, { texts: Paris.defaultProps.texts });
  }

  isPublished() {
    return this.event.state == EventStates.published;
  }

  isPending() {
    return this.event.state == EventStates.pending;
  }

  isNew() {
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
}
