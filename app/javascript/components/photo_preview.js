import Cropper from 'cropperjs';
const canvas  = document.getElementById("canvas");
const preview = document.getElementById('photo-preview');
const previewImageOnFileSelect = () => {
  // select the photo input
  let input = document.getElementById('photo-input');
  if (input) {
    // add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (which retrieves the image url and displays it)
      displayPreview(input);
    })
  }
}

const dataURLtoFile = (dataurl, filename) => {
  var arr = dataurl.split(','),
      mime = arr[0].match(/:(.*?);/)[1],
      bstr = atob(arr[1]),
      n = bstr.length,
      u8arr = new Uint8Array(n);

  while(n--){
      u8arr[n] = bstr.charCodeAt(n);
  }

  return new File([u8arr], filename, {type:mime});
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      const context = canvas.getContext("2d");
      const img = new Image();
      img.onload = () => {
        context.canvas.height = img.height;
        context.canvas.width  = img.width;
        context.drawImage(img, 0, 0);
        var cropper = new Cropper(canvas, {
          aspectRatio: 1 / 1,
          viewMode: 1
        });
        document.getElementById('btnCrop').addEventListener('click', () => {
          // Get a string base 64 data url
          var croppedImageDataURL = cropper.getCroppedCanvas({ maxWidth: 4096, maxHeight: 4096}).toDataURL("image/png");
          console.log(croppedImageDataURL);
          var croppedImage = document.createElement("IMG");
          croppedImage.classList.add('w-100');
          croppedImage.src = croppedImageDataURL;
          const child = preview.lastElementChild;
          if (child) {
            preview.removeChild(child);
          }
          preview.appendChild(croppedImage);
          var file = dataURLtoFile(croppedImageDataURL,'profile.png');
          let list = new DataTransfer();
          list.items.add(file);
          let myFileList = list.files;
          input.files = myFileList;
          document.getElementById('closeModal').click();
        });
        document.getElementById('btnReset').addEventListener('click', () => {
          cropper.reset();
        });
      };
      img.src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById("open").click();
  }
}

export { previewImageOnFileSelect };
