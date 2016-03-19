import React, { Component } from 'react';
import FontsList from './fonts-list';

export default class FontPicker extends Component {

  constructor(props) {
    super(props);

    var result = $.grep(this.props.fonts, function(font, index) {
      return font.value === this.props.font;
    }.bind(this));

    this.handleOpenCloseClick = this.handleOpenCloseClick.bind(this);
    this.handleChange         = this.handleChange.bind(this);

    this.state = { isOpen: false, font: result[0] };
  }

  handleOpenCloseClick() {
    this.setState({isOpen: !this.state.isOpen});
  }

  handleChange(newFont) {
    this.props.onChange(newFont.value);
    this.setState({font: newFont});
  }

  truncate(text) {
    if (text.length > 12) {
      return text.substring(0, 9) + '...';
    }
    else {
      return text;
    };
  }

  render() {
    var fontsList;
    if (this.state.isOpen) {
      fontsList = <FontsList
                    fonts={this.props.fonts}
                    handleClick={this.handleChange}
                    handleOutsideClick={this.handleOpenCloseClick} />;
    }
    else {
      fontsList = null;
    };

    return (
      <div className='font-wrapper'>
        <div className="selected-font" onClick={this.handleOpenCloseClick}>
          {this.truncate(this.state.font.name)}
        </div>
        {fontsList}
      </div>
    )
  }
}

FontPicker.defaultProps = {
  fonts: [
    { name: 'נרקיס בלוק', value: "'narkis_block'" },
    { name: 'אלף', value: "'Alef', sans-serif" },
    { name: 'Oswald', value: "'Oswald', sans-serif" },
    { name: 'Gidugu', value: "'Gidugu', sans-serif" },
    { name: 'Six Caps', value: "'Six Caps', sans-serif" },
    { name: 'Tauri', value: "'Tauri', sans-serif" },
    { name: 'Julius Sans', value: "'Julius Sans One', sans-serif" },
    { name: 'Actor', value: "'Actor', sans-serif" },
    { name: 'Quattrocento Sans', value: "'Quattrocento Sans', sans-serif" },
    { name: 'Hammersmith One', value: "'Hammersmith One', sans-serif" },
    { name: 'Karla', value: "'Karla', sans-serif" },
    { name: 'Anton', value: "'Anton', sans-serif" },
    { name: 'Francois One', value: "'Francois One', sans-serif" },
    { name: 'Rozha One', value: "'Rozha One', serif" },
    { name: 'Fanwood Text', value: "'Fanwood Text', serif" },
    { name: 'Prata', value: "'Prata', serif" },
    { name: 'Cinzel', value: "'Cinzel', serif" },
    { name: 'Playfair Display', value: "'Playfair Display SC', serif" },
    { name: 'Lobster', value: "'Lobster', cursive" },
    { name: 'Vibur', value: "'Vibur', cursive" },
    { name: 'Yesteryear', value: "'Yesteryear', cursive" },
    { name: 'Berkshire Swash', value: "'Berkshire Swash', cursive" },
    { name: 'Leckerli One', value: "'Leckerli One', cursive" },
    { name: 'Grand Hotel', value: "'Grand Hotel', cursive" },
    { name: 'Open Sans', value: "'Open Sans', sans-serif" },
    { name: 'Ubuntu', value: "'Ubuntu', sans-serif" },
    { name: 'Judson', value: "'Judson', serif" },
    { name: 'Lily Script', value: "'Lily Script One', cursive" },
    { name: 'Arvo', value: "'Arvo', serif" },
    { name: 'Vollkorn', value: "'Vollkorn', serif" },
    { name: 'Libre Baskerville', value: "'Libre Baskerville', serif" },
    { name: 'Vidaloka', value: "'Vidaloka', serif" },
    { name: 'Montserrat', value: "'Montserrat', sans-serif" },
    { name: 'Raleway', value: "'Raleway', sans-serif" },
    { name: 'Nunito', value: "'Nunito', sans-serif" },
    { name: 'Amatic SC', value: "'Amatic SC', cursive" },
    { name: 'Satisfy', value: "'Satisfy', cursive" },
    { name: 'Permanent Marker', value: "'Permanent Marker', cursive" },
    { name: 'Pinyon Script', value: "'Pinyon Script', cursive" },
    { name: 'Niconne', value: "'Niconne', cursive" },
    { name: 'Homemade Apple', value: "'Homemade Apple', cursive" },
    { name: 'Sacramento', value: "'Sacramento', cursive" }

  ]
};
