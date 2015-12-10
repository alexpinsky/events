var Picture = React.createClass({
  propTypes: {
    initialUrl: React.PropTypes.string.isRequired,
    order: React.PropTypes.number.isRequired,
    isLast: React.PropTypes.bool.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  getInitialState: function() {
    return { url: this.props.initialUrl, destroy: false }
  },

  handleAddPicture: function(e) {
    Q(this.props.addPicture())
    .then(function(newUrl) {
      this.setState({url: newUrl, destroy: false});
    }.bind(this));
  },

  handleRemovePicture: function(e) {
    Q(this.props.removePicture())
    .then(function() {
      this.setState({url: '', destroy: true});
    }.bind(this));
  },

  imageTile: function() {
    var divStyle = { backgroundImage: 'url(' + this.state.url + ')' };
    return (
      <div className='pic-tile image' style={divStyle} >
        <a href="#" className="remove" onClick={this.handleRemovePicture} />
      </div>
    )
  },

  emptyTile: function() {
    return (
      <div className='pic-tile empty'>
        <a href="#" className="add" onClick={this.handleAddPicture} />
      </div>
    )
  },

  isUrlPresent: function() {
    return this.state.url != '';
  },

  marginClass: function() {
    return this.props.isLast ? '' : ' needs-space';
  },

  render: function() {
    var inputCount = this.props.order - 1;
    return (
      <div className='pic-fields'>
        <div className={'tile-wrapper' + this.marginClass()} >
          {this.isUrlPresent() ? this.imageTile() : this.emptyTile()}
        </div>
        <div className='inputs'>
          <input
            id={`event_pictures_attributes_${inputCount}_image`}
            name={`event[picture_attributes][${inputCount}][image]`}
            value={this.state.url}
            type='hidden' />
          <input
            id={`event_pictures_attributes_${inputCount}__destroy`}
            name={`event[picture_attributes][${inputCount}][_destroy]`}
            value={this.state.destroy}
            type='hidden' />
          <input
            id={`event_pictures_attributes_${inputCount}_order`}
            name={`event[picture_attributes][${inputCount}][order]`}
            value={this.props.order}
            type='hidden' />
        </div>
      </div>
    )
  }
});
