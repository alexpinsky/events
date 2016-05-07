import React, { Component } from 'react';
import Accordion from './accordion';
import CalendarForm from '../containers/calendar-form';
import TemplatesGallery from '../containers/templates-gallery';
import TextForm from '../containers/text-form';
import Pictures from '../containers/pictures';
import BackgroundTiles from '../containers/background-tiles';

export default class EventForm extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  renderBgAndPics() {
    return (
      <div className='background-and-pics'>
        <div className='background-section'>
          <BackgroundTiles />
        </div>
        <div className='pics-section'>
          <Pictures />
        </div>
      </div>
    );
  }

  render() {

    const items = [
      {
        name: 'templates',
        header: 'templates',
        isOpen: true,
        content: <TemplatesGallery />
      },
      {
        name: 'text',
        header: 'text',
        isOpen: false,
        content: <TextForm />
      },
      {
        name: 'pictures',
        header: 'background & pics',
        isOpen: false,
        content: this.renderBgAndPics()
      },
      {
        name: 'calendar',
        header: 'calendar',
        isOpen: false,
        content: <CalendarForm />
      }
    ];

    return (
      <div className='form'>
        <Accordion items={items} />
      </div>
    );
  }
}
