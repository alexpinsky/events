var ChangeName = React.createClass({
  getInitialState() {
    return { name: this.props.name };
  },
  handleClick: function(e) {
    this.props.changeName('new name');
  },
  render: function() {
    return (
      <div>
        <h3>{this.props.name}</h3>
        <input type='submit' onClick={this.handleClick} />
      </div>
    )
  }
});