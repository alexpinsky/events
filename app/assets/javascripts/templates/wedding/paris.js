import React from 'react';
import Base from '../base';
import SlideShow from '../shared/slide-show';

export default class Paris extends Base {

  renderSpecific() {
    const mergedText = this.mergedText();

    return (
      <div className="wedding paris event-wrapper">

        <div className='images-container'>
          <SlideShow pictures={this.mergedPictures()} />
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

        {this.renderCalendarButton()}
      </div>
    );
  }
}

Paris.defaultProps = {
  texts: {
    1: { text: '21/12/15', font: "'Six Caps', sans-serif", color: "#000", size: 6 },
    2: { text: 'save the date', font: "'Six Caps', sans-serif", color: "#000", size: 6 },
    3: { text: 'Natasha & Jonathan', font: "'Fanwood Text', serif", color: "#000", size: 1.5 }
  },
  pictures: {
    1: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155178/fygmiuwcd0l8i1ql4ghi.jpg' }
  },
};
