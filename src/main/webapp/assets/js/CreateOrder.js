function addOrder() {
    var item = document.getElementById('itemDropdown').value;
    var quantity = document.getElementById('quantity').value;

    var orderList = document.getElementById('orderList');
    var listItem = document.createElement('li');
    listItem.className = 'list-group-item';
    listItem.innerHTML = '<strong>' + item + '</strong> - ' + quantity + ' Kg';

    // Add a remove button to the list item
    var removeButton = document.createElement('button');
    removeButton.className = 'btn btn-danger btn-sm float-right';
    removeButton.innerText = 'Remove';
    removeButton.onclick = function () {
        orderList.removeChild(listItem);
    };

    listItem.appendChild(removeButton);

    orderList.appendChild(listItem);

    document.getElementById('finalSubmitBtn').style.display = 'block';
}


// Function to handle the "Final Submit" button click
document.getElementById('finalSubmitBtn').addEventListener('click', function () {
    // Show the image upload modal
    $('#exampleModal').modal('show');
});

document.getElementById('pickupForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Get values from the form
    const pickupDate = document.getElementById('pickupDate').value;
    const pickupTime = document.getElementById('pickupTime').value;
    
            if (!pickupDate || !pickupTime) {
    // If either pickup date or time is not filled, show an alert and prevent form submission
            alert("Please fill both Pickup Date and Pickup Time.");
            return false;
        	}

    // If both pickup date and time are filled, allow form submission
        	return true;

    // Display confirmation message
    // const confirmationMessage = `Pickup scheduled for ${pickupDate} at ${pickupTime}.`;
    // document.getElementById('confirmation').innerText = confirmationMessage;
});


let createOrder = document.querySelector('.create-order');
let uploadImage = document.querySelector('.upload-image');
let addressDetails = document.querySelector('.address-details');
let confirmationMessage = document.getElementById('confirmation');

let finalButton = document.querySelector('#finalSubmitBtn');
let schedulePick = document.querySelector('#schedulePick');
let backBtn = document.querySelector('.back-btn')
let backBtnAddress = document.querySelector('.back-btn-address')

finalButton.addEventListener('click',() => {
    createOrder.style.display = 'none';
    uploadImage.style.display = 'block';
})

schedulePick.addEventListener('click', ()=>{
    uploadImage.style.display = 'none';
    addressDetails.style.display = 'block';
})

backBtn.addEventListener('click', ()=>{
    uploadImage.style.display = 'none';
    createOrder.style.display = 'block';
})

backBtnAddress.addEventListener('click', ()=>{
    uploadImage.style.display = 'block';
    addressDetails.style.display = 'none';
})

function validatePickupForm() {
        var pickupDate = document.getElementById("pickupDate").value;
        var pickupTime = document.getElementById("pickupTime").value;


    }