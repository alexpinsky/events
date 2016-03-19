import React from 'react';
import Base from '../base';

export default class Colaze extends Base {

  renderWords(str) {
    return str.split(' ').map((word, index) =>
      <div key={`${word}-${index}`}>{word}</div>
    );
  }

  renderSpecific() {
    const texts       = this.props.event.texts;
    const information = this.props.event.information;
    const pictures    = this.props.event.pictures

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
              <img id="image-1" src={pictures[1].url}/>
            </div>

            <div className='colaze-square'>
              <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/colaze/assets/pattern.svg"/>
            </div>
          </div>

          <div className='colaze-row'>

            <div className='colaze-square'>
              <img id="image-2" src={pictures[2].url}/>
            </div>

            <div className='colaze-square border'>
              <div className='text-wrapper-1 text_1 vertical-align' style={this.textStyle({ order: 1, text: texts[1] })}>
                {this.renderWords(texts[1].text)}
              </div>
            </div>

            <div className='colaze-square'>
              <img id="image-3" src={pictures[3].url}/>
            </div>
          </div>

          <div className='colaze-row bottom'>

            <div className='colaze-square relative'>
              <img className='waves-img' src="https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/colaze/assets/waves.svg"/>

              <div className='text-wrapper-2 text_2 vertical-align' style={this.textStyle({ order: 2, text: texts[2] })}>
                {this.renderWords(texts[2].text)}
              </div>
            </div>

            <div className='colaze-square'>
              <img id="image-4" src={pictures[4].url}/>
            </div>

            <div className='colaze-square'>
              <div className='text-wrapper-3 text_3 vertical-align' style={this.textStyle({ order: 3, text: texts[3] })}>
                {this.renderWords(texts[3].text)}
              </div>
            </div>
          </div>
        </div>

        {this.renderCalendarButton(information)}
      </div>
    );
  }
}
