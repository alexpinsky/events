import React from 'react';
import Base from '../base';
import SlideShow from '../shared/slide-show';

export default class CTree extends Base {

  renderSpecific() {
    const texts = this.props.event.texts;
    const information = this.props.event.information;

    return (
      <div className="wedding c_tree event-wrapper">
        <div className='container'>

          <div className='top-wrapper'>
            <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/c_tree/assets/top.svg"/>
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

          <div className='line-wrapper'>
            <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/c_tree/assets/line.svg"/>
          </div>

          {this.renderCalendarButton(information)}

          <div className='images-container'>
            <SlideShow pictures={this.props.event.pictures} />
          </div>
        </div>
      </div>
    );
  }
}
