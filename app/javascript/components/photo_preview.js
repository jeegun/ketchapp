import Cropper from 'cropperjs';
const canvas  = document.getElementById("canvas");
const preview = document.getElementById('photo-preview');

const dataURLtoFile = (dataurl, filename) => {
  let arr = dataurl.split(','),
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
        let cropper = new Cropper(canvas, {
          aspectRatio: 1 / 1,
          viewMode: 1
        });
        document.getElementById('btnCrop').addEventListener('click', (event) => {
          event.preventDefault();
          // Get a string base 64 data url
          const croppedImageDataURL = cropper.getCroppedCanvas({ maxWidth: 4096, maxHeight: 4096}).toDataURL("image/png");
          // Create a img tag with base 64 data url
          const croppedImage = document.createElement("IMG");
          croppedImage.classList.add('w-100');
          croppedImage.style.borderRadius = "50%";
          croppedImage.src = croppedImageDataURL;
          // Get rid of existing cropped image preview if there is any
          const child = preview.lastElementChild;
          if (child) {
            preview.removeChild(child);
          }
          // Append cropped image to preview
          preview.appendChild(croppedImage);
          // Convert base 64 data url to a file
          var file = dataURLtoFile(croppedImageDataURL,'profile.png');
          // Create a FileList and and the created file
          let list = new DataTransfer();
          list.items.add(file);
          let myFileList = list.files;
          // Replace input files with files containing the cropped image file
          input.files = myFileList;
          // Close modal
        });
        document.getElementById('btnReset').addEventListener('click', (event) => {
          event.preventDefault();
          cropper.reset();
          const child = preview.lastElementChild;
          if (child) {
            preview.removeChild(child);
          }
          input.files = '';
        });
      };
      img.src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0]);
  }
}
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
export { previewImageOnFileSelect };
