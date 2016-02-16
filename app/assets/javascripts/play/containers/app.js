import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import { _ } from 'lodash';

import { fetchEvent } from '../actions/index';
import EventViewer from '../containers/event-viewer';
import EventForm from '../components/event-form';

export class App extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    console.log('nextProps (App)', nextProps);
    return true;
  }

  componentWillMount() {
    this.props.fetchEvent();
  }

  render() {

    return (
      <div>
        <EventForm />
        <EventViewer />
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchEvent }, dispatch);
}

export default connect(null, mapDispatchToProps)(App);
