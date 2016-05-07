import React, { Component } from 'react';

export default class Notification extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.closeNotification();
  }

  closeNotification() {
    $(this.notification).hide('slow', (() => {
      this.props.onClose(this.props.id, this.props.type)
    }).bind(this));
  }

  componentDidMount() {
    setTimeout((() => {
      this.closeNotification();
     }).bind(this),
      8000
    );
  }

  render() {

    return (
      <div className={`notification ${this.props.type}`} ref={ (ref) => this.notification = ref }>
        <div className='icon'></div>
        <div className='content'>
          <a href='#' className='close' onClick={this.handleClick}>&times;</a>
          {this.props.text}
        </div>
      </div>
    );
  }
}
