// Interactive gallery upload
const galleryForm = document.getElementById('gallery-form');
const galleryGrid = document.getElementById('gallery-grid');
const galleryUpload = document.getElementById('gallery-upload');

if (galleryForm && galleryGrid && galleryUpload) {
  galleryForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const file = galleryUpload.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (event) => {
        const img = document.createElement('img');
        img.src = event.target.result;
        img.alt = "User uploaded tattoo";
        galleryGrid.appendChild(img);
      };
      reader.readAsDataURL(file);
    }
  });
}

