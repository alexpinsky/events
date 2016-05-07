import React, { Component } from 'react';

export default class ImageTile extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.onClick(this.props.tile);
  }

  render() {
    let style = { background: `url(${this.props.tile.url})` };

    return (
      <div className='background-tile' style={style} onClick={this.handleClick} />
    );
  }
}
