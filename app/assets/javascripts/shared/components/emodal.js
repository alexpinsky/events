import React, { Component } from 'react';

export default class EModal extends Component {
  constructor(props) {
    super(props);

    this.handleCloseClick = this.handleCloseClick.bind(this);
  }

  handleCloseClick() {}
  renderSpecific() {}

  render() {

    if (this.props.modal.open) {
      return (
        <div className='eblocker'>
          <div className='emodal'>
            <div className='modal-logo' />
            <a href="#"
               className="close-modal"
               ref={(ref) => this.modal = ref }
               onClick={this.handleCloseClick} />
            {this.renderSpecific()}
          </div>
        </div>
      );
    }
    else {
      return null;
    }
  }
}
