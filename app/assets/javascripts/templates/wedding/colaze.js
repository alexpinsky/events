import React from 'react';
import Base from '../base';

export default class Colaze extends Base {

  renderWords(str) {
    return str.split(' ').map((word, index) =>
      <div key={`${word}-${index}`}>{word}</div>
    );
  }

  renderSpecific() {
    const mergedText     = this.mergedText();
    const mergedPictures = this.mergedPictures();

    return (
      <div className="wedding colaze event-wrapper">
        <div className='container'>

          <div className='colaze-row top'>

            <div className='colaze-square border'>
              <div className='static-text vertical-aligns'>
                <div>SAVE</div>
                <div>THE</div>
                <div>DATE</div>
              </div>
            </div>

            <div className='colaze-square'>
              <img id="image-1" src={mergedPictures[1].url}/>
            </div>

            <div className='colaze-square'>
              <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/colaze/assets/pattern.svg"/>
            </div>
          </div>

          <div className='colaze-row'>

            <div className='colaze-square'>
              <img id="image-2" src={mergedPictures[2].url}/>
            </div>

            <div className='colaze-square border'>
              <div className='text-wrapper-1 text_1 vertical-align' style={this.textStyle({ order: 1, text: mergedText[1] })}>
                {this.renderWords(mergedText[1].text)}
              </div>
            </div>

            <div className='colaze-square'>
              <img id="image-3" src={mergedPictures[3].url}/>
            </div>
          </div>

          <div className='colaze-row bottom'>

            <div className='colaze-square relative'>
              <img className='waves-img' src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/colaze/assets/waves.svg"/>

              <div className='text-wrapper-2 text_2' style={this.textStyle({ order: 2, text: mergedText[2] })}>
                {this.renderWords(mergedText[2].text)}
              </div>
            </div>

            <div className='colaze-square'>
              <img id="image-4" src={mergedPictures[4].url}/>
            </div>

            <div className='colaze-square'>
              <div className='text-wrapper-3 text_3 vertical-align' style={this.textStyle({ order: 3, text: mergedText[3] })}>
                {this.renderWords(mergedText[3].text)}
              </div>
            </div>
          </div>
        </div>

        {this.renderCalendarButton()}
      </div>
    );
  }
}

Colaze.defaultProps = {
  texts: {
    1: { text: 'natasha & jhonathan', font: "'Six Caps', sans-serif", color: "#000", size: 3 },
    2: { text: 'DECEMBER 19', font: "'Quattrocento Sans', sans-serif", color: "#000", size: 1.5 },
    3: { text: '19/12', font: "'Six Caps', sans-serif", color: "#000", size: 8 }
  },
  pictures: {
    1: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155201/toeb5gcbsreb7nbhnrl5.jpg' },
    2: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155202/rqgtlxltnijhtq8rfbz6.jpg' },
    3: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155203/idstet0arkkqkv4nyfzc.jpg' },
    4: { url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451155204/zs52m7nilp2lav2dbdkg.jpg' }
  },
};
