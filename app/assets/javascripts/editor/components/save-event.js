import React, { Component } from 'react';

export default class SaveEvent extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    $(this.modal).modal({ clickClose: false });
  }

  renderModal() {

    return (
      <div id="save-event" className="modal" ref={(ref) => this.modal = ref } >
        <div className='modal-logo'></div>
        <a href="#close-modal" rel="modal:close" className="close-modal" />
        <div className="modal-header">ALRIGHT, LET'S NAME YOUR EVENT!</div>
        <input className="input-style" type="text" name="event-name" placeholder="type the event name here" />
        <div className='modal-actions'>
          <a href="#" className="save" />
          <a href="#" className="cancel" />
        </div>
        <div className='modal-text'>
          Don't worry! Saving your event does not mean the event will be public.
          No one will be able to see your event until you decide to publish it.
        </div>
      </div>
    );
  }

  render() {

    return (
      <div className='save-wrapper'>
        <a className="save menu-action" href='#' onClick={this.handleClick} />
        <div className='text'>SAVE</div>

        {this.renderModal()}
      </div>
    );
  }
}
