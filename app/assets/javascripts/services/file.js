import FileSaver from 'filesaver.js';
import Q from 'q';

const FILES_ENDPOINT = '/api/v1/files/cloudinary';

export default class File {

  static upload() {
    return Q.Promise((resolve, reject, notify) => {
      let fileInput = $('.cloudinary-fileupload');

      fileInput.bind('cloudinarydone', (e, data) => {
        fileInput.unbind('cloudinarydone');
        fileInput.unbind('fileuploadfail');
        fileInput.unbind('fileuploadprogress');

        resolve(data.result.url);
      });

      fileInput.bind('fileuploadfail', (e, data) => reject(data));

      fileInput.bind('fileuploadprogress', (e, data) => notify(data));

      fileInput.click();
    });
  }

  static delete(url) {
    return Q.Promise((resolve, reject) => {
      $.ajax({
        url: FILES_ENDPOINT,
        data: { url: url },
        type: 'DELETE',
        dataType: 'json'
      });

      resolve();
    });
  }

  static saveAs(data, filename) {

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
}
