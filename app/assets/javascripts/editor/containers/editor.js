import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// import { fetchEvent } from '../actions/event-actions';
// import EventViewer from '../containers/event-viewer';
// import EventForm from '../components/event-form';

export default class Editor extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    return true;
  }

  componentWillMount() {
    // this.props.getEvent();
  }

  render() {

    return (
      <div>
        <h2>Editor</h2>
      </div>
    );
  }
}

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ fetchEvent }, dispatch);
// }

// export default connect(null, mapDispatchToProps)(Editor);
