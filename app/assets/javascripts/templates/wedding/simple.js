import React from 'react';
import Base from '../base';
import SlideShow from '../shared/slide-show';

export default class Simple extends Base {

  renderSpecific() {
    const mergedText = this.mergedText();

    return (
      <div className="wedding simple event-wrapper">

        <div className='panel panel-left'>
          <div className='images-container'>
            <SlideShow pictures={this.mergedPictures()} />
          </div>
        </div>

        <div className='panel panel-right'>

          <div className='container'>
            <div className='content-container'>

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
          </div>
        </div>
      </div>
    );
  }
}

Simple.defaultProps = {
  texts: {
    1: { text: '21/12/15', font: "'Rozha One', serif", color: "#000", size: 3 },
    2: { text: 'save the date', font: "'Julius Sans One', sans-serif", color: "#000", size: 4 },
    3: { text: 'Natasha & Jonathan', font: "'Rozha One', serif", color: "#000", size: 4 }
  },
  pictures: {
    1: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155234/yzp6nvo1jziexiqrmo6d.jpg' }
  },
};
