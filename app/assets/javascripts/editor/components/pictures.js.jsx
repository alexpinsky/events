var Pictures = React.createClass({
  handleAddPicture: function() {
    return 'https://events-assets-users.s3.amazonaws.com/uploads/development/picture/image/27/image_2.jpg';
  },

  handleRemovePicture: function() {
  },

  render: function() {
    var picturesSize = this.props.pictures.length;
    var pictures = this.props.pictures.map(function(picture, index) {
      return (
        <Picture
          key={index}
          initialUrl={picture.url}
          order={picture.order}
          isLast={index == picturesSize - 1}
          addPicture={this.handleAddPicture}
          removePicture={this.handleRemovePicture} />
      )
    }.bind(this));
    return (
      <div className='pics-tiles'>
        {pictures}
      </div>
    )
  }
});
