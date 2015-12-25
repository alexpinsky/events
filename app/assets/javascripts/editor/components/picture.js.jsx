var Picture = React.createClass({
  propTypes: {
    order: React.PropTypes.number.isRequired,
    isLast: React.PropTypes.bool.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  getInitialState() {
    return { url: this.props.initialUrl, destroy: false }
  },

  handleAddPicture(e) {
    this.props.addPicture({order: this.props.order})
    .then(function(newUrl) {
      this.setState({url: newUrl, destroy: false});
    }.bind(this),
    function(data) {
      console.log('add-picture-error:');
      console.log(data);
    });
  },

  handleRemovePicture(e) {
    Q(this.props.removePicture({order: this.props.order}))
    .then(function() {
      this.setState({url: '', destroy: true});
    }.bind(this),
    function(data) {
      console.log('remove-picture-error:');
      console.log(data);
    });
  },

  imageTile() {
    var divStyle = { backgroundImage: 'url(' + this.state.url + ')' };
    return (
      <div className='pic-tile image' style={divStyle} >
        <a href="#" className="remove" onClick={this.handleRemovePicture} />
      </div>
    )
  },

  emptyTile() {
    return (
      <div className='pic-tile empty'>
        <a href="#" className="add" onClick={this.handleAddPicture} />
      </div>
    )
  },

  isUrlPresent() {
    return this.state.url != undefined && this.state.url != '';
  },

  marginClass() {
    return this.props.isLast ? '' : ' needs-space';
  },

  render() {
    var inputCount = this.props.order - 1;
    return (
      <div className='pic-fields'>
        <div className={'tile-wrapper' + this.marginClass()} >
          {this.isUrlPresent() ? this.imageTile() : this.emptyTile()}
        </div>
        <div className='inputs'>
          <input
            id={`event_pictures_attributes_${inputCount}_image_url`}
            name={`event[pictures_attributes][${inputCount}][image_url]`}
            value={this.state.url}
            type='hidden' />
          <input
            id={`event_pictures_attributes_${inputCount}__destroy`}
            name={`event[pictures_attributes][${inputCount}][_destroy]`}
            value={this.state.destroy}
            type='hidden' />
          <input
            id={`event_pictures_attributes_${inputCount}_order`}
            name={`event[pictures_attributes][${inputCount}][order]`}
            value={this.props.order}
            type='hidden' />
          <input
            id={`event_pictures_attributes_${inputCount}_id`}
            name={`event[pictures_attributes][${inputCount}][id]`}
            value={this.props.id}
            type="hidden" />
        </div>
      </div>
    )
  }
});
