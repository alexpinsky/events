import React, { Component } from 'react';

import FontPicker from './font-picker';
import ColorPicker from './color-picker';

export default class TextLine extends Component {
  constructor(props) {
    super(props);

    this.handleTextChange  = this.handleTextChange.bind(this);
    this.handleFontChange  = this.handleFontChange.bind(this);
    this.handleColorChange = this.handleColorChange.bind(this);
    this.handleSizeChange  = this.handleSizeChange.bind(this);
    this.handleFocusIn     = this.handleFocusIn.bind(this);
    this.handleFocusOut    = this.handleFocusOut.bind(this);
  }

  componentDidMount() {
    let input = $(this.textInput);
    input.focusin(this.handleFocusIn);
    input.focusout(this.handleFocusOut);
  }

  componentWillUnmout() {
    let input = $(this.textInput);
    input.unbild('focusin');
    input.unbild('focusout');
  }

  handleFocusIn(e) {
    let input = $(e.target);
    let icon  = input.siblings('.input-icon');

    input.css('border', '1px solid rgb(255, 141, 9)');
    icon.css("background", `url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/${this.props.index}_icon_hover.svg)`);
  }

  handleFocusOut(e) {
    let input = $(e.target);
    let icon  = input.siblings('.input-icon');

    input.css('border', '1px solid rgb(127, 159, 255)')
    icon.css("background", `url(https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/editor/${this.props.index}_icon.svg)`);
  }

  handleTextChange(e) {
    this.props.onTextChange($(this.textInput).val(), this.props.index);
  }

  handleFontChange(newFont) {
    this.props.onFontChange(newFont, this.props.index);
  }

  handleColorChange(newColor) {
    this.props.onColorChange(newColor, this.props.index);
  }

  handleSizeChange(e) {
    this.props.onSizeChange($(this.sizeInput).val(), this.props.index);
  }

  render() {
    const index = this.props.index;
    const text  = this.props.text;

    return (
      <div className="text-line">
        <div className='input-wrapper'>
          <div className={`input-icon icon-${index}`}></div>
          <input value={text.text}
                 onChange={this.handleTextChange}
                 ref={(ref) => this.textInput = ref} />
        </div>
        <div className='appearance-wrapper'>
          <div className='text-font'>
            <div className="font-family">
              <div className="prefix">FONT</div>
              <FontPicker font={text.font} onChange={this.handleFontChange} />
            </div>
          </div>
          <div className='text-color'>
            <div className="prefix">COLOR</div>
            <ColorPicker color={text.color} onChange={this.handleColorChange} />
          </div>
          <div className='text-size'>
            <div className="prefix">SIZE</div>
              <input value={text.size}
                     step="0.1"
                     className="font-size"
                     type="number"
                     onChange={this.handleSizeChange}
                     ref={(ref) => this.sizeInput = ref} />
          </div>
        </div>
      </div>
    );
  }
}
