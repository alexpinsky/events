var Main = React.createClass({
  getInitialState() {
    return { event: this.props.event };
  },
  handleChangeName: function(newName) {
    event = this.state.event;
    event.name = newName;
    this.setState({event: event});
  },
  render: function() {
    return (
      <div>
          <ChangeName name={this.props.event.name} changeName={this.handleChangeName} />
      </div>
    )
  }
});

