import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { BackgroundTypes } from '../../../enums';
import ImageTile from '../components/image-tile';
import ColorTile from '../components/color-tile';

import { setBackground } from '../actions/appearance-actions';

export default class BackgroundTiles extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(newBackground) {
    this.props.setBackground(newBackground);
  }

  renderTiles() {

    return (
      this.props.tiles.map((tile) => {

        if (tile.type == BackgroundTypes.image) {
          return <ImageTile key={tile.url} tile={tile} onClick={this.handleClick} />;
        }
        else {
          return <ColorTile key={tile.color} tile={tile} onClick={this.handleClick} />;
        }
      })
    );
  }

  render() {

    return (
      <div>
        <div className='background-tagline'>
          <div className='background-icon'></div>
          <div className='background-text'>choose your favorite background</div>
        </div>
        <div className='background-tiles'>
          {this.renderTiles()}
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ setBackground }, dispatch);
}

export default connect(null, mapDispatchToProps)(BackgroundTiles);

BackgroundTiles.defaultProps = {
  tiles: [
    {
      type: BackgroundTypes.color,
      color: "white"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_W_flowers_enccu0.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_triangular_ts1dpa.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_triangular_b_c8fkq1.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_tiger_b_ymvflz.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_tiger_a_ucn8bw.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683819/P_Stripes_p_vde1oz.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_Stripes_b_m5owjb.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463138738/P_Stars_wcsxmt.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_spots_y_htxdro.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/p_spots_b_oofv0d.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_Planet_w_nqhfd4.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_Planet_b_l3pvaj.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683818/P_picnic_sfcvph.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_party_horrqu.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1463138865/P_modernism_v3cftp.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_Lines_b_x21klh.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_Lines_a_rw1f2w.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_flowery_p_olomdn.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_flowery_b_jh2fhp.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_Birds_y_pu4gsq.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_Birds_w_aznlar.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683816/P_abstract_d_aztrwu.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683816/P_abstract_c_kahrto.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683816/P_abstract_b_ulk7it.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683816/P_abstract_a_cdqdp9.png"
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451684700diagonal_striped_brick_fruxru.png",
    },
    {
      type: BackgroundTypes.image,
      url: "http://res.cloudinary.com/eventit-me/image/upload/v1451684809/swirl_pattern_dj7qd6.png"
    }
  ]
}
