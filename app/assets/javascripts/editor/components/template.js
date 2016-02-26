import React, { Component } from 'react';

export default class Template extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.props.onClick({
      name: this.props.name
    });
  }

  render() {
    const style = {
      background: `url('${this.props.thumbnail_url}') no-repeat`,
      backgroundSize: 'cover'
    };

    return (
      <div className='gallery-theme' style={style} onClick={this.handleClick}></div>
    );
  }
}
