import React, { Component } from 'react';

export default class AccordionPanel extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  handleClick() {
    this.props.onClick(this.props.name);
  }

  open() {
    this.content.slideDown();
  }

  close() {
    this.content.slideUp();
  }

  toggle() {
    this.content.slideToggle();
  }

  render() {

    return (
      <div className={`panel ${this.props.name}`}>
        <div className='panel-header' onClick={this.handleClick}>
          <div className='header-icon vertical-align'></div>
          <div className='header-text'>{this.props.header}</div>
        </div>
        <div className='panel-content' ref={(ref) => this.content = $(ref) }>
          {this.props.content}
        </div>
      </div>
    );
  }
}
