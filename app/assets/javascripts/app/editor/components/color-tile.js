import React, { Component } from 'react';

export default class ColorTile extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.onClick(this.props.tile);
  }

  render() {
    let style = { background: this.props.tile.color };

    return (
      <div className='background-tile' style={style} onClick={this.handleClick} />
    );
  }
}
