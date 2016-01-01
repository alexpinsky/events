var TextPresenter = React.createClass({
  render() {
    return (
      <div>{this.props.text}</div>
    );
  }
});

var TextChanger = React.createClass({
  render() {
    return (
      <div onClick={this.props.handleClick}>click!</div>
    );
  }
});

var Main = React.createClass({

  shouldComponentUpdate(nextProps, nextState) {
    return nextProps.text !== this.props.text;
  },

  handleClick() {
    this.props.onTextChange(Math.random().toString(36).slice(-5));
  },

  render() {
    return (
      <div>
        <TextPresenter text={this.props.text} />
        <TextChanger handleClick={this.handleClick} />
      </div>
    );
  }
});


var onTextChange = function(newText) {
  renderComponent(newText);
}


var renderComponent = function(text) {
  ReactDOM.render(
    <Main text={text} onTextChange={onTextChange} />,
    document.getElementById('play')
  );
}

var TEXT = 'first';
renderComponent(TEXT);
