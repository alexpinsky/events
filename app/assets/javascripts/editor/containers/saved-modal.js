import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { closeSavedModal, publishEvent } from '../actions/event-actions';

export default class SavedModal extends Component {

  constructor(props) {
    super(props);

    this.handleDoneClick = this.handleDoneClick.bind(this);
  }

  componentDidMount() {
    this.handleOpenClose();
  }

  componentDidUpdate(prevProps, prevState) {
    this.handleOpenClose();
  }

  handleOpenClose() {
    if (this.props.saved_modal.open) {
      $(this.modal).modal({ clickClose: false, escapeClose: false });
    }
    else {
      $.modal.close();
    }
  }

  handleDoneClick(e) {
    this.props.closeSavedModal();
  }

  render() {

    return (
      <div id="event-saved" className="modal" ref={(ref) => this.modal = ref } >
        <div className='modal-logo'></div>
        <a href="#close-modal" rel="modal:close" className="close-modal"></a>
        <div className="modal-header">GREAT! YOUR EVENT HAS BEEN SAVED</div>
        <div className='modal-text'>
          Ready to share your event with the people who are important to you? <a href="#" className="publish">press here</a>
        </div>
        <div className='modal-actions'>
          <a href="#" className="done" onClick={this.handleDoneClick} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeSavedModal, publishEvent }, dispatch);
}

function mapStateToProps(state) {
  return {
    saved_modal: state.modals.saved_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SavedModal);
