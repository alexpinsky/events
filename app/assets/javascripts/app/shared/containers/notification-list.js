import { _ } from 'lodash';

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Notification from '../components/notification';
import { closeNotification } from '../actions/notification-actions';
import { NotificationTypes } from '../../../enums';

export default class NotificationList extends Component {

  constructor(props) {
    super(props);

    this.handleClose = this.handleClose.bind(this);
  }

  handleClose(id, type) {
    this.props.closeNotification(id, type);
  }

  renderNotifications() {

    const notices = _.map(this.props.notifications.notices, (text, id) => {
      return <Notification type={NotificationTypes.notice}
                    key={id}
                    id={id}
                    text={text}
                    onClose={this.handleClose} />
    })

    const alerts = _.map(this.props.notifications.alerts, (text, id) => {
      return <Notification type={NotificationTypes.alert}
                    key={id}
                    id={id}
                    text={text}
                    onClose={this.handleClose} />
    })

    return _.concat(notices, alerts);
  }

  render() {

    return (
      <div className='notifications'>
        {this.renderNotifications()}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closeNotification }, dispatch);
}

function mapStateToProps(state) {
  return { notifications: state.notifications }
}

export default connect(mapStateToProps, mapDispatchToProps)(NotificationList);
