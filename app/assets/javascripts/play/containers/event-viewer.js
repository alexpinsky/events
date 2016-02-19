import React, { Component } from 'react';
import { connect } from 'react-redux';

export class EventViewer extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    // console.log('nextProps (EventViewer)', nextProps);
    return true;
  }

  renderTexts() {
    let texts = [];

    _.forEach(this.props.event.texts, (value, key) => {
      texts.push(
        <div key={key}>
          {value.text}
        </div>
      );
    });

    return texts;
  }

  render() {
    return (
      <div>
        <h2>{this.props.event.name}</h2>
        {this.renderTexts()}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { event: state.event };
}

export default connect(mapStateToProps)(EventViewer);