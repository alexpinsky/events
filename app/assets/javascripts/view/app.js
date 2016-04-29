import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EventViewer from '../shared/containers/event-viewer';
import Spinner from '../shared/components/spinner';
import { setEvent } from './actions';

export default class App extends Component {

  componentDidMount() {
    const event = $('.view-container').data('event');
    this.props.setEvent(event);
  }


  render() {
    if (this.props.event.id) {
      return <EventViewer />
    }
    else {
      return <Spinner />
    }
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ setEvent }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event }
}

export default connect(mapStateToProps, mapDispatchToProps)(App);
