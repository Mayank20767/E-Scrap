// Initialize Owl Carousel
$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    navText: [
      "<i class='fa fa-caret-left'></i>",
      "<i class='fa fa-caret-right'></i>"
    ],
    autoplay: true,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 3
      },
      1000: {
        items: 5
      }
    }
  })




  function addOrder() {
    // Function to add order to the list
    const itemDropdown = document.getElementById('itemDropdown');
    const quantityInput = document.getElementById('quantity');
    const uploadBtn = document.getElementById('uploadBtn');

    // Get values from the form
    const itemName = itemDropdown.options[itemDropdown.selectedIndex].text;
    const quantity = quantityInput.value;

    // Create list item
    const listItem = document.createElement('li');
    listItem.className = 'list-group-item';
    listItem.innerHTML = `
        <span>${itemName}</span>
        <span>${quantity}</span>
        <button type="button" class="btn btn-danger btn-sm float-right" onclick="removeItem(this)">Remove</button>
    `;

    // Add the list item to the order list
    document.getElementById('orderList').appendChild(listItem);

    // Clear form inputs
    quantityInput.value = '';

    // Show the upload button
    uploadBtn.style.display = 'block';
}

function removeItem(button) {
    // Function to remove item from the order list
    const listItem = button.parentElement;
    listItem.remove();
}

function uploadImage() {
    // Function to handle image upload
    const uploadBtn = document.getElementById('uploadBtn');
    const nextBtn = document.getElementById('nextBtn');

    // Simulate image upload (you can replace this with your actual upload logic)
    const uploadedImage = document.getElementById('uploadImage').files[0];

    if (uploadedImage) {
        nextBtn.disabled = false;
        alert('Image uploaded successfully!');
    } else {
        alert('Please upload an image.');
    }
}

function moveToNextPage() {
    // Function to move to the next page (you can replace this with your actual logic)
    alert('Moving to the next page...');

}


// let pickUp = document.querySelector('.pick-up-modal');
// let uploadImg = document.querySelector('.upload-img-modal')
// let modalNextPopup = document.querySelector('.next-modal-btn');

// modalNextPopup.addEventListener('click', () => {
//     uploadImage.style.display = "none";
//     pickUp.style.display = "block";
// })






document.getElementById('pickupForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Get values from the form
    const pickupDate = document.getElementById('pickupDate').value;
    const pickupTime = document.getElementById('pickupTime').value;

    // Display confirmation message
    const confirmationMessage = `Pickup scheduled for ${pickupDate} at ${pickupTime}.`;
    document.getElementById('confirmation').innerText = confirmationMessage;
});

