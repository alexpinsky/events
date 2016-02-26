import React from 'react';

import Paris from '../templates/paris';
import Colaze from '../templates/colaze';
import CTree from '../templates/c-tree';
import Simple from '../templates/simple';

const PARIS_TEMPLATE  = 'paris';
const COLAZE_TEMPLATE = 'colaze';
const C_TREE_TEMPLATE = 'c_tree';
const SIMPLE_TEMPLATE = 'simple';

export function mapEventToTemplate(event) {
  switch (event.template.name) {
    case PARIS_TEMPLATE:
      return <Paris event={event} />;
    case COLAZE_TEMPLATE:
      return <Colaze event={event} />
    case C_TREE_TEMPLATE:
      return <CTree event={event} />
    case SIMPLE_TEMPLATE:
      return <Simple event={event} />
  }
}