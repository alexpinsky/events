import React, { Component } from 'react';
import ZeroClipboard from 'zeroclipboard';

export default class CopyButton extends Component {

  constructor(props) {
    super(props);

    this.state = { copied: false };
  }

  componentDidMount() {
    ZeroClipboard.config({
      swfPath: "http://s3-eu-west-1.amazonaws.com/events-assets-static/shared/ZeroClipboard.swf",
      forceHandCursor: true
    });

    const client = new ZeroClipboard(this.copyBtn);

    client.on('ready', ((readyEvent) => {

      client.on('copy', ((event) => {
        event.clipboardData.setData('text/plain', this.props.getSource());
        this.setState({ copied: true });
        setTimeout((() => this.setState({ copied: false })), 1000);
      }))
    }));
  }

  btnClassName() {
    return this.state.copied ? 'copy-icon link-copied' : 'copy-icon';
  }

  render() {

    return (
      <div className='btn-wrapper'>
        <div title='copy url' className={this.btnClassName()} ref={ (ref) => this.copyBtn = ref } />
      </div>
    );
  }
}
