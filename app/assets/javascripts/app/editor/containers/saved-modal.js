import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EModal from '../../shared/components/emodal';
import { closeSavedModal, openPublishModal } from '../../shared/actions/modal-actions';

export default class SavedModal extends EModal {

  constructor(props) {
    super(props);

    this.handleDoneClick    = this.handleDoneClick.bind(this);
    this.handlePublishClick = this.handlePublishClick.bind(this);
  }

  handleCloseClick(e) {
    this.props.closeSavedModal();
  }

  handleDoneClick(e) {
    this.props.closeSavedModal();
  }

  handlePublishClick(e) {
    this.props.openPublishModal(this.props.modal.event);
  }

  renderSpecific() {

    return (
      <div id="event-saved">
        <div className="modal-header">GREAT! YOUR EVENT HAS BEEN SAVED</div>
        <div className='modal-text'>
          Ready to share your event with the people who are important to you? <a
             className="publish"
             onClick={this.handlePublishClick} >
            press here
          </a>
        </div>
        <div className='modal-actions'>
          <a className="done" onClick={this.handleDoneClick} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeSavedModal, openPublishModal }, dispatch);
}

function mapStateToProps(state) {
  return {
    modal: state.modals.saved_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SavedModal);
