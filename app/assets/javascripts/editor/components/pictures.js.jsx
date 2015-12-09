var Pictures = React.createClass({
  getInitialState() {
    return {  };
  },
  handleChangeName: function(newName) {
    // event = this.state.event;
    // event.name = newName;
    // this.setState({event: event});
  },
  render: function() {
    return (
      <div>
        <ChangeName name={'kaka'} changeName={this.handleChangeName} />
      </div>
    )
  }
});
