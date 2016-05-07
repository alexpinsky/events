import React, { Component } from 'react';
import Font from './font';

export default class FontsList extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  componentWillMount() {
    $(document).bind("click", function(e) {
      var targe = $(e.target);
      if (targe.hasClass('font-name') || targe.hasClass('fonts-list')) {
        return;
      };

      this.props.handleOutsideClick();
    }.bind(this));
  }

  componentWillUnmount() {
    $(document).unbind("click");
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  handleClick(selectedFont) {
    this.props.handleClick(selectedFont);
  }

  render() {
    var fonts = this.props.fonts.map(function(font, index) {
      return (
        <li className="fonts-list-item" key={index} >
          <Font font={font} handleClick={this.handleClick} />
        </li>
      )
    }.bind(this));

    return (
      <ul className="fonts-list">
        {fonts}
      </ul>
    )
  }
}
