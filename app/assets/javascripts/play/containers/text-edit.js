import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { updateText } from '../actions/index'

export class TextEdit extends Component {
  constructor(props) {
    super(props);

    this.handleChange = this.handleChange.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    console.log('nextProps (TextEdit)', nextProps);
    return true;
  }

  handleChange(e) {
    this.props.updateText({
      newText: e.target.value,
      id: e.target.getAttribute('data-id')
    });
  }

  renderTexts() {
    let texts = [];

    _.forEach(this.props.texts, (obj, id) => {
      texts.push(
        <input key={id} value={obj.text} onChange={this.handleChange} data-id={id} />
      );
    });

    return texts;
  }

  render() {
    return (
      <div>
        {this.renderTexts()}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ updateText }, dispatch);
}

function mapStateToProps({ event }) {
  return { texts: event.texts };
}

export default connect(mapStateToProps, mapDispatchToProps)(TextEdit);
