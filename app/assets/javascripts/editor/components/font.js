import React, { Component } from 'react';

export default class Font extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.handleClick(this.props.font);
  }

  render() {
    return (
      <div
        className="font-name"
        style={{fontFamily: this.props.font.value}}
        onClick={this.handleClick} >
        {this.props.font.name}
      </div>
    )
  }
}