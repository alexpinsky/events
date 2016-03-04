import React, { Component } from 'react';

import SlideShow from '../shared/slide-show';
import CalendarButton from '../shared/calendar-button';

export default class Paris extends Component {

  textStyle(args) {
    return { fontFamily: args.text.font, color: args.text.color, fontSize: `${args.text.size}em`};
  }

  renderCalendarButton(information) {

    if (!information.in_use)
      return null;

    return (
      <div className="calendar-wrapper">
        <CalendarButton information={information} />
      </div>
    );
  }

  render() {
    const texts = this.props.event.texts;
    const information = this.props.event.information

    return (
      <div className="wedding paris event-wrapper">
        <div className='images-container'>
          <SlideShow pictures={this.props.event.pictures} />
        </div>
        <div className='text-wrapper-1' style={this.textStyle({ order: 1, text: texts[1] })}>
          <div id="text_1">{texts[1].text}</div>
        </div>
        <div className='text-wrapper-2' style={this.textStyle({ order: 2, text: texts[2] })}>
          <div id="text_2">{texts[2].text}</div>
        </div>
        <div className='text-wrapper-3' style={this.textStyle({ order: 3, text: texts[3] })}>
          <div id="text_3">{texts[3].text}</div>
        </div>
        {this.renderCalendarButton(information)}
      </div>
    );
  }
}
