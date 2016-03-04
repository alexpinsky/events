import FileSaver from 'filesaver.js';

// returns this format: 20160115T030000
export function toCalendarDateFormat(epoch) {

  const date = new Date(parseInt(epoch));

  const year    = `0000${date.getFullYear()}`.slice(-4);
  const month   = `00${date.getMonth() + 1}`.slice(-2);
  const day     = `00${date.getDate()}`.slice(-2);
  const hours   = `00${date.getHours()}`.slice(-2);
  const minutes = `00${date.getMinutes()}`.slice(-2);
  const seconds = `00${date.getMinutes()}`.slice(-2);

  return `${year}${month}${day}T${hours}${minutes}${seconds}Z`;
}

export function saveToFile(data, filename) {

  let blob;

  if (navigator.userAgent.indexOf('MSIE 10') === -1) {
    // chrome or firefox
    blob = new Blob([data]);
  }
  else {
    // ie
    let bb = new BlobBuilder();
    bb.append(data);
    blob = bb.getBlob(`text/x-vCalendar;charset=${document.characterSet}`);
  }

  FileSaver.saveAs(blob, filename);
}