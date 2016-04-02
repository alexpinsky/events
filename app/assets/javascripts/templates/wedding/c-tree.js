import React from 'react';
import Base from '../base';
import SlideShow from '../shared/slide-show';

export default class CTree extends Base {

  renderSpecific() {
    const mergedText = this.mergedText();

    return (
      <div className="wedding c_tree event-wrapper">
        <div className='container'>

          <div className='top-wrapper'>
            <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/c_tree/assets/top.svg"/>
          </div>

          <div className='text-wrapper-1' style={this.textStyle({ order: 1, text: mergedText[1] })}>
            <div id="text_1">{mergedText[1].text}</div>
          </div>

          <div className='text-wrapper-2' style={this.textStyle({ order: 2, text: mergedText[2] })}>
            <div id="text_2">{mergedText[2].text}</div>
          </div>

          <div className='text-wrapper-3' style={this.textStyle({ order: 3, text: mergedText[3] })}>
            <div id="text_3">{mergedText[3].text}</div>
          </div>

          <div className='line-wrapper'>
            <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/c_tree/assets/line.svg"/>
          </div>

          {this.renderCalendarButton()}

          <div className='images-container'>
            <SlideShow pictures={this.mergedPictures()} />
          </div>
        </div>
      </div>
    );
  }
}

CTree.defaultProps = {
  texts: {
    1: { text: '21/12/15', font: "'Lobster', cursive", color: "#000", size: 2.5 },
    2: { text: 'SAVE THE DATE', font: "'Lobster', cursive", color: "#000", size: 2.5 },
    3: { text: 'NATASHA & JONATHAN', font: "'Quattrocento Sans', sans-serif", color: "#000", size: 1.5 }
  },
  pictures: {
    1: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155222/pseakqxvyadsncahzpmp.jpg' }
  },
};
