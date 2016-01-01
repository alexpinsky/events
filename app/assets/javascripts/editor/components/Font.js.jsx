var Font = React.createClass({

  handleClick() {
    this.props.handleClick(this.props.font);
  },

  render() {
    return (
      <div
        className="font-name"
        style={{fontFamily: this.props.font.value}}
        onClick={this.handleClick} >
        {this.props.font.name}
      </div>
    )
  }
});