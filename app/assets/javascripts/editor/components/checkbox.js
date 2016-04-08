import React, { Component } from 'react';

const CHECKED_CLASS   = 'checked';
const UNCHECKED_CLASS = '';

export default class Checkbox extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    return this.props.isChecked != nextProps.isChecked;
  }

  handleClick() {
    let isChecked = !this.props.isChecked

    if (isChecked) {
      this.props.onCheck();
    }
    else {
      this.props.onUncheck();
    }

    this.setState({ isChecked });
  }

  className() {
    return this.props.isChecked ? CHECKED_CLASS : UNCHECKED_CLASS;
  }

  render() {

    return (
      <div className={`checkbox-element ${this.className()}`} onClick={this.handleClick}></div>
    );
  }
}
