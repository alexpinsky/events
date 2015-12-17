// $('.progress_bar').css('width',  + '%');
var ProgressBar = React.createClass({

  render() {
    return (
      <div>{this.props.progress}</div>
    );
  }
});