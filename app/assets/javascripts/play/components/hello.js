import React from 'react';
import { Component } from 'react';

export default class Hello extends Component {
  render() {
    return (
      <div>
        <h1>{this.props.text}</h1>
      </div>
    );
  }
}