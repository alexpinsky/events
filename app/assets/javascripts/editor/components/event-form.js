import React, { Component } from 'react';
import Accordion from './accordion';
import TemplatesGallery from '../containers/templates-gallery';

export default class EventForm extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  render() {
    const items = [
      { name: 'templates', header: 'templates', isOpen: true, content: <TemplatesGallery /> },
      { name: 'text', header: 'text', isOpen: false, content: <div>some text</div> },
      { name: 'pictures', header: 'background & pics', isOpen: false, content: <div>some text</div> },
      { name: 'calendar', header: 'calendar', isOpen: false, content: <div>some text</div> }
    ];

    return (
      <div className='form'>
        <Accordion items={items} />
      </div>
    );
  }
}
