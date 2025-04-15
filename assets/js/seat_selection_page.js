document.addEventListener('DOMContentLoaded', function () {
    let reservedSeats = JSON.parse(document.getElementById('reservedSeats').textContent);
    console.log("Reserved Seats:", reservedSeats);

    const seats = document.querySelectorAll('.seat');
    let count = 0;
    const ticketBtn = document.getElementById('ticket-btn');
    const hiddenInput = document.getElementById('selected_seats_input');
    const priceInput = document.getElementById('price_input');
    const seatPrice = 150;
    let selectedSeats = [];

    seats.forEach(seat => {
        const seatLabel = seat.getAttribute('data-seat');

        if (reservedSeats.includes(seatLabel)) {
            seat.style.color = '#B6116B'; // Reserved color
            seat.style.cursor = 'disabled';
            seat.style.pointerEvents = 'none';
        } else {
            seat.style.color = 'white';
            seat.addEventListener('click', function () {
                if (this.style.color === 'white' || this.style.color === '') {
                    this.style.color = '#09FBD3';
                    count++;
                    if (seatLabel) {
                        selectedSeats.push(seatLabel);
                    }
                } else {
                    this.style.color = 'white';
                    count--;
                    if (seatLabel) {
                        selectedSeats = selectedSeats.filter(seat => seat !== seatLabel);
                    }
                }

                ticketBtn.value = count > 0 ? 'Get Ticket (' + count + ' selected)' : 'Get Ticket';
                hiddenInput.value = selectedSeats.join(', ');
                priceInput.value = count * seatPrice;
                console.log("Selected seats:", selectedSeats);
                console.log("Total Price:", count * seatPrice);
            });
        }
    });
});

let subMenu = document.getElementById("js-sub-menu");

function toggleMenu(){
    subMenu.classList.toggle("js-open-menu");
}


document.addEventListener("DOMContentLoaded", function () {
    const ticketBtn = document.getElementById("ticket-btn");
    const bookingConfirmation = document.querySelector(".js-booking-confirmation");
    const yesBtn = bookingConfirmation.querySelector("a[href='../pages/ticket.php']");
    const cancelBtn = bookingConfirmation.querySelector("a[href='../pages/cinema_selection_page.php']");
    const bookingForm = ticketBtn.closest("form");

    //HIDE POPUP
    bookingConfirmation.style.display = "none";

    ticketBtn.addEventListener("click", function (e) {
        e.preventDefault();
        if (document.getElementById("selected_seats_input").value === "") {
            alert("Please select at least one seat before proceeding.");
            return;
        }
        bookingConfirmation.style.display = "block";
    });

    yesBtn.addEventListener("click", function (e) {
        e.preventDefault(); 
        bookingForm.submit();
    });

    cancelBtn.addEventListener("click", function (e) {
        e.preventDefault();
        bookingConfirmation.style.display = "none";
    });
});

document.getElementById('notif-bell').addEventListener('click', () => {
    window.location.href = "../pages/transaction_history.php";
})
