import { _ } from 'lodash';
import config from '../config';
import React from 'react';

import Paris from '../templates/wedding/paris';
import Colaze from '../templates/wedding/colaze';
import CTree from '../templates/wedding/c-tree';
import Simple from '../templates/wedding/simple';
import { EventStates } from '../enums';

export default class EventWrapper {

  constructor(event) {
    this.event = event;
  }

  static newEvent() {
    return Object.assign({}, INITIAL_STATE);
  }

  static templateTextStyle(templateName = PARIS_TEMPLATE) {
    const templateTexts = EventWrapper.mapTemplateNameToClass(templateName).defaultProps.texts;

    return {
      1: {
        font: templateTexts[1].font,
        size: templateTexts[1].size,
        color: templateTexts[1].color
      },
      2: {
        font: templateTexts[2].font,
        size: templateTexts[2].size,
        color: templateTexts[2].color
      },
      3: {
        font: templateTexts[3].font,
        size: templateTexts[3].size,
        color: templateTexts[3].color
      }
    }
  }

  static mapTemplateNameToClass(templateName) {
    switch (templateName) {
      case PARIS_TEMPLATE:
        return Paris;
      case COLAZE_TEMPLATE:
        return Colaze;
      case C_TREE_TEMPLATE:
        return CTree;
      case SIMPLE_TEMPLATE:
        return Simple;
    }
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

  fullUrl() {
    return `${config.rootUrl}${this.event.url}`;
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
  texts: EventWrapper.templateTextStyle(),
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
