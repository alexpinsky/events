import { FETCH_CATEGORIES } from '../actions/constants';

const INITIAL_STATE = [
  {
    name: "weddings",
    themes: [
      {
        name: 'paris',
        thumbnail_url: "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/paris/thumbnail.jpg"
      },
      {
        name: 'colaze',
        thumbnail_url: "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/colaze/thumbnail.jpg"
      },
      {
        name: 'c_tree',
        thumbnail_url: "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/c_tree/thumbnail.jpg"
      },
      {
        name: 'simple',
        thumbnail_url: "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/simple/thumbnail.jpg"
      }
    ]
  }
];

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case FETCH_CATEGORIES:
      return action.payload.data;
  }

  return state;
}
