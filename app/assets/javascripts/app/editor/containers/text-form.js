import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import TextLine from '../components/text-line';
import { setText, setColor, setFontFamily, setFontSize } from '../actions/text-actions';

export default class TextForm extends Component {
  constructor(props) {
    super(props);

    this.handleTextChange  = this.handleTextChange.bind(this);
    this.handleColorChange = this.handleColorChange.bind(this);
    this.handleFontChange  = this.handleFontChange.bind(this);
    this.handleSizeChange  = this.handleSizeChange.bind(this);
  }

  handleTextChange(newText, index) {
    this.props.setText(newText, index);
  }

  handleColorChange(newColor, index) {
    this.props.setColor(newColor, index);
  }

  handleFontChange(newFont, index) {
    this.props.setFontFamily(newFont, index);
  }

  handleSizeChange(newSize, index) {
    this.props.setFontSize(newSize, index);
  }

  render() {

    return (
      <div className='text-edit'>
        <div className='text-line-wrapper 1'>
          <TextLine index={1}
                    text={this.props.texts[1]}
                    onTextChange={this.handleTextChange}
                    onColorChange={this.handleColorChange}
                    onFontChange={this.handleFontChange}
                    onSizeChange={this.handleSizeChange} />
        </div>
        <div className='text-line-wrapper 2'>
          <TextLine index={2}
                    text={this.props.texts[2]}
                    onTextChange={this.handleTextChange}
                    onColorChange={this.handleColorChange}
                    onFontChange={this.handleFontChange}
                    onSizeChange={this.handleSizeChange} />
        </div>
        <div className='text-line-wrapper 3'>
          <TextLine index={3}
                    text={this.props.texts[3]}
                    onTextChange={this.handleTextChange}
                    onColorChange={this.handleColorChange}
                    onFontChange={this.handleFontChange}
                    onSizeChange={this.handleSizeChange} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  const actions = {
    setText, setColor, setFontFamily, setFontSize
  };

  return bindActionCreators(actions, dispatch);
}

function mapStateToProps(state) {
  return { texts: state.event.texts };
}

export default connect(mapStateToProps, mapDispatchToProps)(TextForm);
