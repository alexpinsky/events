import React, { Component } from 'react';

export default class ProgressBar extends Component {

  render() {
    return (
      <div className='progress-bar' style={{width: `${this.props.progress}%`}}></div>
    );
  }
}
