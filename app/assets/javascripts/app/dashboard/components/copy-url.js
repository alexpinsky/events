import React, { Component } from 'react';
import CopyButton from './copy-button';

export default class CopyUrl extends Component {

  constructor(props) {
    super(props);

    this.handleUrlFocus   = this.handleUrlFocus.bind(this);
    this.handleCopySource = this.handleCopySource.bind(this);
  }

  handleUrlFocus() {
    $(this.urlInput).select();
  }

  handleCopySource() {
    return $(this.urlInput).val();
  }

  render() {

    return (
      <div className='url-wrapper'>
        <CopyButton getSource={this.handleCopySource} />
        <input type="text"
               readOnly
               value={this.props.url}
               onFocus={this.handleUrlFocus}
               ref={ (ref) => this.urlInput = ref } />
      </div>
    );
  }
}
