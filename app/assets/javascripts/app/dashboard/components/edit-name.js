import { _ } from 'lodash';
import React, { Component } from 'react';

export default class EditName extends Component {

  constructor(props) {
    super(props);

    this.state = { edit: false };

    this.handleEditClick     = this.handleEditClick.bind(this);
    this.handleQuitEditClick = this.handleQuitEditClick.bind(this);
    this.handleCancelClick   = this.handleCancelClick.bind(this);
    this.handleSubmitClick   = this.handleSubmitClick.bind(this);
    this.handleKeyDown       = this.handleKeyDown.bind(this);
  }

  componentDidMount() {
    document.addEventListener('click', this.handleQuitEditClick);
    document.addEventListener("keydown", this.handleKeyDown);
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.nameInput)
      this.nameInput.focus();
  }

  componentWillUnmount() {
    document.removeEventListener('click', this.handleQuitEditClick);
    document.removeEventListener("keydown", this.handleKeyDown);
  }

  handleEditClick() {
    this.setState({ edit: true });
  }

  handleQuitEditClick(e) {
    if (!this.state.edit)
      return;

    if (!$(e.target).closest(this.editContainer).length && !$(e.target).is(this.editContainer))
      this.setState({ edit: false });
  }

  handleCancelClick() {
    this.setState({ edit: false });
  }

  handleSubmitClick() {
    this.saveName();
  }

  handleKeyDown(e) {
    if (!this.state.edit)
      return;

    switch (e.keyCode) {
      case ENTER_KEY:
        this.saveName();
      case ESCAPE_KEY:
        this.setState({ edit: false });
    }
  }

  saveName() {
    const newName = $(this.nameInput).val()

    if (newName == this.props.name)
      return;

    this.props.onSaveClick(newName);
  }

  render() {
    if (this.state.edit) {
      return (
        <div className='name-edit' ref={ (ref) => this.editContainer = ref }>
          <div className='name vertical-align'>
            <div className='editable-container'>
              <input type='text'
                     defaultValue={this.props.name}
                     ref={ (ref) => this.nameInput = ref } />
              <div className='editable-buttons'>
                <button className='submit' onClick={this.handleSubmitClick}/>
                <button className='cancel' onClick={this.handleCancelClick}/>
              </div>
            </div>
          </div>
        </div>
      );
    }
    else {
      return (
        <div className='name-wrapper' onClick={this.handleEditClick}>
          <div className='name vertical-align'>
            <div className="event-name">{_.truncate(this.props.name, { length: 23 })}</div>
            <div className='edit-icon' />
          </div>
        </div>
      );
    }
  }
}

const ENTER_KEY  = 13;
const ESCAPE_KEY = 27;
