$(document).ready(function() {
  json = JSON.parse($('#test').attr('data-json'))
  ReactDOM.render(
    <Main event={json} />,
    document.getElementById('test')
  );
});