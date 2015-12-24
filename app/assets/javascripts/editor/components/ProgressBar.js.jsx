// $('.progress_bar').css('width',  + '%');
var ProgressBar = React.createClass({

  render() {
    return (
      <div className='progress-bar' style={{width: `${this.props.progress}%`}}></div>
    );
  }
});