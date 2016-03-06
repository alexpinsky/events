import React, { Component } from 'react';

const CHECKED_CLASS   = 'checked';
const UNCHECKED_CLASS = '';

export default class Checkbox extends Component {
  constructor(props) {
    super(props);

    this.state = { isChecked: this.props.isChecked }

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    let isChecked = !this.state.isChecked

    if (isChecked) {
      this.props.onCheck();
    }
    else {
      this.props.onUncheck();
    }

    this.setState({ isChecked });
  }

  className() {
    return this.state.isChecked ? CHECKED_CLASS : UNCHECKED_CLASS;
  }

  render() {

    return (
      <div className={`checkbox-element ${this.className()}`} onClick={this.handleClick}></div>
    );
  }
}
